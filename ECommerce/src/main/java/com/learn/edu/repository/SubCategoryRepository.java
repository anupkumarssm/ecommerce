package com.learn.edu.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.SubCategory;

public interface SubCategoryRepository extends JpaRepository<SubCategory, Integer>{

	@Query( value = "SELECT sc.*,c.name as categoryname FROM sub_category sc left join category c on sc.category_id=c.id", nativeQuery = true)
	List<Map<String,Object>> findAllCategyWithSubCategory();

	@Query( value = "SELECT sc.* FROM sub_category sc where sc.category_id= :id", nativeQuery = true)
	List<Map<String,Object>> getSubCategory(@Param("id") int categoryId);
	
	@Query( value = "SELECT sc.* FROM sub_category sc", nativeQuery = true)
	List<Map<String,Object>> allSubCategory();
	
	@Query( value = "SELECT sc.id,sc.name,c.name as cname FROM sub_category sc,category c where sc.category_id=c.id order by sc.id asc limit 1", nativeQuery = true)
	Map<String,Object> findOnlyOneQuestionId();

	@Query( value = "SELECT sc.* FROM sub_category sc where sc.id= :id", nativeQuery = true)
	Map<String,Object>  getProductById(@Param("id") int id);

}
