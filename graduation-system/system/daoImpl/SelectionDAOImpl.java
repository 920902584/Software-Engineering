package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.bean.Selection;
import com.system.bean.Student;
import com.system.dao.SelectionDAO;
import com.system.util.DBConnection;

public class SelectionDAOImpl implements SelectionDAO {

	@Override
	public void addStudentselection(String studentId,String teacherId) {
		// TODO 添加学生选择信息的方法
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String findByIDSQL ="INSERT INTO selection VALUES('"+studentId+"','"+teacherId+"',0)";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		
		try {
			pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}

	}

	@Override
	public void updateStudentselection(Student student) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteStudentselection(String studentId) {
		// TODO 取消学生的导师选择
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String CancelByIDSQL ="DELETE FROM selection WHERE studentId = '"+studentId+"'";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		
		try {
			pstmt = conn.prepareStatement(CancelByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
	}

	@Override
	public List<Selection> findAllStudentselection(String teacherId) {
		// TODO 获取选择某个特定导师的所有学生
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from selection WHERE teacherId=? and status=0"; //+
					//"order by  teacherId desc limit ?,?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Selection> stuSelections = new ArrayList<Selection>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			pstmt.setString(1, teacherId);					//设置参数
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Selection stuSelection = new Selection();
				stuSelection.setStudentId(rs.getString("studentId"));	//获取学生ID
				//teacher.setSex(rs.getString(3));	//设置教师性别
				//teacher.setPassword(rs.getString(4));	//设置教师密码
				stuSelections.add(stuSelection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return stuSelections;
	}

	@Override
	public Selection findStudentselectionById(String studentId) {
		// TODO 获取某个特定Id的学生的导师选择数据
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String findByIDSQL = "select * from " +
						"selection where studentId = ?";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		ResultSet rs = null;								//声明结果集对象
		Selection studentselection = null;
		try {
			pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.setString(1, studentId);					//设置参数
			rs = pstmt.executeQuery();						//执行查询
			if(rs.next()) {
				studentselection = new Selection();
				studentselection.setStudentId(rs.getString("studentId"));		
				studentselection.setTeacherId(rs.getString("teacherId"));	
				studentselection.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return studentselection;
	}

	@Override
	public void addTeacherselection(String studentId, String teacherId) {
		// TODO 定义添加教师选择信息的方法
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String AddSQL ="UPDATE selection SET status = 1 WHERE studentId='"
		+studentId+"' and teacherId='"+teacherId+"'";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		
		try {
			pstmt = conn.prepareStatement(AddSQL);		//获得预处理对象并赋值ֵ
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
	}

	@Override
	public void deleteTeacherselection(String studentId) {
		// TODO 取消导师的学生选择
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String CancelByIDSQL ="UPDATE selection SET status = 0 WHERE "
				+"studentId='"+studentId+"'";		//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		
		try {
			pstmt = conn.prepareStatement(CancelByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
	}

	@Override
	public List<Selection> findAllTeacherselection(String teacherId) {
		// TODO 查看特定导师的所有学生选择
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from selection WHERE teacherId=? and status = 1"; //+
					//"order by  teacherId desc limit ?,?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Selection> teaSelections = new ArrayList<Selection>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			pstmt.setString(1, teacherId);					//设置参数
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Selection teaSelection = new Selection();
				teaSelection.setStudentId(rs.getString("studentId"));	//获取学生ID
				//teacher.setSex(rs.getString(3));	//设置教师性别
				//teacher.setPassword(rs.getString(4));	//设置教师密码
				teaSelections.add(teaSelection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return teaSelections;
	}

	@Override
	public Selection findTeacherselectionById(String teacherId) {
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String findByIDSQL = "select * from " +
						"selection where teacherId = ?";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		ResultSet rs = null;								//声明结果集对象
		Selection teacherselection = null;
		try {
			pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.setString(1, teacherId);					//设置参数
			rs = pstmt.executeQuery();						//执行查询
			if(rs.next()) {
				teacherselection = new Selection();
				teacherselection.setTeacherId(rs.getString("teacherId"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return teacherselection;
	}

	@Override
	public List<Selection> findAllSelection() {
		// TODO 列表所有选择信息的方法
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from selection ORDER BY studentId"; //+
					//"order by  teacherId desc limit ?,?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Selection> AllSelections = new ArrayList<Selection>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Selection Selection = new Selection();
				Selection.setStudentId(rs.getString("studentId"));	//获取学生ID
				Selection.setTeacherId(rs.getString("teacherId"));
				Selection.setStatus(rs.getInt("status"));
				AllSelections.add(Selection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return AllSelections;
	}

}
