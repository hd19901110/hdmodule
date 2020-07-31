package com.acts.opencv.elements.thread.lock;

import java.util.concurrent.locks.ReentrantReadWriteLock;

public class dxhc {
		 static public class Service {
			 private ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
			 public void read() {
					try {
						try {
							lock.readLock().lock();
							System.out.println("获得读锁" + Thread.currentThread().getName() + " " + System.currentTimeMillis());
							Thread.sleep(10000);
						} finally {
							lock.readLock().unlock();
						}
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}

					public void write() {
						try {
							try {
								lock.writeLock().lock();
								System.out.println("获得写锁" + Thread.currentThread().getName() + " " + System.currentTimeMillis());
								Thread.sleep(10000);
							} finally {
								lock.writeLock().unlock();
							}
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
		}

		 static public class ThreadA extends Thread {
			 private Service service;
			 public ThreadA(Service service) {
		            super();
		            this.service = service;
		        }
		        @Override
		        public void run() {
		        	System.out.println("★线程" + Thread.currentThread().getName()
	                        + "运行了");
		        	service.read();
		        } 
		    }
		 static public class ThreadB extends Thread {
			 private Service service;
			 public ThreadB(Service service) {
				 super();
				 this.service = service;
			 }
			 @Override
			 public void run() {
				 System.out.println("★线程" + Thread.currentThread().getName()
	                        + "运行了");
				 service.write();
			 } 
		 }
	public static void main(String[] args) throws InterruptedException {
		
		
		
		 Service service = new Service();
		 ThreadB b = new ThreadB(service);
		 ThreadA a = new ThreadA(service);
		    a.setName("A");
	        b.setName("B");
	        a.start();
	        b.start();
	}
	
	
	
	
}
