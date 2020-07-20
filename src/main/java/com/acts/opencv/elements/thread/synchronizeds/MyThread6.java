package com.acts.opencv.elements.thread.synchronizeds;

public class MyThread6  extends Thread{
  @Override
  public void run(){
	  Service6 service = new Service6();
			  service.service1();
  }
}
