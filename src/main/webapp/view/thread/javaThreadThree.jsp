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
    <h3>Java多线程学习(二) synchronized关键字(2)</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79670775
    </p>
    
    <div>
       <h3>一 synchronized方法的缺点</h3>
       <p>使用 synchronized关键字声明方法有些时候是有很大的弊端的,比如我们有两个线程一个线程A调用同步放方法后获得锁,<br>
                              那么另一个线程B就需要等待A执行完,但是如果说A执行的是一个很费时间的任务的话这样就会很耗时.<br>
                              先来看一个暴露synchronized方法的缺点实例,然后在看看如何通过synchronized同步语句块解决这个问题
       </p>
       <p>
       Task.java<br>
       <pre>
           public class Task {

               private String getData1;
               private String getData2;

               public synchronized void doLongTimeTask() {
                   try {
                           System.out.println("begin task");
                           Thread.sleep(3000);
                           getData1 = "长时间处理任务后从远程返回的值1 threadName="
                           + Thread.currentThread().getName();
                           getData2 = "长时间处理任务后从远程返回的值2 threadName="
                           + Thread.currentThread().getName();
                           System.out.println(getData1);
                           System.out.println(getData2);
                           System.out.println("end task");
                       } catch (InterruptedException e) {
                          // TODO Auto-generated catch block
                          e.printStackTrace();
                       }
               }
          }

       </pre>
       CommonUtils.java<br>
       <pre>
            public class CommonUtils {

                 public static long beginTime1;
                 public static long endTime1;

                 public static long beginTime2;
                 public static long endTime2;
           }

       </pre>
       MyThread1.java<br>
       <pre>
            public class MyThread1 extends Thread {
                private Task task;
                public MyThread1(Task task) {
                    super();
                    this.task = task;
                }
                @Override
                public void run() {
                    super.run();
                    CommonUtils.beginTime1 = System.currentTimeMillis();
                    task.doLongTimeTask();
                    CommonUtils.endTime1 = System.currentTimeMillis();
                }
             }

       </pre>
       MyThread2.java
       <pre>
           public class MyThread2 extends Thread {
               private Task task;
               public MyThread2(Task task) {
                    super();
                    this.task = task;
               }
               @Override
               public void run() {
                   super.run();
                   CommonUtils.beginTime2 = System.currentTimeMillis();
                   task.doLongTimeTask();
                   CommonUtils.endTime2 = System.currentTimeMillis();
               }
}

       </pre>
       Run.java<br>
       <pre>
            public class Run {

                public static void main(String[] args) {
                    Task task = new Task();

                    MyThread1 thread1 = new MyThread1(task);
                    thread1.start();

                    MyThread2 thread2 = new MyThread2(task);
                    thread2.start();

                    try {
                           Thread.sleep(10000);
                        } catch (InterruptedException e) {
                           e.printStackTrace();
                        }

                    long beginTime = CommonUtils.beginTime1;
                    if (CommonUtils.beginTime2 < CommonUtils.beginTime1) {
                          beginTime = CommonUtils.beginTime2;
                    }

                    long endTime = CommonUtils.endTime1;
                    if (CommonUtils.endTime2 > CommonUtils.endTime1) {
                         endTime = CommonUtils.endTime2;
                    }

                    System.out.println("耗时：" + ((endTime - beginTime) / 1000));
                }
           }
       </pre>
                                    从运行的时间上来看,synchronized方法的问题很明显.可以使用synchronized同步块来解决这个问题.但是要注意<br>
            synchronized同步块的使用方式,如果synchronized同步块使用不好的话并不会带来效率的提升.<br>
       </p>
    </div>
    
    <div>
       <h3>二synchronized(this) 同步代码块的使用</h3>
       <p>
          修改 上例中的Task.java如下:<br>
    <pre>      
     public class Task{
         private String getData1;
         private String getData2;
         
         public void doLongTimeTask() {
              try {
                  System.out.println("begin task");
                  Thread.sleep(3000);

                  String privateGetData1 = "长时间处理任务后从远程返回的值1 threadName="
                       + Thread.currentThread().getName();
                  String privateGetData2 = "长时间处理任务后从远程返回的值2 threadName="
                       + Thread.currentThread().getName();

                  synchronized (this) {
                       getData1 = privateGetData1;
                       getData2 = privateGetData2;
                  }

                  System.out.println(getData1);
                  System.out.println(getData2);
                  System.out.println("end task");
                } catch (InterruptedException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
                }
         }  
     }
     </pre> 
                               从上面代码可以看出,当一个线程访问一个对象的synchronized同步代码块时,另一个线程任然可以访<br>
                               问该对象非synchronized同步代码块.<br>
                               时间虽然缩短了,但是大家考虑一下synchrfonized代码块真的是同步的吗?它真的持有当前调用对<br>
                               象的锁吗?<br>
                               是的,不在synchronized代码块中就异步执行,在synchronized代码块中就同步执行.                     
       </p>   
   </div>
   
   <div>
       <h3>三 synchronized(object)代码块间使用</h3>
       <p>
       MyObject.java<br>
       <pre>
           public  class MyObject{
           }
       </pre>
       Service.java<br>
        <pre>
            public class Service {

                 public void testMethod1(MyObject object) {
                      synchronized (object) {
                      try {
                            System.out.println("testMethod1 ____getLock time="
                                  + System.currentTimeMillis() + " run ThreadName="
                                  + Thread.currentThread().getName());
                            Thread.sleep(2000);
                            System.out.println("testMethod1 releaseLock time="
                                  + System.currentTimeMillis() + " run ThreadName="
                                  + Thread.currentThread().getName());
                          } catch (InterruptedException e) {
                            e.printStackTrace();
                          }
                      }    
                 }
            }
        </pre> 
        ThreadA.java<br>
        <pre>
            public class ThreadA extends Thread {

                 private Service service;
                 private MyObject object;

                 public ThreadA(Service service, MyObject object) {
                      super();
                      this.service = service;
                      this.object = object;
                 }

                 @Override
                 public void run() {
                     super.run();
                     service.testMethod1(object);
                 }
           }
 
        </pre>
         TreadB.java<br>
        <pre>
            public class ThreadB extends Thread {
                private Service service;
                private MyObject object;

                public ThreadB(Service service, MyObject object) {
                     super();
                     this.service = service;
                     this.object = object;
                }

                @Override
                public void run() {
                    super.run();
                    service.testMethod1(object);
                }
           }
        </pre> 
        Run1_1.java<br>
         <pre>
         public class Run1_1 {

              public static void main(String[] args) {
                   Service service = new Service();
                   MyObject object = new MyObject();

                   ThreadA a = new ThreadA(service, object);
                   a.setName("a");
                   a.start();

                   ThreadB b = new ThreadB(service, object);
                   b.setName("b");
                   b.start();
             }
         } 
         </pre>
         可以看出,两个线程使用了同一个"对象监视器",所以运行结果是同步的.<br>
         那么,如果使用不同的对象监视器会出现什么效果呢?<br>
        修改Run1_1.java如下<br>
       <pre>
        public class Run1_2 {

             public static void main(String[] args) {
                 Service service = new Service();
                 MyObject object1 = new MyObject();
                 MyObject object2 = new MyObject();

                 ThreadA a = new ThreadA(service, object1);
                 a.setName("a");
                 a.start();

                 ThreadB b = new ThreadB(service, object2);
                 b.setName("b");
                 b.start();
    }
}

       </pre>  
                     
       </p>
   </div>
   
   <div>
       <h3>四 synchronized代码块间的同步性</h3>
       <p>
                            当一个对象访问synchronized(this)代码块时,其他线程对同一个对象中所有其他synchronized(this)<br>
                           代码块的访问将被阻塞,这说明synchronized(this)代码块使用的"对象监视器"是一个.<br>
                           也就是说和synchronized方法一样,synchronized(this)代码块也是锁定当前对象的.<br>
                           另外通过上面的学习我们可以得出两个结论.<br>
            <ol>
                <li>其他线程执行对象中synchronized同步方法和synchronized(this)代码块时呈现同步效果;</li>               
                <li>如果两个线程使用了同一个"对象监视器",运行结果同步,否则不同步.</li>               
            </ol>           
       </p>
   </div>
   
   <div>
       <h3>五静态同步synchronized方法与synchronized(class)代码块</h3>
       <p>
          synchronized 关键字加到static静态方法和synchronized(class)代码块上都使给Class类上锁,而<br>
          synchronized 关键字加到非static静态方法上是给对象上锁.<br>
          Service.java<br>
       <pre>      
           public class Service {

                public static void printA() {
                     synchronized (Service.class) {
                           try {
                                 System.out.println(
                                      "线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "进入printA");
                                 Thread.sleep(3000);
                                 System.out.println(
                                 "线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "离开printA");
                                } catch (InterruptedException e) {
                                  e.printStackTrace();
                                }
                    }
              }

             synchronized public static void printB() {
                  System.out.println("线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "进入printB");
                  System.out.println("线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "离开printB");
            }

            synchronized public void printC() {
                 System.out.println("线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "进入printC");
                 System.out.println("线程名称为：" + Thread.currentThread().getName() + "在" + System.currentTimeMillis() + "离开printC");
            }

        }
       </pre>
       ThreadA.ava
       <pre>
           public class ThreadA extends Thread {
                private Service service;
                public ThreadA(Service service) {
                    super();
                    this.service = service;
                }
                @Override
                public void run() {
                    service.printA();
                }
           }
       </pre>
       ThreadB.java<br>
       <pre>
           public class ThreadB extends Thread {
                private Service service;
                public ThreadB(Service service) {
                     super();
                     this.service = service;
                }
                @Override
                public void run() {
                     service.printB();
                }
           }
       </pre>
       ThreadC.java<br>
       <pre>
           public class ThreadC extends Thread {
                private Service service;
                public ThreadC(Service service) {
                    super();
                    this.service = service;
                }
                @Override
                public void run() {
                    service.printC();
                }
           }
       </pre>
       Run.java<br>
       <pre>
          public class Run {
              public static void main(String[] args) {
                  Service service = new Service();
                  ThreadA a = new ThreadA(service);
                  a.setName("A");
                  a.start();

                  ThreadB b = new ThreadB(service);
                  b.setName("B");
                  b.start();

                  ThreadC c = new ThreadC(service);
                  c.setName("C");
                  c.start();
             }
          }
       </pre>
       <pre>
                                结果:
                               线程名称为:A在1594172149036进入printA
                               线程名称为:C在1594172149036进入printC
                               线程名称为:C在1594172149036离开printC
                               线程名称为:A在1594172152038离开printA
                               线程名称为:B在1594172152038进入printB
                               线程名称为:B在1594172152038离开printB
       </pre>
       从运行结果可以看出静态同步synchronized方法与synchronized(class)代码块持有的锁一样,都是<br>
  Class锁,Class锁对,对象的的所有实例起作用.synchronized关键字加到非static静态方法上持有的是对象锁.<br>
     线程A,B和线程C持有的锁不一样,所以A和B运行同步,但是和C运行不同步.
       </p>
   </div>
   
   <div>
       <h3>六数据类型String的常量池属性</h3>
       <p>
                        在Jvm中具有String常量池缓存的功能<br>
        <pre>
        String s1 = "a";
        String s2 = "a";
        System.out.println(s1==s2);//true
        </pre>                
                       上面代码输出为true.这是为什么呢?        
       </p>
        <b>字符串常量池中的字符串只存在一份!即执行完第一行代码后,常量池中已存在 "a",那么s2不会<br>
                       在常量池中申请新的空间,而是直接把已存在的字符串内存地址返回给s2.</b> <br>
        因为数据类型String的常量池属性,所以synchronized(string)在使用时某些情况下会出现一些问题,<br>
        比如连个线程运行<br> 
        synchronized(“abc”)｛<br>
                       ｝和<br>
        synchronized(“abc”)｛<br>
                       ｝修饰的方法时，这两个线程就会持有相同的锁,导致某一时刻只有一个线程运行.所以尽量不要使用<br>
        sychronized(String)而使用synchronized(object)              
   </div>
</div>
			
</body>
<script type="text/javascript">
</script>



</html>
