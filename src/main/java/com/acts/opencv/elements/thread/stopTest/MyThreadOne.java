package com.acts.opencv.elements.thread.stopTest;

public class MyThreadOne extends Thread {
    @Override
    public void run(){
    	super.run();
    	for(int i=0;i<5000000;i++){
    		System.out.println("i="+(i+1));
    	}
    }

    public static void main(String[] args) {
		
		try {
			MyThreadOne thread = new MyThreadOne();
			thread.start();
			Thread.sleep(2000);
			thread.interrupt();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
