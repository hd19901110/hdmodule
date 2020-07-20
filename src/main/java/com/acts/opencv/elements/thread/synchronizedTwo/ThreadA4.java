package com.acts.opencv.elements.thread.synchronizedTwo;

public class ThreadA4 extends Thread{
   private Service4 service;
   public ThreadA4(Service4 service){
	   super();
	   this.service = service;
   }
   @Override
   public void run(){
	   service.printA();
   }
   
   
}
