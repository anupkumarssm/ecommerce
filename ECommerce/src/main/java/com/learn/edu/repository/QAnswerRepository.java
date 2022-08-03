package com.learn.edu.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.QAnswer;

public interface QAnswerRepository extends JpaRepository<QAnswer, Integer>{

	
	@Query( value = "SELECT qa.* FROM question s left join q_answer qa on qa.question_id=s.id where s.subcategoryid=:id", nativeQuery = true)
	List<Map<String,Object>> findAllByQAnswery(@Param("id") int parseInt);
	 
	@Query( value = "SELECT * FROM  q_answer where question_id=:id", nativeQuery = true)
	Map<String,Object> findAnswerByQuestionId(@Param("id") int parseInt);

}
