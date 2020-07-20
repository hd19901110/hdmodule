package com.acts.opencv.elements.thread.synchronizeds;

public class Test {
     public static void main(String[] args) {
		
		try {
			PublicVar publicVarRef = new PublicVar();
			ThreadATwo thread = new ThreadATwo(publicVarRef);
			thread.start();
			Thread.sleep(200);
			publicVarRef.getValue();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //打印结果受此值大小影响.
	}
}
