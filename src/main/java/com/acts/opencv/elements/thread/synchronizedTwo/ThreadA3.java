package com.acts.opencv.elements.thread.synchronizedTwo;

public class ThreadA3 extends Thread{
	private Service3 service;
    private Myobject3 object;
    
    public ThreadA3(Service3 service,Myobject3 object){
    	super();
    	this.service = service; 
    	this.object = object;
    }
    
    @Override
    public void run(){
    	super.run();
    	service.testMethod1(object);
    }
    
    
    
    
    
}
