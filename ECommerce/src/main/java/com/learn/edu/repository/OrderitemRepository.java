package com.learn.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.learn.edu.entity.Orderitem;

public interface OrderitemRepository extends JpaRepository<Orderitem, Integer>{

}
