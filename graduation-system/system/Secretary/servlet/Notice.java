package com.system.Secretary.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.bean.Announcement;
import com.system.daoImpl.AnnouncementDAOImpl;

public class Notice extends HttpServlet {

	/**
	 * 公告发布
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		String stuObject = request.getParameter("student");
		String teaObject = request.getParameter("teacher");
		String secObject = request.getParameter("secretary");
		String Content = request.getParameter("content");
		String Promulgator = request.getParameter("Id");
		
		if(stuObject != null){
			Announcement ann = new Announcement();
			ann.setContent(Content);
			ann.setObject(stuObject);
			ann.setPromulgator(Promulgator);
			
			AnnouncementDAOImpl annImpl = new AnnouncementDAOImpl();
			if(annImpl.findAnnouncementByObject(stuObject) != null){
				annImpl.updateAnnouncement(stuObject, Content,Promulgator);
			}else{
				annImpl.addAnnouncement(ann);
			}
		}
		if(teaObject != null){
			Announcement ann = new Announcement();
			ann.setContent(Content);
			ann.setObject(teaObject);
			ann.setPromulgator(Promulgator);
			
			AnnouncementDAOImpl annImpl = new AnnouncementDAOImpl();
			if(annImpl.findAnnouncementByObject(teaObject) != null){
				annImpl.updateAnnouncement(teaObject, Content,Promulgator);
			}else{
				annImpl.addAnnouncement(ann);
			}
		}
		if(secObject != null){
			Announcement ann = new Announcement();
			ann.setContent(Content);
			ann.setObject(secObject);
			ann.setPromulgator(Promulgator);
			
			AnnouncementDAOImpl annImpl = new AnnouncementDAOImpl();
			if(annImpl.findAnnouncementByObject(secObject) != null){
				annImpl.updateAnnouncement(secObject, Content,Promulgator);
			}else{
				annImpl.addAnnouncement(ann);
			}
		}
		
		dispatcher = servletContext.getRequestDispatcher("/jsp/secretary/Announce.jsp");
        dispatcher.forward(request, response);// 进行跳转
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
