package com.system.test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.system.daoImpl.ProjectDAOImpl;

public class getProjectNum {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetProjectNum() {
		ProjectDAOImpl pro =new ProjectDAOImpl();
		
		System.out.println(pro.getProjectNum());

	}

}
