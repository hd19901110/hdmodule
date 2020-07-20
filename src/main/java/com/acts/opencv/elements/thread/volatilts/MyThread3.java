package com.acts.opencv.elements.thread.volatilts;

public class MyThread3 extends Thread {
     volatile public static int  count;
     private static void addCount() {
    	   for(int i = 0; i < 100; i++){
    		   count = i;
    	   }
    	   System.out.println("count=" + count);
     }
     @Override
     public void run(){
    	 addCount();
     }
     
}
