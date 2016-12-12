package com.system.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.system.bean.selectTime;
import com.system.daoImpl.selectTimeDAOImpl;

public class timeJudge {
	public long getStartTime(){
		long LStartTime = 0 ;
		selectTimeDAOImpl stdi = new selectTimeDAOImpl();
		selectTime time = stdi.getSelectTime();
		return LStartTime =Long.valueOf(time.getStartTime().replace("-", "").replace(" ", "").replace(":",""));
	}
	public long getEndTime(){
		long LEndTime = 0 ;
		selectTimeDAOImpl stdi = new selectTimeDAOImpl();
		selectTime time = stdi.getSelectTime();
		return LEndTime = Long.valueOf(time.getEndTime().replace("-", "").replace(" ", "").replace(":",""));
	}
	public long getLocalTime(){
		long LLocalTime = 0 ;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm",Locale.US);
        Date localTime = new Date(System.currentTimeMillis());
        String strLocalTime = sdf.format(localTime);
        return LLocalTime = Long.valueOf(strLocalTime.replace("-", "").replace(" ", "").replace(":",""));
	}
}
