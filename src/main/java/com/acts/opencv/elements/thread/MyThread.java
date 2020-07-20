package com.acts.opencv.elements.thread;
/**
 * 继承Thread类,(使用多线程)
 * @author yf
 * @Time 2020-07-02 10:53
 */
public class MyThread extends Thread{
   @Override
	public void run() {
	   super.run();
	   System.out.println("MyThread");
   }
}
