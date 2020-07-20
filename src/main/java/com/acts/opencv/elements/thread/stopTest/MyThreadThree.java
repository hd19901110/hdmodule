package com.acts.opencv.elements.thread.stopTest;

public class MyThreadThree extends Thread {
    @Override
    public void run(){
    	super.run();
    	while (true) {
			if (this.isInterrupted()) {
				System.out.println("ֹͣ停止了!");
				return;
			}
			System.out.println("timer=" + System.currentTimeMillis());
		}
    }

    public static void main(String[] args) {
		
		try {
			MyThreadThree thread = new MyThreadThree();
			thread.start();
			Thread.sleep(2000);
			thread.interrupt();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}
}
