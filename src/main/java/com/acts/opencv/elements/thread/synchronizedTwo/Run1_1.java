package com.acts.opencv.elements.thread.synchronizedTwo;

public class Run1_1 {
       public static void main(String[] args) {
		
    	   Service3 service = new Service3();
    	   Myobject3 object = new Myobject3();
    	   
    	   ThreadA3 a = new ThreadA3(service,object);
    	   a.setName("a");
    	   a.start();
    	   
    	   ThreadB3 b = new ThreadB3(service,object);
    	   b.setName("b");
    	   b.start();
	}
}
