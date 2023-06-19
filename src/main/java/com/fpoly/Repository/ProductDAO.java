package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Products;
@Repository
public interface ProductDAO extends JpaRepository<Products, Integer>{
	@Query("Select o from Products o where o.id = :id")
	Products findByID(@Param("id") Integer id);
	
	@Query("Select category.name, sum(o.price), count(o) from Products o group by category.name")
	List<Object[]> getInventory();
	
	@Query("Select o from Products o order by createdate desc")
	List<Products> getNewProdcut();
	
	@Query("Select o from Products o where category.id = :id and not o.id= :prdid ")
	List<Products> findListRelated(@Param("id") String id,@Param("prdid") Integer prdid);

	@Query("Select o from Products o order by o.createdate DESC")
	List<Products> findListNewProduct();
	
	
	@Query(value="select DISTINCT p.id, p.name,p.price, COUNT(Favorite.productid) as 'totalFavorite' from Favorite \r\n"
			+ "	inner join Products p  on Favorite.productId=p.id \r\n"
			+ "	group by p.id,p.name,p.price order by totalFavorite DESC",nativeQuery = true)
	List<Object[]> getFavorite();
	
	@Query(value="select DISTINCT od.productID, od.img, p.name,p.price, o.status, SUM(od.quantity) as 'total' \r\n"
			+ "from Orders o inner join OrdersDetails od on o.id=od.orderId\r\n"
			+ "	inner join Products p  on od.productId=p.id \r\n"
			+ "	group by od.productID,p.name, od.img,p.price,o.status having o.status=1 order by total DESC",nativeQuery = true)
	List<Object[]> getBestSelling();
	
	@Query("Select DISTINCT o from Products o JOIN o.prdDetail pd "
			+ "where o.category.id like :id and pd.color like :color and o.price between :min and :max and o.brand like :brand")
	Page<Products> ListByCategory(@Param("id") String id,@Param("color") String color,@Param("min") Float min,
			@Param("max") Float max,@Param("brand") String brand,Pageable pageable);
	
	List<Products> findByNameLike(String name);
}
