package com.acts.opencv.elements.thread.volatilts;

public class RunThread extends Thread {
	// private volatile boolean isRunning = true;
	private boolean isRunning = true;
	int m;

	public boolean isRunning() {
		return isRunning;
	}

	public void setRunning(Boolean isRunning) {
		this.isRunning = isRunning;
	}

	@Override
	public void run() {
		System.out.println("进入run了");
		while (isRunning == true) {
			int a = 2;
			int b = 3;
			int c = a + b;
			m = c;
			//System.out.println(m);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		

		System.out.println(m);
		System.out.println("线程被停止了");
	}

}
