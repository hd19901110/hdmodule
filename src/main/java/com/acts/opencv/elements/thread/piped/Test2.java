package com.acts.opencv.elements.thread.piped;

public class Test2 {
    public static ThreadLocalExt t1= new ThreadLocalExt();
    public static void main(String[] args) {
		if(t1.get() == null){
			System.out.println("从未放过值");
            t1.set("我的值");
		}
		System.out.println(t1.get());
        System.out.println(t1.get());
	}
    
    static public  class ThreadLocalExt extends ThreadLocal{
    	@Override
    	protected Object initialValue(){
    		return "我是默认值,第一次get不在为null";
    	}
    }
    
    
    
    
    
    
}
