package com.learn.edu.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the q_answer database table.
 * 
 */
@Entity
@Table(name="q_answer")
@NamedQuery(name="QAnswer.findAll", query="SELECT q FROM QAnswer q")
public class QAnswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="q_answer_a",columnDefinition="TEXT")
	private String qAnswerA;

	@Column(name="q_answer_b",columnDefinition="TEXT")
	private String qAnswerB;

	@Column(name="q_answer_c",columnDefinition="TEXT")
	private String qAnswerC;

	@Column(name="q_answer_d",columnDefinition="TEXT")
	private String qAnswerD;

	@Column(name="question_id")
	private int questionId;

	public QAnswer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getqAnswerA() {
		return qAnswerA;
	}

	public void setqAnswerA(String qAnswerA) {
		this.qAnswerA = qAnswerA;
	}

	public String getqAnswerB() {
		return qAnswerB;
	}

	public void setqAnswerB(String qAnswerB) {
		this.qAnswerB = qAnswerB;
	}

	public String getqAnswerC() {
		return qAnswerC;
	}

	public void setqAnswerC(String qAnswerC) {
		this.qAnswerC = qAnswerC;
	}

	public String getqAnswerD() {
		return qAnswerD;
	}

	public void setqAnswerD(String qAnswerD) {
		this.qAnswerD = qAnswerD;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	} 
	
}