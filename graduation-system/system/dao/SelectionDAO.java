package com.system.dao;

import java.util.List;

import com.system.bean.Selection;
import com.system.bean.Student;

public interface SelectionDAO {

	//以下方法为对学生的选择表（studentselectsion）进行操作
	public void addStudentselection(String studentId,String teacherId);//定义添加学生选择信息的方法
	public void updateStudentselection(Student student);//定义修改学生选择信息的方法
	public void deleteStudentselection(String studentId);//定义删除学生选择信息的方法
	public List<Selection> findAllStudentselection(String studentId);//定义列表显示学生选择信息的方法
	public Selection findStudentselectionById(String studentId);
	
	//以下方法为对教师的选择表（teacherselectsion）进行操作
	public void addTeacherselection(String studentId,String teacherId);//定义添加教师选择信息的方法
	public void deleteTeacherselection(String studentId);//定义删除教师选择信息的方法
	public List<Selection> findAllTeacherselection(String teacherId);//定义列表显示教师选择信息的方法
	public Selection findTeacherselectionById(String teacherId);
	
	public List<Selection> findAllSelection();//定义列表所有选择信息的方法
}
