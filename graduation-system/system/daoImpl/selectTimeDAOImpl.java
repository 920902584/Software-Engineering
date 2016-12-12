package com.system.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.bean.Project;
import com.system.bean.selectTime;
import com.system.dao.selectTimeDAO;
import com.system.util.DBConnection;

public class selectTimeDAOImpl implements selectTimeDAO {

	@Override
	public void updateSeleceTime(String start, String end) {
		// TODO 设定互选时间
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String updateSQL = "update selecttime set startTime=?,endTime=? where timeId = 1";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(updateSQL);		//获得预处理对象并赋值
			
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			
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
	public selectTime getSelectTime() {
		// TODO 获取设定时间
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from selecttime where timeId = 1";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		selectTime time = null;
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				time = new selectTime();
				time.setTimeId(rs.getString(1));
				time.setStartTime(rs.getString(2));
				time.setEndTime(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return time;
	}

}
