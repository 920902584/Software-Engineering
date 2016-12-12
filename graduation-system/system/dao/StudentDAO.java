package com.system.dao;

import java.util.List;

import com.system.bean.Student;
import com.system.util.Page;

public interface StudentDAO {
	public void addStudent(Student student);//定义添加学生信息的方法
	public void updateStudent(String studentId,String item,String info);//定义修改学生信息的方法
	public void deleteStudent(String studentId);//定义删除学生信息的方法
	public List<Student> findAllStudent();//定义获取所有学生信息的方法
	public Student findStudentById(String studentId);

}
