package com.acts.opencv.elements.thread.synchronizedTwo;

public class Run1_2 {
       public static void main(String[] args) {
		
    	   Service3 service = new Service3();
    	   Myobject3 object1 = new Myobject3();
    	   Myobject3 object2= new Myobject3();
    	   
    	   ThreadA3 a = new ThreadA3(service,object1);
    	   a.setName("a");
    	   a.start();
    	   
    	   ThreadB3 b = new ThreadB3(service,object2);
    	   b.setName("b");
    	   b.start();
	}
}
