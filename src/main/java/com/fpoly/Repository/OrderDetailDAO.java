package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.Entity.OrderDetails;

public interface OrderDetailDAO extends JpaRepository<OrderDetails, Integer>{
	@Query("Select o from OrderDetails o where orders.id= :id")
	List<OrderDetails> FindByOrderid(@Param("id") Integer id);
}
