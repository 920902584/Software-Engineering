package com.system.bean;

/**
 * Studentselection entity. @author MyEclipse Persistence Tools
 */

public class Studentselection implements java.io.Serializable {

	// Fields

	private String studentId;
	private String teacherId;

	// Constructors

	/** default constructor */
	public Studentselection() {
	}

	/** minimal constructor */
	public Studentselection(String studentId) {
		this.studentId = studentId;
	}

	/** full constructor */
	public Studentselection(String studentId, String teacherId) {
		this.studentId = studentId;
		this.teacherId = teacherId;
	}

	// Property accessors

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

}