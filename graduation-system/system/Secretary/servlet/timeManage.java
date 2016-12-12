package com.system.Secretary.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.daoImpl.selectTimeDAOImpl;

public class timeManage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;

		String start = request.getParameter("startTime");
		String end = request.getParameter("endTime");
		
		selectTimeDAOImpl seTime = new selectTimeDAOImpl();
		String strStartTime =start.replace("T"," ");
		String strEndTime = end.replace("T", " ");
		
		seTime.updateSeleceTime(strStartTime, strEndTime);
		
		dispatcher = servletContext.getRequestDispatcher("/jsp/secretary/date.jsp");
		dispatcher.forward(request, response);// 进行跳转
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
