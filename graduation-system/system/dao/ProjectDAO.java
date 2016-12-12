package com.system.dao;

import java.util.List;

import com.system.bean.Project;

public interface ProjectDAO {
	public void addProject(String proName,String teacherId);//添加论文
	public List<Project> selectProject(String teacherId);//查找特定老师的所有论文
	public void updateProject(String projectId ,String item,String info);//修改论文
	public void deleteProject(String projectId);//删除论文
	public int getProjectNum();//获取论文题目数量
	public Project getStuProject(String studentId);//获取特定学生的论文选择
	public List<Project> findAllProject();//获取所有论文

}
