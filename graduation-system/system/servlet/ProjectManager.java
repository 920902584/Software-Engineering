package com.system.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.system.bean.Teacher;
import com.system.daoImpl.ProjectDAOImpl;
import com.system.daoImpl.StudentDAOImpl;
import com.system.daoImpl.TeacherDAOImpl;

public class ProjectManager extends HttpServlet {

	/**
	 * 该servlet用于处理教师提交论文题目，未提交过的题目插入数据库，已提交过的题目更改数据库
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ServletContext servletContext = getServletContext(); // 获得ServletContex
		RequestDispatcher dispatcher = null;
		String teaId = request.getParameter("Id");
		System.out.println(teaId);
		Teacher tea = new TeacherDAOImpl().findTeacherById(teaId);
		
		ProjectDAOImpl pro = new ProjectDAOImpl();
		
		String[] projectId = new String[tea.getNumberOfStu2014()];
		String[] projectName = new String[tea.getNumberOfStu2014()];
		for(int i=1;i<=tea.getNumberOfStu2014();i++)
		{
			
			if((!("").equals(request.getParameter("proId"+i).trim()))&&
					(!("").equals(request.getParameter("proName"+i).trim()))){
				projectId[i-1] = request.getParameter("proId"+i);
				
				System.out.println("修改"+i+projectId[i-1]+" '"+request.getParameter("proName"+i) +"'");
				System.out.println("修改"+i+projectId[i-1]+" '"+ projectName[i-1] +"'");
				
				pro.updateProject(projectId[i-1], "proName", request.getParameter("proName"+i));
			}
			else if((("").equals(request.getParameter("proId"+i).trim()))&&
					(!("").equals(request.getParameter("proName"+i).trim()))){
				
				System.out.println("添加"+i+request.getParameter("proName"+i)+"     "+teaId);
				
				pro.addProject( request.getParameter("proName"+i),teaId);
			}
			else if((!("").equals(request.getParameter("proId"+i).trim()))&&
					(("").equals(request.getParameter("proName"+i).trim()))){
				System.out.println("========无用=========");
			}
		}
		
		
		HttpSession session=request.getSession();
        session.setAttribute("teacherId", teaId);
        
        dispatcher = servletContext.getRequestDispatcher("/jsp/teacher/proManager.jsp");
        dispatcher.forward(request, response);// 进行跳转
	}

	/**
	 * The doPost method of the servlet. <br>
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
