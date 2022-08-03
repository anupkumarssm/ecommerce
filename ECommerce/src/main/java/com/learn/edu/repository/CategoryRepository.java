package com.learn.edu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.learn.edu.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	List<Category> findByStatus(int i);
}
