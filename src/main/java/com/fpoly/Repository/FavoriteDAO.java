package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.Entity.Favorites;

public interface FavoriteDAO extends JpaRepository<Favorites, Integer>{
	@Query("Select count(o) from Favorites o where o.users.id = :id")
	Integer getCountFavorites(@Param("id") Integer id);
	
	@Query("Select o from Favorites o where o.users.id =:usid and o.products.id=:prdid")
	Favorites checkExis(@Param("usid") Integer usid, @Param("prdid") Integer prdid);
	
	@Query("Select o from Favorites o where o.users.id = :id")
	List<Favorites> listByUserid(@Param("id") Integer id);
	

}
