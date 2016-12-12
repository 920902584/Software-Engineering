package com.system.factory;

import com.system.dao.AnnouncementDAO;
import com.system.daoImpl.AnnouncementDAOImpl;

public class AnnouncementDAOFactory {
	public static AnnouncementDAO getAnnouncementDAOInstance(){	//工厂方法
		return new AnnouncementDAOImpl();						//返回DAO实现类实例
	}

}
