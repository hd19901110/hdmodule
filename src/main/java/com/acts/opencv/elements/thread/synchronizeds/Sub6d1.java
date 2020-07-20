package com.acts.opencv.elements.thread.synchronizeds;

public class Sub6d1 extends Main6d1 {
	synchronized public void operateISubMethod() {
		try {
			while (i > 0) {
				i--;
				System.out.println("sub print i=" + i);

				Thread.sleep(100);

				this.operateIMainMethod();
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
