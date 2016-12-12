package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.bean.Student;
import com.system.dao.StudentDAO;
import com.system.util.DBConnection;

public class StudentDAOImpl implements StudentDAO {
		public void addStudent(Student student) {
			
		}

		public void updateStudent(String studentId,String item,String info) {
			//item更新的对象，info更新的内容
		        
			Connection conn = DBConnection.getConnection();	//获得连接对象
			String updateSQL = "update student set "+item+"=? where studentId = ?";
			PreparedStatement pstmt = null;					//声明预处理对象
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(updateSQL);		//获得预处理对象并赋值
				
				pstmt.setString(1, info);
				pstmt.setString(2, studentId);
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);								//关闭处理集对象
				DBConnection.close(pstmt);							//关闭预处理对象
				DBConnection.close(conn);							//关闭连接对象
			}
		}

		public List<Student> findAllStudent() {
			Connection conn = DBConnection.getConnection();	//获得连接对象
			String findSQL = "select * from student "; //+
						//"order by  studentId desc limit ?,?";
			PreparedStatement pstmt = null;					//声明预处理对象
			ResultSet rs = null;
			List<Student> students = new ArrayList<Student>();
			try {
				pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
				//pstmt.setInt(1, page.getBeginIndex());		//查询起始点
				//pstmt.setInt(2, page.getEveryPage());		//查询记录数
				rs = pstmt.executeQuery();				//执行查询
				while(rs.next()) {
					Student student = new Student();
					student.setStudentId(rs.getString(1));		//设置学生ID
					student.setPassword(rs.getString(2));	//设置学生密码
					student.setName(rs.getString(3));	//设置学生姓名
					student.setSex(rs.getString(4));	//设置学生性别
					student.setGrade(rs.getInt(5));
					student.setProfession(rs.getString(6));
					student.setMajorField(rs.getString(7));
					student.setTelephone(rs.getString(8));
					student.setMailbox(rs.getString(9));
					student.setFreshmanPoint(rs.getFloat(10));
					student.setSophomorePoint(rs.getFloat(11));
					student.setIntroduce(rs.getString(12));
					students.add(student);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);								//关闭处理集对象
				DBConnection.close(pstmt);							//关闭预处理对象
				DBConnection.close(conn);							//关闭连接对象
			}
			return students;
		}

		public Student findStudentById(String studentId) {
			Connection conn = DBConnection.getConnection();		//获得连接对象
			String findByIDSQL = "select * from " +
							"student where studentId = ?";	//SQL语句
			PreparedStatement pstmt = null;	//声明预处理对象
			ResultSet rs = null;								//声明结果集对象
			Student student = null;
			try {
				pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
				pstmt.setString(1, studentId);					//设置参数
				rs = pstmt.executeQuery();						//执行查询
				if(rs.next()) {
					student = new Student();
					student.setStudentId(rs.getString(1));		//设置学生ID
					student.setPassword(rs.getString(2));	//设置学生密码
					student.setName(rs.getString(3));	//设置学生姓名
					student.setSex(rs.getString(4));	//设置学生性别
					student.setGrade(rs.getInt(5));
					student.setProfession(rs.getString(6));
					student.setMajorField(rs.getString(7));
					student.setTelephone(rs.getString(8));
					student.setMailbox(rs.getString(9));
					student.setFreshmanPoint(rs.getFloat(10));
					student.setSophomorePoint(rs.getFloat(11));
					student.setIntroduce(rs.getString(12));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);								//关闭处理集对象
				DBConnection.close(pstmt);							//关闭预处理对象
				DBConnection.close(conn);							//关闭连接对象
			}
			return student;
		}
		public void deleteStudent(String studentId) {
			
		}

}
