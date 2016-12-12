package com.system.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.daoImpl.SelectionDAOImpl;
import com.system.util.timeJudge;
/**
 * 取消学生的导师选择结果，跳转到学生的导师选择页面。
 * @author 铭河
 *
 */
public class StudentselectionCancel extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		
		timeJudge judge = new timeJudge();
        long LStartTime=judge.getStartTime();
        long LEndTime=judge.getEndTime();
        long LLocalTime=judge.getLocalTime(); 
		
		if ((LLocalTime < LStartTime) || (LLocalTime > LEndTime)) {

			dispatcher = servletContext
					.getRequestDispatcher("/jsp/student/outOfTime.jsp");
		} else {
			String studentId = request.getParameter("studentId");
			SelectionDAOImpl sele = new SelectionDAOImpl();
			sele.deleteStudentselection(studentId);
			dispatcher = servletContext
					.getRequestDispatcher("/jsp/student/Stu_chooseFor_Tea.jsp");// 设置跳转页面
		}
		dispatcher.forward(request, response);// 进行跳转
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
