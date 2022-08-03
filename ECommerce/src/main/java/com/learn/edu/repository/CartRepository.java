package com.learn.edu.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{
 
	@Query( value = "select * FROM cart c where c.username=:username and c.status=1", nativeQuery = true)
	List<Map<String, Object>> getCartDetailsByUsername(@Param("username") String username);
	
	@Query( value = "select count(*) as count FROM cart c where c.username=:username and c.status=1", nativeQuery = true)
	int getCartItemCountByUsername(@Param("username") String username);

	@Query( value = "select count(*) as count FROM cart c where c.pid=:pid and c.username=:username and c.status=1", nativeQuery = true)
	int findByPidCount(@Param("pid")  String pid, @Param("username")  String username);

	 
}
