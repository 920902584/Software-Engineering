package com.system.bean;

public class TeacherSelection {

	private String studentId;
	private String teacherId;
	
	// Constructors

		/** default constructor */
		public TeacherSelection() {
		}

		/** minimal constructor */
		public TeacherSelection(String studentId) {
			this.studentId = studentId;
		}

		/** full constructor */
		public TeacherSelection(String studentId, String teacherId) {
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
}
