package com.bo;

public class Test {
	
	public static void main(String[] args) {
		String abc = "D:\\li\\timg.jpg";
		String[] z = abc.split("\\\\");
		String gString = "";
		System.out.println(z.length);
		for(int i = 2;i<z.length;i++){
			gString += z[i]+"\\";
		}
		gString = gString.substring(0,gString.length()-1);
		System.out.println(gString);
	}
	
}
