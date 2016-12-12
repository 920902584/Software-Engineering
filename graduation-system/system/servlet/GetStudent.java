package com.system.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.bean.Student;
import com.system.dao.StudentDAO;
import com.system.factory.StudentDAOFactory;

/**
 * 功能：获取学生的登录信息，跳转到学生的导师选择界面
 * @author 铭河
 *
 */

public class GetStudent extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
       
		String studentId = request.getParameter("username");//获得学生ID
		StudentDAO studentDAO
			= StudentDAOFactory.getStudentAOInstance();//获得StudentDAO实例
		Student student = 
				studentDAO.findStudentById(studentId);//查询该ID所对应的学生
		request.setAttribute("student", student); //将消息保存在request范围
		
		
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
