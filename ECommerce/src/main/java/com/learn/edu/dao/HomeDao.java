package com.learn.edu.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
 

@Component
public class HomeDao {
	@Autowired
    private JdbcTemplate jdbcTemplate;
	     

	public int addQuestion(final String name, final int subCategoryId,String timestamp) throws SQLException {
		 final String INSERT_SQL = "INSERT into question (name,subcategoryid) VALUES (?,?)";
			KeyHolder keyHolder = new GeneratedKeyHolder();
		 	jdbcTemplate.update(
			    new PreparedStatementCreator() {
			        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
			            PreparedStatement ps =
			                connection.prepareStatement(INSERT_SQL, new String[] {"id"});
			            ps.setString(1,name);   
			            ps.setInt(2,subCategoryId);   
			            return ps;
			        }
			    },
			    keyHolder);
		return keyHolder.getKey().intValue();
	}


	public void addQAns(String q_answer_a, String q_answer_b, String q_answer_c, String q_answer_d, int qid) {
		String query="insert into q_answer(q_answer_a,q_answer_b,q_answer_c,q_answer_d,question_id)values(?,?,?,?,?)";
		  jdbcTemplate.update(query,q_answer_a,q_answer_b,q_answer_c,q_answer_d,qid);
	} 


	public void addQuestAns(int answer_a, int answer_b, int answer_c, int answer_d, int qid) {
		String query="insert into question_answer(answer_a,answer_b,answer_c,answer_d,question_id)values(?,?,?,?,?)";
		  jdbcTemplate.update(query,answer_a,answer_b,answer_c,answer_d,qid);
	}
 
}
