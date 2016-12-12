package com.system.factory;

import com.system.dao.SelectionDAO;
import com.system.daoImpl.SelectionDAOImpl;



public class SelectionDAOFactory {

	public static SelectionDAO getStudentselectionAOInstance(){	//工厂方法
		return new SelectionDAOImpl();						//返回DAO实现类实例
	}
}
