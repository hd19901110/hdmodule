<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		$(function(){
		});
		
		
	</script>
	
</head>
<body>
<div class="header">
   <div style="margin-left: 36px;margin-right: 36px;padding:12px;">
    <h3>Java多线程学习（六）Lock锁的使用</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79714196
    </p>
    <div>
       <h4>一Lock接口</h4>
       <h3>1.1Lock接口简介</h3>
       <p>
        锁是用于通过多个线程控制对共享资源的访问的工具。通常，锁提供对共享资源的独占访问：一次只<br>
        能有一个线程可以获取锁，并且对共享资源的所有访问都要求首先获取锁。 但是，一些锁可能允许并<br>
        发访问共享资源，如ReadWriteLock的读写锁。<br>

        在Lock接口出现之前，Java程序是靠synchronized关键字实现锁功能的。JDK1.5之后并发包中新增<br>
        了Lock接口以及相关实现类来实现锁功能。<br>

         虽然synchronized方法和语句的范围机制使得使用监视器锁更容易编程，并且有助于避免涉及锁的许<br>
         多常见编程错误，但是有时您需要以更灵活的方式处理锁。例如，用于遍历并发访问的数据结构的一<br>
         些算法需要使用“手动”或“链锁定”：您获取节点A的锁定，然后获取节点B，然后释放A并获取<br>
   C，然后释放B并获得D等。在这种场景中synchronized关键字就不那么容易实现了，使用Lock接口<br>
        容易很多。<br>
   Lock接口的实现类：
   ReentrantLock ， ReentrantReadWriteLock.ReadLock ， ReentrantReadWriteLock.WriteLock
       </p>   
   </div>
   <div>
       <h3>1.2Lock的简单使用</h3>       
       <p>
          <pre>
           Lock lock = new ReentrantLock();
           lock.lock();
           try{
           }finally{
             lock.unlock();
           }
          
          </pre>
                          因为Lock是接口所以使用时要结合它的实现类,另外在finall语句块中释放锁的目的是保证获取到锁<br>
                          之后,最终能够被释放.                 
                          注意:最好不要把获取锁的过程写在try语句块中,因为如果在获取锁时发生了异常,异常抛出的同时<br>
                          也会导致锁无法被释放.                   
       </p>      
   </div>
   <div>
   <h3>1.3 Lock接口的特性和常见方法</h3>
   <h4>Lock接口提供的synchronized关键字不具备的主要特性:</h4>
   <pre>
         特性                                描述
   尝试非阻塞的获取锁           当前线程尝试获取锁,如果这一时刻锁没有被其他线程获取到,则成功获取并持有锁
   能被中断地获取锁              获取到锁的线程能够响应中断,当获取到锁的线程被中断时,中断异常将会被抛出,同时锁会被释放  
   超时获取锁                         在指定的截止时间之前获取锁,超过截止时间后仍旧无法获取则返回.
   </pre>
   <h4>Lock接口基本的方法</h4>
   <pre>
         方法名称                                                                                       描述
   void lock()                   获得锁.如果锁不可用,则当前线程将被禁用以进行线程调度,并且处于休眠状态,直到获取锁
   void lockInterruptibly()      获取锁,如果可用并且立即返回.如果锁不可用,那么当前线程将被禁用以进行线程调度,
                                     并且处于休眠状态,和lock()方法不同的是在锁的获取中可以中断当前线程(相应中断).
   condition newCondition()      获取等待通组件,该组件和当前的锁绑定,当前线程只有获得了锁,才能调用该组件的wait()方法,而调用后,当前线程将释放锁
   boolean tryLock()             只有在调试是才可以获取得锁.如果可用,则获取锁定,并立即返回值为true;如果锁不可用,则此方法将立即返回值为false.
   boolean tryLock(long time, TimeUnit unit)  超时获取锁,当前线程在以下三种情况下会返回:1.当前线程在超时时间内获得了锁;2当前线程在超时时间内被中断;3超时时间结束,返回false
   void unlock()                 释放锁 
   </pre>
   </div>    
   
   <div>
   <h3>二Lock接口的实现类:ReentrantLock</h3>
   <p>ReentrantLock 和 Synchronized关键字一样可以用来实现线程之间的同步互斥,但是在功能是比<br>
   synchronized关键字更强大而且更灵活.<br>
   ReentrantLock类常见方法:<br>
        构造方法<br>
   <pre>
        方法名称                                                                                        描述
   ReentranLock()               创建一个ReentranLock的实例
   ReentranLock(boolean fair)   创建一个特定锁类型(公平锁/非公平锁)的ReentrantLock的实例
   </pre>
        常见方法(Lock接口已有方法这里没加上):<br>
   <pre>
          方法名称                                                                                                  描述
   int getHoldCount()                       查询当前线程保持此锁的个数,也就是调用lock()方法的次数
   protected Thread getOwner()              返回当前拥有此锁的线程,如果不拥有,则返回null
   protected Collection getQueuedThreads()	返回包含可能正在等待获取此锁的线程的集合
   int getQueueLength()	                                                       返回等待获取此锁的线程数的估计。
   protected Collection getWaitingThreads(Condition condition)	返回包含可能在与此锁相关联的给定条件下等待的线程的集合。
   int getWaitQueueLength(Condition condition)	返回与此锁相关联的给定条件等待的线程数的估计。
   boolean hasQueuedThread(Thread thread)	查询给定线程是否等待获取此锁。
   boolean hasQueuedThreads()	                                 查询是否有线程正在等待获取此锁。
   boolean hasWaiters(Condition condition)	查询任何线程是否等待与此锁相关联的给定条件
   boolean isFair()	                                                                  如果此锁的公平设置为true，则返回 true 。
   boolean isHeldByCurrentThread()	                      查询此锁是否由当前线程持有。
   boolean isLocked()	                                                       查询此锁是否由任何线程持有。
   </pre>     
   </p>
   </div>
   <div>
       <h3>2.1第一个ReentrantLock程序</h3>
       <p>
       ReentranLockTest.java<br>
       <pre>
       public class ReentrantLockTest {
              public static void main(String[] args) {
                  MyService service = new MyService();
                  MyThread a1 = new MyThread(service);
                  MyThread a2 = new MyThread(service);
                  MyThread a3 = new MyThread(service);
                  MyThread a4 = new MyThread(service);
                  MyThread a5 = new MyThread(service);
                  a1.start();
                  a2.start();
                  a3.start();
                  a4.start();
                  a5.start();
              }

             static public class MyService {
                  private Lock lock = new ReentrantLock();

                  public void testMethod() {
                      lock.lock();
                      try {
                            for (int i = 0; i < 5; i++) {
                              System.out.println("ThreadName=" + Thread.currentThread().getName() + (" " + (i + 1)));
                            }
                          } finally {
                            lock.unlock();
                          }

                  }

             }

             static public class MyThread extends Thread {

                 private MyService service;

                 public MyThread(MyService service) {
                     super();
                     this.service = service;
                 }

                 @Override
                 public void run() {
                      service.testMethod();
                 }
            }
     }
       </pre>
       从运行结果可以看出,当一个线程运行完毕后才把锁释放,其他线程才能执行,其他线程的执行顺序是不确定的.
       </p> 
   </div>
   
   <div>
   <h3>2.2Condition接口简介</h3>
   <p>
                我们通过之前的学习知道了：synchronized关键字与wait()和notify/notifyAll()方法相结合可以实现<br>
                等待/通知机制，ReentrantLock类当然也可以实现，但是需要借助于Condition接口与newCondition() 方法。<br>
      Condition是JDK1.5之后才有的，它具有很好的灵活性，比如可以实现多路通知功能也就是在一个Lock对象中可以创建<br>
               多个Condition实例（即对象监视器），线程对象可以注册在指定的Condition中，从而可以有选择性的进行线程通知，在调度线程上更加灵活。<br>
               在使用notify/notifyAll()方法进行通知时，被通知的线程是有JVM选择的，使用ReentrantLock类结<br>
               合Condition实例可以实现“选择性通知”，这个功能非常重要，而且是Condition接口默认提供的。<br>
               而synchronized关键字就相当于整个Lock对象中只有一个Condition实例，所有的线程都注册在它一<br>
               个身上。如果执行notifyAll()方法的话就会通知所有处于等待状态的线程这样会造成很大的效率问题，<br>
               而Condition实例的signalAll()方法 只会唤醒注册在该Condition实例中的所有等待线程<br>
     condition接口的常见方法:,<br>          
     <pre>
                         方法名称                                                                                            描述
         void await                             相当于Object类的wait方法   
         boolean await(long time,TimeUnit unit) 相当于Object类的wait(long timeout)方法
         signal()                               相当于Object类的notity方法
         signalAll()                            相当于Object类的notifyAll方法
     </pre>      
   </p>
   </div>
   <div>
   <h3>2.3使用Condition实现吧等待/通知机制</h3>
   <p>
   1.使用单个Condition实例实现等待/通知机制:<br>
   UseSingleConditionWaitNotify.java<br>
   <pre>
        public class UseSingleConditionWaitNotify {
            public static void main(String[] args) throws InterruptedException {
                 MyService service = new MyService();
                 ThreadA a = new ThreadA(service);
                 a.start();
                 Thread.sleep(3000);
                 service.signal();
            }

            static public class MyService {
                private Lock lock = new ReentrantLock();
                public Condition condition = lock.newCondition();
                public void await() {
                    lock.lock();
                    try {
                           System.out.println(" await时间为" + System.currentTimeMillis());
                           condition.await();
                           System.out.println("这是condition.await()方法之后的语句，condition.signal()方法之后我才被执行");
                        } catch (InterruptedException e) {
                           e.printStackTrace();
                        } finally {
                           lock.unlock();
                       }
                }
                public void signal() throws InterruptedException {
                    lock.lock();
                    try {               
                          System.out.println("signal时间为" + System.currentTimeMillis());
                          condition.signal();
                          Thread.sleep(3000);
                          System.out.println("这是condition.signal()方法之后的语句");
                        } finally {
                           lock.unlock();
                        }
                } 
            }

            static public class ThreadA extends Thread {
                private MyService service;
                public ThreadA(MyService service) {
                    super();
                    this.service = service;
                }

                @Override
                public void run() {
                    service.await();
                }
            }
      }
   </pre>
   在使用wait/notify实现等待通知机制的时候我们知道必须执行完notify()方法所在的synchronized代<br>
   码块后才释放锁.在这里也差不多,必须执行完成signal所在的try语句块之后才释放锁<br>
 conditionv.await()后的语句才能被执行.<br>
 注意:必须在condition.await()方法调用之前调用lock.lock()代码获得同步监视器,不然会报错. 
 2.使用多个Condition实例实现等待/通知机制:<br>
 UseMoreConditionWaitNotify.java
 
   </p>
   
   
   
   
   </div>

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
