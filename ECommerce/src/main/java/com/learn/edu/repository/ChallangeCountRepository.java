package com.learn.edu.repository;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.learn.edu.entity.ChallangeCount;

public interface ChallangeCountRepository extends JpaRepository<ChallangeCount, Integer>{
	@Query( value = "SELECT count(*) as count FROM challange_count c where c.sessionid=:id", nativeQuery = true)
	Map<String, Object> findTotal(@Param("id") String sessionId);
	
	@Transactional
	@Modifying
	@Query( value = "delete FROM challange_count c where c.sessionid=:id", nativeQuery = true)
	void deleteBySessionid(@Param("id") String id);
	
	@Query( value = "select * FROM challange_count c where c.sessionid=:id", nativeQuery = true)
	List<Map<String, Object>> findBySessionid(@Param("id") String id);
	
	
	@Query( value ="SELECT (select count(status) from challange_count where status=1 and sessionid=:id) as correct,(select count(status) from challange_count where status=0 and sessionid=:id) as wrong ,(select sum(totaltime) from challange_count where status=1 and sessionid=:id) as correcttime,(select sum(totaltime) from challange_count where status=0 and sessionid=:id) as wrongtime ", nativeQuery = true)
	Map<String, Object> getresult(@Param("id") String id,@Param("id") String id1,@Param("id") String id2,@Param("id") String id3);
}
