package com.acts.opencv.elements.thread;

public class ThreadRun {
  public static void main(String[] args) {
	 MyThread mythread = new MyThread();
	 mythread.start();
	 System.out.println("运行结束");
   }
}
