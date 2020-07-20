package com.acts.opencv.elements.thread.volatilts;

public class Run {
	public static void main(String[] args) throws InterruptedException {
         RunThread thread = new RunThread();
         thread.start();
         Thread.sleep(1000);
         thread.setRunning(false);
         System.out.println("已经赋值false");
	}
}
