package com.system.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.system.daoImpl.StudentDAOImpl;

public class DoUpdateInfo extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		
		String URL = request.getParameter("infoURL");
		System.out.println(URL);
		String studentId = request.getParameter("studentId");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String grade = request.getParameter("grade");
		String profession = request.getParameter("profession");
		String majorField = request.getParameter("majorField");
		String telephone = request.getParameter("telephone"); 
		String mailbox = request.getParameter("mailbox"); 
		String password = request.getParameter("password");
		String freshmanPoint = request.getParameter("freshmanPoint"); 
		String sophomorePoint = request.getParameter("sophomorePoint"); 
		String introduce = request.getParameter("introduce");
		
		
		HttpSession session=request.getSession();
        session.setAttribute("telephone", telephone);
        session.setAttribute("mailbox", mailbox);
        session.setAttribute("password", password);
        session.setAttribute("introduce", introduce);
        
       
        
        StudentDAOImpl stuInfo = new StudentDAOImpl();
        stuInfo.updateStudent(studentId, "studentId", studentId);
        stuInfo.updateStudent(studentId, "name", name);
        stuInfo.updateStudent(studentId, "sex", sex);
        stuInfo.updateStudent(studentId, "grade", grade);
        stuInfo.updateStudent(studentId, "profession", profession);
        stuInfo.updateStudent(studentId, "majorField", majorField);
        stuInfo.updateStudent(studentId, "telephone", telephone);
        stuInfo.updateStudent(studentId, "mailbox", mailbox);
        stuInfo.updateStudent(studentId, "introduce", introduce);
        if(URL.contains("stuInfo")){
        	stuInfo.updateStudent(studentId, "freshmanPoint", freshmanPoint);
        	stuInfo.updateStudent(studentId, "sophomorePoint", sophomorePoint);
        }
        if(!password.trim().isEmpty())
        {
        	stuInfo.updateStudent(studentId, "password", password);
        }
        
        
        dispatcher = servletContext.getRequestDispatcher(URL);
        dispatcher.forward(request, response);// 进行跳转

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
