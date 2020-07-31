package com.acts.opencv.elements.thread.lock;

import java.util.concurrent.locks.ReentrantReadWriteLock;

public class ReentrantReadWriteLocks {
	 private ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

	    public void read() {
	        try {
	            try {
	                lock.writeLock().lock();
	                System.out.println("获得读锁" + Thread.currentThread().getName()
	                        + " " + System.currentTimeMillis());
	                Thread.sleep(10000);
	            } finally {
	                lock.writeLock().unlock();
	            }
	        } catch (InterruptedException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	    
	    public static void main(String[] args) {
	    	ReentrantReadWriteLocks ss= new ReentrantReadWriteLocks();
	    	 Runnable runnable = new Runnable() {
	             @Override
	             public void run() {
	                 System.out.println("★线程" + Thread.currentThread().getName()
	                         + "运行了");
	                 ss.read();
	             }
	         };
	         
	         Thread[] threadArray = new Thread[10];
	         for (int i = 0; i < 10; i++) {
	             threadArray[i] = new Thread(runnable);
	         }
	         
	         for (int i = 0; i < 10; i++) {
	             threadArray[i].start();
	         }
	         
	         
	         
	         
		}
	   
	    
	    
	    
	    
	    
	    
	    
}
