package com.acts.opencv.elements.thread.synchronizedTwo;

public class ThreadB4 extends Thread {
     private Service4 service;
     
     public ThreadB4(Service4 service){
    	super();
    	this.service = service;
     }
     @Override
     public void run(){
    	 service.printB();
     }
}
