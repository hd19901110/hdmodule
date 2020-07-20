package com.acts.opencv.elements.thread.synchronizedTwo;

public class ThreadC4 extends Thread{
    	private Service4 service;
    	public ThreadC4(Service4 service){
    		super();
    		this.service = service;
    	}
    	
        @Override
        public void run(){
        	service.printC();
        }
}
