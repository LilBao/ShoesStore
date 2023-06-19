package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.ProductDetail;

@Repository
public interface ProductDetailDAO extends JpaRepository<ProductDetail, Integer>{
	@Query("Select o from ProductDetail o where o.products.id = :id")
	List<ProductDetail> findByPrdID(@Param("id") Integer id);
	
	@Query("Select o from ProductDetail o where o.products.id = :id")
	Page<ProductDetail> findByPrdIDPage(@Param("id") Integer id, Pageable pageable);

	@Query("Select o from ProductDetail o where o.id = :id")
	ProductDetail findByID(@Param("id") Integer id);
	
	@Query("Select o from ProductDetail o where products.id = :id and o.color = :color")
	List<ProductDetail> getImgSizeByColor(@Param("id") Integer id,@Param("color") String color);

}
