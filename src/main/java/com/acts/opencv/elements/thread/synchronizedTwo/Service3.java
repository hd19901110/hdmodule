package com.acts.opencv.elements.thread.synchronizedTwo;

public class Service3 {
    public void testMethod1(Myobject3 object){
    	synchronized (object) {
           
            try {
            	 System.out.println("testMethod1__getLock time=" + System.currentTimeMillis()
                         +"run ThreadName="+Thread.currentThread().getName());
				Thread.sleep(2000);
				System.out.println("testMethod1 releaseLock time=" + System.currentTimeMillis()
				+"run ThreadName=" + Thread.currentThread().getName());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
    		
		}
    }
}
