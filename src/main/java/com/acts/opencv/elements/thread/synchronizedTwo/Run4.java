package com.acts.opencv.elements.thread.synchronizedTwo;

public class Run4 {
	public static void main(String[] args) {
		Service4 service = new Service4();
		ThreadA4 a = new ThreadA4(service);
		a.setName("A");
		a.start();

		ThreadB4 b = new ThreadB4(service);
		b.setName("B");
		b.start();

		ThreadC4 c = new ThreadC4(service);
		c.setName("C");
		c.start();
	}

}
