package com.learn.edu.repository;

import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.ChallengeTime;

public interface ChallengeTimeRepository extends JpaRepository<ChallengeTime, Integer>{

	@Query( value = "select sum(totaltime) as time FROM challange_time c where c.sessionid=:id", nativeQuery = true)
	Map<String, Object> getTimeResult(@Param("id") String sessionId);
	@Transactional
	@Modifying
	@Query( value = "delete FROM challange_time c where c.sessionid=:id", nativeQuery = true)
	void deleteBySessionid(@Param("id") String id);

}
