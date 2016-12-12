package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.system.bean.Project;
import com.system.dao.ProjectDAO;
import com.system.util.DBConnection;

public class ProjectDAOImpl implements ProjectDAO {

	@Override
	public void addProject(String proName,String teacherId) {
		// TODO 添加论文
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into project (projectId,proName,createTime,teacherId) value (?,?,?,?)";
		PreparedStatement pstmt =null;
		
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);
		ProjectDAOImpl pro =new ProjectDAOImpl();
		String proId = String.valueOf(pro.getProjectNum()+1);

		try{
			pstmt=conn.prepareStatement(addSQL);
			pstmt.setString(1, proId);
			pstmt.setString(2, proName);
			pstmt.setString(3, time);
			pstmt.setString(4, teacherId);
			pstmt.execute();
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstmt);
		}

	}

	@Override
	public void updateProject(String projectId ,String item,String info) {
		// TODO 修改论文
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String updateSQL = "update project set "+item+"=? where projectId = ?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(updateSQL);		//获得预处理对象并赋值
			
			pstmt.setString(1, info);
			pstmt.setString(2, projectId);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}

	}

	@Override
	public void deleteProject(String projectId) {
		// TODO 删除论文

	}

	@Override
	public List<Project> selectProject(String teacherId) {
		// TODO 查找特定老师的所有论文
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from project where teacherId=?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Project> pros = new ArrayList<Project>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			pstmt.setString(1, teacherId);		//查询起始点
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Project pro = new Project();
				pro.setProjectId(rs.getString(1));		
				pro.setProName(rs.getString(2));
				pro.setCreateTime(rs.getString(3));
				pro.setTeacherId(rs.getString(4));
				pro.setStudentId(rs.getString(5));
				pros.add(pro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return pros;
	}

	@Override
	public int getProjectNum() {
		// TODO获取论文题目数量
		Connection conn = DBConnection.getConnection();	
		String findSQL = "select count(*) from project";
		PreparedStatement pstmt = null;					
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement(findSQL);		
			rs = pstmt.executeQuery();					
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);						
			DBConnection.close(pstmt);					
			DBConnection.close(conn);					
		}
		return count;
		
	}

	@Override
	public Project getStuProject(String studentId) {
		// TODO 获取特定学生的论文选择
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from project where studentId=?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		Project pro = null;
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			pstmt.setString(1, studentId);		//查询起始点
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				pro = new Project();
				pro.setProjectId(rs.getString(1));		
				pro.setProName(rs.getString(2));
				pro.setCreateTime(rs.getString(3));
				pro.setTeacherId(rs.getString(4));
				pro.setStudentId(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return pro;
	}

	@Override
	public List<Project> findAllProject() {
		// 获取所有论文
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from project ORDER BY teacherId";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Project> projects = new ArrayList<Project>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Project pro = new Project();
				pro.setProjectId(rs.getString(1));		
				pro.setProName(rs.getString(2));
				pro.setCreateTime(rs.getString(3));
				pro.setTeacherId(rs.getString(4));
				pro.setStudentId(rs.getString(5));
				projects.add(pro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return projects;
	}


}
