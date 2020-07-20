package com.acts.opencv.elements.thread.synchronizeds;

public class ThreadATwo extends Thread{
	private PublicVar publicVar;
	public ThreadATwo(PublicVar publicVar){
		super();
		this.publicVar=publicVar;
	}
    @Override
    public void run(){
    	super.run();
    	publicVar.setValue("B","BB");
    }
    
}
