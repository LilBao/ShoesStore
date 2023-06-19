package com.fpoly.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Users;

@Repository
public interface UserDAO extends JpaRepository<Users, Integer>{	
	@Query("Select o from Users o where o.username = :id")
	Users findUsername(@Param("id") String id);
	
	@Query("Select o from Users o where o.email = ?1")
	Users findByEmails(String email);
}
