package com.system.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.daoImpl.ProjectDAOImpl;
import com.system.daoImpl.SelectionDAOImpl;

public class ProChoose extends HttpServlet {

	/**
	 *
	 * 完成论文题目选择，跳转
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		
		String proId=request.getParameter("projectId");
	    String stuId=request.getParameter("studentId");
        System.out.println("----------"+proId+","+stuId+"----------");
	   
		
        ProjectDAOImpl pro = new ProjectDAOImpl();
        pro.updateProject(proId, "studentId", stuId);
		
		dispatcher = servletContext.getRequestDispatcher("/jsp/student/proChoose.jsp");// 设置跳转页面
		dispatcher.forward(request, response);// 进行跳转
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
