package com.system.test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class test1 {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		String name=null;
		if(name  != null && !name.equals("")){
		   System.out.println("1");
		}
		if(!"".equals(name)){//将“”写在前面，不管name是否为null，都不会报错
			System.out.println("2");
		}
		System.out.println("3");
	}

}
