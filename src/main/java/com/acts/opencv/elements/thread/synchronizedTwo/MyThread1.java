package com.acts.opencv.elements.thread.synchronizedTwo;

public class MyThread1 extends Thread{
    private Task task;
    public MyThread1(Task task){
    	super();
    	this.task = task;	
    }
    
    @Override
    public void run(){
    	super.run();
    	CommonUtils.beginTime1 = System.currentTimeMillis();
    	task.dolongTimeTask();
    	CommonUtils.endTime1 = System.currentTimeMillis();
    }
}
