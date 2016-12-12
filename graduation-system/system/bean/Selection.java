package com.system.bean;

public class Selection {
	
	private String studentId;
	private String teacherId;
	private int status;
	
	// Constructors

		/** default constructor */
		public Selection() {
		}

		/** minimal constructor */
		public Selection(String studentId) {
			this.studentId = studentId;
		}

		/** full constructor */
		public Selection(String studentId, String teacherId) {
			this.studentId = studentId;
			this.teacherId = teacherId;
		}
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
