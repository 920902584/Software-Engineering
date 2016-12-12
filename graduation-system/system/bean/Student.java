package com.system.bean;

public class Student {
	private String studentId;//学号
	private String name;//姓名
	private String sex;//性别
	private String password;//密码
	private int grade;
	private String profession;
	private String majorField;
	private String telephone;
	private String mailbox;
	private float freshmanPoint;
	private float sophomorePoint;
	private String introduce;
	
	
	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getStudentId() {
		return studentId;
	}


	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getProfession() {
		return profession;
	}


	public void setProfession(String profession) {
		this.profession = profession;
	}


	public String getMajorField() {
		return majorField;
	}


	public void setMajorField(String majorField) {
		this.majorField = majorField;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getMailbox() {
		return mailbox;
	}


	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}


	public float getFreshmanPoint() {
		return freshmanPoint;
	}


	public void setFreshmanPoint(float freshmanPoint) {
		this.freshmanPoint = freshmanPoint;
	}


	public float getSophomorePoint() {
		return sophomorePoint;
	}


	public void setSophomorePoint(float sophomorePoint) {
		this.sophomorePoint = sophomorePoint;
	}


	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", name=" + name + ", sex="
				+ sex + "]";
	}
	

}
