package com.system.dao;

import com.system.bean.Announcement;

public interface AnnouncementDAO {
	public void addAnnouncement(Announcement announcement);//定义添加公告信息的方法
	public void updateAnnouncement(String object,String info,String promulgator);//定义修改公告信息的方法
	public void deleteAnnouncement(String object);//定义删除公告信息的方法
	public Announcement findAnnouncementByObject(String object);

}
