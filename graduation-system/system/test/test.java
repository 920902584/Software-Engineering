package com.system.test;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String name="";
		if(name  != null && !name.equals("")){
		   System.out.println("1");
		}
		if(!"".equals(name)){//将“”写在前面，不管name是否为null，都不会报错
			System.out.println("2");
		}

	}

}
