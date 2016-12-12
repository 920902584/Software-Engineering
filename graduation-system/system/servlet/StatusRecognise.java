package com.system.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.system.bean.Secretary;
import com.system.bean.Student;
import com.system.bean.Teacher;
import com.system.dao.SecretaryDAO;
import com.system.dao.StudentDAO;
import com.system.dao.TeacherDAO;
import com.system.factory.SecretaryDAOFactory;
import com.system.factory.StudentDAOFactory;
import com.system.factory.TeacherDAOFactory;

public class StatusRecognise extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		String username = request.getParameter("username"); // 接收学生ID参数
		String password = request.getParameter("password"); // 接收系统口令参数
		
		HttpSession session=request.getSession();
        session.setAttribute("username", username);
		
		if (request.getParameter("job").equals("1")) {
			if (username == null || "".equals(username)) { // 判断是否输入学生ID
				request.setAttribute("error", "请输入学生ID！");
				dispatcher = servletContext
						.getRequestDispatcher("/jsp/dologin_failure.jsp");// 设置跳转页面
			} else {
				if (password == null || "".equals(password)) { // 判断是否输入密码
					request.setAttribute("error", "请输入密码！");
					dispatcher = servletContext
							.getRequestDispatcher("/jsp/dologin_failure.jsp");// 设置跳转页面
				} else {
					StudentDAO studentDAO = StudentDAOFactory
							.getStudentAOInstance();// 获得DAO实现实例
					Student student = studentDAO.findStudentById(username);// 查询学生
					if (student == null) {
						request.setAttribute("error", "该学生ID不存在!");
						dispatcher = servletContext
								.getRequestDispatcher("/jsp/userName_Error.jsp");
					} else {
						if (password.equals(student.getPassword())) {
							request.getSession().setAttribute("student",student);// 保存学生信息
							response.sendRedirect("/graduation-system2.1/jsp/student/Main.jsp");
							return;
						} else {
							request.setAttribute("error", "密码不正确！");
							dispatcher = servletContext.getRequestDispatcher("/jsp/password_Error.jsp");
						}
					}
				}
			}
		}else if (request.getParameter("job").equals("2")){
			if (username == null || "".equals(username)) { // 判断是否有输入教师ID
				request.setAttribute("error", "请输入教师ID！");
				dispatcher = servletContext
						.getRequestDispatcher("/jsp/Error.jsp");// 设置跳转页面
			} else {
				if (password == null || "".equals(password)) { // 判断是否有输入密码
					request.setAttribute("error", "请输入密码！");
					dispatcher = servletContext.getRequestDispatcher("/jsp/dologin_failure.jsp");// 设置跳转页面
				} else {
					TeacherDAO teacherDAO = TeacherDAOFactory.getTeacherAOInstance();// 获得DAO实现实例
					Teacher teacher = teacherDAO.findTeacherById(username);// 查询教师
					if (teacher == null) {
						request.setAttribute("error", "该教师ID不存在!");
						dispatcher = servletContext.getRequestDispatcher("/jsp/userName_Error.jsp");
					} else {
						if (password.equals(teacher.getPassword())) {
							request.getSession().setAttribute("teacher",teacher);// 保存教师信息
							response.sendRedirect("/graduation-system2.1/jsp/teacher/Main.jsp");
							return;
						} else {
							request.setAttribute("error", "密码不正确！");
							dispatcher = servletContext.getRequestDispatcher("/jsp/password_Error.jsp");
						}
					}
				}
			}
			
		}else if (request.getParameter("job").equals("3")){
			if (username == null || "".equals(username)) { // 判断是否有输入教师ID
				request.setAttribute("error", "请输入管理员ID！");
				dispatcher = servletContext
						.getRequestDispatcher("/jsp/Error.jsp");// 设置跳转页面
			} else {
				if (password == null || "".equals(password)) { // 判断是否有输入密码
					request.setAttribute("error", "请输入密码！");
					dispatcher = servletContext.getRequestDispatcher("/jsp/dologin_failure.jsp");// 设置跳转页面
				} else {
					SecretaryDAO secDAO = SecretaryDAOFactory.getSecretaryDAOInstance();// 获得DAO实现实例
					Secretary sec = secDAO.findSecretaryById(username);// 查询教师
					if (sec == null) {
						request.setAttribute("error", "该管理员ID不存在!");
						dispatcher = servletContext.getRequestDispatcher("/jsp/userName_Error.jsp");
					} else {
						if (password.equals(sec.getPassword())) {
							request.getSession().setAttribute("secretary",sec);// 保存教师信息
							response.sendRedirect("/graduation-system2.1/jsp/secretary/Main.jsp");
							return;
						} else {
							request.setAttribute("error", "密码不正确！");
							dispatcher = servletContext.getRequestDispatcher("/jsp/password_Error.jsp");
						}
					}
				}
			}
			
		}
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
