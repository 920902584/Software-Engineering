package com.system.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.bean.Selection;
import com.system.bean.selectTime;
import com.system.dao.SelectionDAO;
import com.system.daoImpl.selectTimeDAOImpl;
import com.system.factory.SelectionDAOFactory;
import com.system.util.timeJudge;
/**
 * 功能：获取学生信息，判断学生是否已选择导师，根据结果跳转到不同界面
 * @author 铭河
 *
 */
public class GetStudentselection extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		
		String studentId = request.getParameter("studentId"); // 接收学生ID参数

		SelectionDAO studentselectionDAO = SelectionDAOFactory
				.getStudentselectionAOInstance();// 获得DAO实现实例
		Selection studentselection = studentselectionDAO.findStudentselectionById(studentId);// 查询学生
        
		timeJudge judge = new timeJudge();
        long LStartTime=judge.getStartTime();
        long LEndTime=judge.getEndTime();
        long LLocalTime=judge.getLocalTime(); 
		
		if ((LLocalTime < LStartTime) || (LLocalTime > LEndTime)) {
			
			dispatcher = servletContext
					.getRequestDispatcher("/jsp/student/outOfTime.jsp");
		} else {
			if (studentselection == null) {
				dispatcher = servletContext
						.getRequestDispatcher("/jsp/student/Stu_chooseFor_Tea.jsp");
			} else {
				// request.getSession().setAttribute("student",student);//
				// 保存学生信息
				dispatcher = servletContext
						.getRequestDispatcher("/jsp/student/student_decide.jsp");
			}
		}
		dispatcher.forward(request, response);// 进行跳转
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
