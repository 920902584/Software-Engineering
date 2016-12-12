package com.system.dao;

import java.util.List;

import com.system.bean.Teacher;

public interface TeacherDAO {
	public void addTeacher(Teacher teacher);//定义添加教师信息的方法
	public void updateTeacher(Teacher teacher);//定义修改教师信息的方法
	public void deleteTeacher(String teacherId);//定义删除教师信息的方法
	public List<Teacher> findAllTeacher();//定义添加教师信息的方法
	public Teacher findTeacherById(String teacherId);
	public int findAllCount();	
	public int getNumOfConfirmed(String teacherId,int status) ;
}
