package com.acts.opencv.elements.thread.stopTest;

public class MyThreadTwo extends Thread {
    @Override
    public void run(){
    	super.run();
    	for(int i=0;i<5000000;i++){
    		if(this.interrupted()){
    		System.out.println("已经是停止状态了!我要退出了!");
    		break;
    		}
    		System.out.println("i="+(i+1));
    	}
    	System.out.println("看到这句话说明线程并未终止......");
    }

    public static void main(String[] args) {
		
		try {
			MyThreadTwo thread = new MyThreadTwo();
			thread.start();
			Thread.sleep(2000);
			thread.interrupt();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}
}
