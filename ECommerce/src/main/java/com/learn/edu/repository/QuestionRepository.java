package com.learn.edu.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer>{

	@Query( value = "SELECT s.* FROM question s where s.subcategoryid= :id", nativeQuery = true)
	List<Map<String,Object>> findBySubcategory(@Param("id") int parseInt);

	@Query( value = "SELECT s.* FROM question s where s.id= :id", nativeQuery = true)
	Question findByIdQuestion(@Param("id") int parseInt);
	

}
