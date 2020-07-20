package com.acts.opencv.elements.thread.synchronizeds;

public class MyYhread6d1 extends Thread {
	@Override
	public void  run (){
		Sub6d1 sub = new Sub6d1();
		sub.operateISubMethod();
	}

}
