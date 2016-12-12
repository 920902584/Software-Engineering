package com.system.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.bean.Teacher;
import com.system.dao.TeacherDAO;
import com.system.factory.TeacherDAOFactory;

public class GetTeacher extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String teacherId = request.getParameter("teacherId");//获得教师ID
			TeacherDAO teacherDAO
				= TeacherDAOFactory.getTeacherAOInstance();//获得TeacherDAO实例
			Teacher teacher = 
					teacherDAO.findTeacherById(teacherId);//查询该ID所对应的教师
			request.setAttribute("teacher", teacher); //将消息保存在request范围
			
			
			ServletContext servletContext = getServletContext();
			RequestDispatcher dispatcher = servletContext.
						getRequestDispatcher("/Stu_chooseFor_Tea.jsp");	//跳转到消息显示页
			dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
