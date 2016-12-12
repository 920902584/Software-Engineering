package com.system.bean;

public class Teacher {
	private String teacherId;//教师号
	private String name;//姓名
	private String sex;//性别
	private String password;//密码
	private String direction;
	private String telephone;
	private String mailbox;
	private int numberOfStu2014;
	private int confirmedOfStu2014;
	private int appliedOfStu2014;
	
	
	public int getConfirmedOfStu2014() {
		return confirmedOfStu2014;
	}



	public void setConfirmedOfStu2014(int confirmedOfStu2014) {
		this.confirmedOfStu2014 = confirmedOfStu2014;
	}



	public int getAppliedOfStu2014() {
		return appliedOfStu2014;
	}



	public void setAppliedOfStu2014(int appliedOfStu2014) {
		this.appliedOfStu2014 = appliedOfStu2014;
	}



	public String getTeacherId() {
		return teacherId;
	}



	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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



	public String getDirection() {
		return direction;
	}



	public void setDirection(String direction) {
		this.direction = direction;
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



	public int getNumberOfStu2014() {
		return numberOfStu2014;
	}



	public void setNumberOfStu2014(int numberOfStu2014) {
		this.numberOfStu2014 = numberOfStu2014;
	}



	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", name=" + name + ", sex="
				+ sex + "]";
	}
	
	

}
