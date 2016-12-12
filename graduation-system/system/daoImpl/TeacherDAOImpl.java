package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.bean.Teacher;
import com.system.dao.TeacherDAO;
import com.system.util.DBConnection;

public class TeacherDAOImpl implements TeacherDAO {
		public void addTeacher(Teacher teacher) {
			
		}

		public void updateTeacher(Teacher teacher) {
			
		}

		public List<Teacher> findAllTeacher() {
			Connection conn = DBConnection.getConnection();	//获得连接对象
			String findSQL = "select * from teacher"; //+
						//"order by  teacherId desc limit ?,?";
			PreparedStatement pstmt = null;					//声明预处理对象
			ResultSet rs = null;
			List<Teacher> teachers = new ArrayList<Teacher>();
			try {
				pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
				//pstmt.setInt(1, page.getBeginIndex());		//查询起始点
				//pstmt.setInt(2, page.getEveryPage());		//查询记录数
				rs = pstmt.executeQuery();				//执行查询
				while(rs.next()) {
					Teacher teacher = new Teacher();
					teacher.setTeacherId(rs.getString(1));		//设置学生ID
					teacher.setPassword(rs.getString(2));	//设置教师密码
					teacher.setName(rs.getString(3));	//设置教师姓名
					teacher.setSex(rs.getString(4));	//设置教师性别
					
					teacher.setDirection(rs.getString(5));
					teacher.setTelephone(rs.getString(6));
					teacher.setMailbox(rs.getString(7));
					teacher.setNumberOfStu2014(rs.getInt(8));
					teacher.setConfirmedOfStu2014(getNumOfConfirmed(rs.getString(1),1));
					teacher.setAppliedOfStu2014(getNumOfConfirmed(rs.getString(1),0));
					teachers.add(teacher);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);								//关闭处理集对象
				DBConnection.close(pstmt);							//关闭预处理对象
				DBConnection.close(conn);							//关闭连接对象
			}
			return teachers;
		}

		public Teacher findTeacherById(String teacherId) {
			Connection conn = DBConnection.getConnection();		//获得连接对象
			String findByIDSQL = "select * from " +
							"teacher where teacherId = ?";	//SQL语句
			PreparedStatement pstmt = null;	//声明预处理对象
			ResultSet rs = null;								//声明结果集对象
			Teacher teacher = null;
			try {
				pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
				pstmt.setString(1, teacherId);					//设置参数
				rs = pstmt.executeQuery();						//执行查询
				if(rs.next()) {
					teacher = new Teacher();
					teacher.setTeacherId(rs.getString(1));		//设置学生ID
					teacher.setPassword(rs.getString(2));	//设置教师密码
					teacher.setName(rs.getString(3));	//设置教师姓名
					teacher.setSex(rs.getString(4));	//设置教师性别
					
					teacher.setDirection(rs.getString(5));
					teacher.setTelephone(rs.getString(6));
					teacher.setMailbox(rs.getString(7));
					teacher.setNumberOfStu2014(rs.getInt(8));
					teacher.setConfirmedOfStu2014(getNumOfConfirmed(teacherId,1));
					teacher.setAppliedOfStu2014(getNumOfConfirmed(teacherId,0));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);								//关闭处理集对象
				DBConnection.close(pstmt);							//关闭预处理对象
				DBConnection.close(conn);							//关闭连接对象
			}
			return teacher;
		}
		public void deleteTeacher(String teacherId) {
			
		}
		public int findAllCount() {
			Connection conn = DBConnection.getConnection();	//������Ӷ���
			String findSQL = "select count(*) from teacher";
			PreparedStatement pstmt = null;					//����Ԥ�������
			ResultSet rs = null;
			int count = 0;
			try {
				pstmt = conn.prepareStatement(findSQL);		//���Ԥ������󲢸�ֵ
				rs = pstmt.executeQuery();					//ִ�в�ѯ
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);						//�رս�����
				DBConnection.close(pstmt);					//�ر�Ԥ�������
				DBConnection.close(conn);					//�ر����Ӷ���
			}
			return count;
		}
		
		//获得教师的已确认学生人数和已申请学生人数，1为确认，0为申请
		public int getNumOfConfirmed(String teacherId,int status) {
			Connection conn = DBConnection.getConnection();	
			String findSQL = "select count(*) totalCount from selection where teacherId = '"
					+teacherId+"' and status = "+status;
			PreparedStatement pstmt = null;				
			ResultSet rs = null;
			int theNumOfConfirmed = 0;
			try {
				pstmt = conn.prepareStatement(findSQL);	
				rs = pstmt.executeQuery();			
				
				if(rs.next()) {
					theNumOfConfirmed=rs.getInt("totalCount");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				DBConnection.close(rs);						
				DBConnection.close(pstmt);				
				DBConnection.close(conn);					
			}
			return theNumOfConfirmed;
		}

}
