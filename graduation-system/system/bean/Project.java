package com.system.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Project {
	
	private String projectId;
	private String proName;
	private String createTime;
	private String teacherId;
	private String studentId;
	
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime() {
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);
		this.createTime = time;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
