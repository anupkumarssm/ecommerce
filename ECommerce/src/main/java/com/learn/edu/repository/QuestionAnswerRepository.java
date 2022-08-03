package com.learn.edu.repository;
import java.util.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.QAnswer;
import com.learn.edu.entity.QuestionAnswer;
public interface QuestionAnswerRepository extends JpaRepository<QuestionAnswer, Integer>{
	@Query( value = "SELECT qa.*  from question_answer qa  where qa.question_id=:id", nativeQuery = true)
	Map<String,Object> findAllQuestionAnswery(@Param("id") int parseInt);
	@Query( value = "SELECT qa.*  from question_answer qa  where qa.question_id=:id", nativeQuery = true)
	Map<String,Object> findBySubcategory(@Param("id") int parseInt);
	
	@Query( value = "SELECT * FROM  question_answer qa where qa.question_id=:id", nativeQuery = true)
	Map<String,Object> findByQuestionId(@Param("id") int parseInt);

}
