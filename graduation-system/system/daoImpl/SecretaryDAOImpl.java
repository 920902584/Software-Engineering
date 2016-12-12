package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.bean.Secretary;
import com.system.dao.SecretaryDAO;
import com.system.util.DBConnection;

public class SecretaryDAOImpl implements SecretaryDAO {

	@Override
	public void addSecretary(Secretary secretary) {
		// TODO 定义添加管理员信息的方法
		
	}

	@Override
	public void updateSecretary(String secretaryId, String item, String info) {
		// TODO 定义修改管理员信息的方法
		
	}

	@Override
	public void deleteSecretary(String secretaryId) {
		// TODO 定义删除管理员信息的方法
		
	}

	@Override
	public Secretary findSecretaryById(String secretaryId) {
		// TODO 特定获得管理员
		Connection conn = DBConnection.getConnection();		//获得连接对象
		String findByIDSQL = "select * from " +
						"secretary where secretaryId = ?";	//SQL语句
		PreparedStatement pstmt = null;	//声明预处理对象
		ResultSet rs = null;								//声明结果集对象
		Secretary secretary = null;
		try {
			pstmt = conn.prepareStatement(findByIDSQL);		//获得预处理对象并赋值ֵ
			pstmt.setString(1, secretaryId);					//设置参数
			rs = pstmt.executeQuery();						//执行查询
			if(rs.next()) {
				secretary = new Secretary();
				secretary.setSecretaryId(rs.getString(1));		//设置管理员ID
				secretary.setPassword(rs.getString(2));	//设置管理员密码
				secretary.setName(rs.getString(3));	//设置管理员姓名
				secretary.setTelephone(rs.getString(4));
				secretary.setMailbox(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return secretary;
	}

	@Override
	public List<Secretary> findAllSecretary() {
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from secretary"; //+
					//"order by  teacherId desc limit ?,?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		List<Secretary> secretarys = new ArrayList<Secretary>();
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			//pstmt.setInt(1, page.getBeginIndex());		//查询起始点
			//pstmt.setInt(2, page.getEveryPage());		//查询记录数
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				Secretary secretary = new Secretary();
				secretary.setSecretaryId(rs.getString(1));		//设置管理员ID
				secretary.setPassword(rs.getString(2));	//设置管理员密码
				secretary.setName(rs.getString(3));	//设置管理员姓名
				secretary.setTelephone(rs.getString(4));
				secretary.setMailbox(rs.getString(5));
				secretarys.add(secretary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return secretarys;
	}

}
