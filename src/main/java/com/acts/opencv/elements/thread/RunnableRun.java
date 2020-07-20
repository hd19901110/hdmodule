package com.acts.opencv.elements.thread;

public class RunnableRun {
   public static void main(String[] args) {
	   Runnable runnable = new MyRunnable();
	   Thread thread = new Thread(runnable);
	   thread.start();
	   System.out.println("运行结束!");   
  }
}
