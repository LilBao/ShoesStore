package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Orders;

@Repository
public interface OrderDAO extends JpaRepository<Orders, Integer> {
	@Query("SELECT MAX(o.id) FROM Orders o")
	Integer getLastOrderId();

	@Query("Select count(o) from Orders o where o.status = 0 or o.status=2")
	Integer getPendingRequest();

	@Query("SELECT SUM(o.totalprice) from Orders o where Month(o.createdate) = MONTH(GETDATE()) and Year(o.createdate) = YEAR(GETDATE()) and o.status=1")
	Float getEarningMonth();

	@Query("SELECT SUM(o.totalprice) from Orders o where Year(o.createdate) = YEAR(GETDATE()) and o.status=1")
	Float getEarningAnnual();
	
	@Query("Select o from Orders o where o.status = :status")
	Page<Orders> listOrders(@Param("status") Integer status,Pageable pageable);
	
	@Query("Select o from Orders o where o.status = 1")
	Page<Orders> listOrdered(Pageable pageable);
	
	@Query("Select o from Orders o where o.status = 0")
	Page<Orders> listPendingOrder(Pageable pageable);

	@Query("Select o from Orders o where users.id= :id")
	List<Orders> findByusername(@Param("id") Integer id);
	
}
