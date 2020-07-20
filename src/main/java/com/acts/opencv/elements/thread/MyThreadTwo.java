package com.acts.opencv.elements.thread;
/**
 *
 * @author yf
 * @Date 2020-07-02 11:57 
 * @Description: 多个线程之间不共享变量线程安全的情况
 */
public class MyThreadTwo extends Thread {
     private int count = 5;
     /*构造函数*/
     public MyThreadTwo(String name){
    	 super();
    	 this.setName(name);
     }
	
     @Override
     public void run(){
    	 super.run();
    	while(count > 0){
    		 count -- ;
    		 System.out.println("由 "+MyThreadTwo.currentThread().getName()+ " 计算,count="+count);
    	 }
     }
	
     public static void main(String[] args) {
		MyThreadTwo a= new MyThreadTwo("A");
		MyThreadTwo b= new MyThreadTwo("B");
		MyThreadTwo c= new MyThreadTwo("C");
		a.start();
		b.start();
		c.start();
	}
     
     
     
}
