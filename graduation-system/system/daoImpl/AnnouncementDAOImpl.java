package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.system.bean.Announcement;
import com.system.dao.AnnouncementDAO;
import com.system.util.DBConnection;

public class AnnouncementDAOImpl implements AnnouncementDAO {

	@Override
	public void addAnnouncement(Announcement announcement) {
		// TODO 定义添加公告信息的方法
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into announcement (content,publishedDate,object,promulgator) value (?,?,?,?)";
		PreparedStatement pstmt =null;
		
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);

		try{
			pstmt=conn.prepareStatement(addSQL);
			pstmt.setString(1, announcement.getContent());
			pstmt.setString(2, time);
			pstmt.setString(3, announcement.getObject());
			pstmt.setString(4, announcement.getPromulgator());
			pstmt.execute();
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstmt);
		}
	}

	@Override
	public void updateAnnouncement(String object, String info,String promulgator) {
		// TODO 定义修改公告信息的方法
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String updateSQL = "update announcement set content =?, publishedDate =?, promulgator = ? where object = ?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);
		
		try {
			pstmt = conn.prepareStatement(updateSQL);		//获得预处理对象并赋值
			
			pstmt.setString(1, info);
			pstmt.setString(2, time);
			pstmt.setString(3, promulgator);
			pstmt.setString(4, object);
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
	public void deleteAnnouncement(String object) {
		// TODO 定义删除公告信息的方法
		
	}

	@Override
	public Announcement findAnnouncementByObject(String object) {
		// TODO 特定ID获得公告内容
		Connection conn = DBConnection.getConnection();	//获得连接对象
		String findSQL = "select * from announcement where object=?";
		PreparedStatement pstmt = null;					//声明预处理对象
		ResultSet rs = null;
		Announcement ann = null;
		try {
			pstmt = conn.prepareStatement(findSQL);		//获得预处理对象并赋值
			pstmt.setString(1, object);		//查询起始点
			rs = pstmt.executeQuery();				//执行查询
			while(rs.next()) {
				ann = new Announcement();	
				ann.setContent(rs.getString(1));
				ann.setPublishedDate(rs.getString(2));
				ann.setObject(rs.getString(3));
				ann.setPromulgator(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//关闭处理集对象
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		return ann;
	}


}
