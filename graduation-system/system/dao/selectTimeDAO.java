package com.system.dao;

import com.system.bean.selectTime;

public interface selectTimeDAO {
	public void updateSeleceTime(String start,String end);//设定互选时间
	public selectTime getSelectTime();//获取设定时间
}
