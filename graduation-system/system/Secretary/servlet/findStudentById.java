package com.system.Secretary.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.bean.Student;
import com.system.dao.StudentDAO;
import com.system.daoImpl.StudentDAOImpl;
import com.system.factory.StudentDAOFactory;

public class findStudentById extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		
		String studentId = request.getParameter("stufind");
		StudentDAOImpl stuDao = new StudentDAOImpl();
		Student stu = stuDao.findStudentById(studentId);
		
		request.setAttribute("stuId", studentId);
		
		if(stu==null){
			dispatcher = servletContext
					.getRequestDispatcher("/jsp/secretary/stufind_Error.jsp");// 设置跳转页面
		}else{
			dispatcher = servletContext.getRequestDispatcher("/jsp/secretary/stuInfo.jsp");
		}
	dispatcher.forward(request, response);// 进行跳转
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
