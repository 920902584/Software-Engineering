package com.system.dao;

import java.util.List;

import com.system.bean.Secretary;

public interface SecretaryDAO {
	public void addSecretary(Secretary secretary);//定义添加管理员信息的方法
	public void updateSecretary(String secretaryId,String item,String info);//定义修改管理员信息的方法
	public void deleteSecretary(String secretaryId);//定义删除管理员信息的方法
	public Secretary findSecretaryById(String secretaryId);
	public List<Secretary> findAllSecretary();

}
