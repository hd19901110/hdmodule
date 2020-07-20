package com.acts.opencv.elements.thread.synchronizeds;

public class Main6d1 {
    public int i =10;
    synchronized public void operateIMainMethod(){
    	
    	try {
    		i--;
        	System.out.println("main print i=" + i);
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    }   
}
