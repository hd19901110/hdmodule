package com.acts.opencv.elements.thread.waitOrNotify;

public class Test2d4 {
     public static void main(String[] args) {
		
    	try {
    		Object lock = new Object();
    		ThreadA2d4 a = new ThreadA2d4(lock);
        	a.start();
        	
			Thread.sleep(5000);
			
			a.interrupt();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} 
    	 
    	 
    	 
	}
}
