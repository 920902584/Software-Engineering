package com.system.factory;

import com.system.dao.SecretaryDAO;
import com.system.daoImpl.SecretaryDAOImpl;

public class SecretaryDAOFactory {
	public static SecretaryDAO getSecretaryDAOInstance(){	//工厂方法
		return new SecretaryDAOImpl();						//返回DAO实现类实例
	}

}
