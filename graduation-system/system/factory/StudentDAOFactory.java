package com.system.factory;

import com.system.dao.StudentDAO;
import com.system.daoImpl.StudentDAOImpl;


public class StudentDAOFactory {

	public static StudentDAO getStudentAOInstance(){	//工厂方法
		return new StudentDAOImpl();						//返回DAO实现类实例
	}
}
