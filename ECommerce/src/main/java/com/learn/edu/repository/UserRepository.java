package com.learn.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.learn.edu.entity.Users;

public interface UserRepository extends JpaRepository<Users,Integer>{

	Users findByUsername(String username);

}
