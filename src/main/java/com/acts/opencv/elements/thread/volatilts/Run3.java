package com.acts.opencv.elements.thread.volatilts;

public class Run3 {
    public static void main(String[] args) {
		MyThread3[] mythreadArray = new MyThread3[100];
		for (int i = 0; i < 100; i++) {
            mythreadArray[i] = new  MyThread3();			
		}
    	
    	for (int i = 0;i<100;i++){
    		mythreadArray[i].start();;
    	}
    	
    	
	}
	
	
	
	
	
}
