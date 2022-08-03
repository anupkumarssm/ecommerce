package com.learn.edu.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the question_answer database table.
 * 
 */
@Entity
@Table(name="question_answer")
@NamedQuery(name="QuestionAnswer.findAll", query="SELECT q FROM QuestionAnswer q")
public class QuestionAnswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="answer_a")
	private int answerA;

	@Column(name="answer_b")
	private int answerB;

	@Column(name="answer_c")
	private int answerC;

	@Column(name="answer_d")
	private int answerD;

	@Column(name="question_id")
	private int questionId;

	public QuestionAnswer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAnswerA() {
		return this.answerA;
	}

	public void setAnswerA(int answerA) {
		this.answerA = answerA;
	}

	public int getAnswerB() {
		return this.answerB;
	}

	public void setAnswerB(int answerB) {
		this.answerB = answerB;
	}

	public int getAnswerC() {
		return this.answerC;
	}

	public void setAnswerC(int answerC) {
		this.answerC = answerC;
	}

	public int getAnswerD() {
		return this.answerD;
	}

	public void setAnswerD(int answerD) {
		this.answerD = answerD;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

}