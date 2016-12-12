package com.system.factory;

import com.system.dao.selectTimeDAO;
import com.system.daoImpl.selectTimeDAOImpl;

public class selectTimeDAOFactory {
	public static selectTimeDAO getselectTimeDAOInstance(){	//工厂方法
		return new selectTimeDAOImpl();						//返回DAO实现类实例
	}

}
