package com.system.factory;

import com.system.dao.TeacherDAO;
import com.system.daoImpl.TeacherDAOImpl;


public class TeacherDAOFactory {

	public static TeacherDAO getTeacherAOInstance(){	//工厂方法
		return new TeacherDAOImpl();						//返回DAO实现类实例
	}
}
