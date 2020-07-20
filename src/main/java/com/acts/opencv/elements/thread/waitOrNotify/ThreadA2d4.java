package com.acts.opencv.elements.thread.waitOrNotify;

public class ThreadA2d4 extends Thread {
    private Object lock;
    public ThreadA2d4(Object lock){
    	super();
    	this.lock = lock;
    }
    
    @Override
    public void run(){
    	Service2d4 service = new Service2d4();
    	service.testMethod(lock);
    }
}
