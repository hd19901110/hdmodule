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
    <h3>Java多线程学习（一）Java多线程入门</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79640870
    </p>
    
    <div>
       <h3>1.1 进程和线程</h3>
       <p>进程和线程的对比这一知识点由于过于基础,所以在面试中很少碰到,但是极有可能会在笔试题中碰到.常见<br>
                                    的提问形式是这样的: "什么是线程和进程?请简要描述线程与进程的关系,区别及优缺点?".
       </p>
    </div>
    
    <div>
       <h3>1.2 何为进程?</h3>
       <p>进程是程序一次执行过程,是系统运行程序的基本单位,因此进程是动态的.系统运行一个程序即是一个进程从创建,运行<br>
                                到消亡的过程.在windows中通过查看任务管理器的方式,我们就可以看清楚到window当前运行的进程(.exe文件的运行)
       </p>   
    </div>
    <div>
        <h3>1.3 何为线程?</h3>
        <p>线程与进程相似,但线程是一个比进程更小的执行单位.一个进程在其执行过程中可以产生多个线程.<br>
                                与进程不同的是同类的多个线程共享同一块内存空间和一组系统资源,所以系统在产生一个线程,<br>
                                或是在各个线程之间作切换工作时,负担要比进程小得多.也正因为如此,线程也被称为轻量级进程.
        </p>
    </div>
    
    <div>
        <h3>1.4何为多线程</h3>
        <p>多线程就是多个线程同时运行或交替运行.单核CPU的话是顺序执行,也就是交替运行.多核CPU的话,因为每个CPU<br>
                             有自己的运算器,所以在多个CPU中可以同时运行.
        </p>
    </div>
    
    <div>
        <h3>1.5为什么多线程是必要的?</h3>
        <p>
                             个人觉得可以用一句话概括: 开发高并发系统的基础,利用好多线程机制可以大大提高系统整体的并发能力以及性能.
        </p>
    </div>
    
    <div>
        <h3>1.6 为什么提倡多线程而不是多进程?</h3>
        <p>
                              线程就是轻量级进程,是程序执行的最小单位.使用多线程而不是用多进程去进行并发程序的设计,<br>
                             是因为线程间的切换和调度的成本远远小于进程.
        </p>
    </div>
    
    <div>
        <h2>二几个重要的概念</h2>
    </div>
    
    <div>
        <h3>2.1同步和异步</h2>
        <p>
                              同步和异步通常用来形容一次方法调用,同步方法调用一旦开始,调用者必须等到方法调用返回后,才能继续后续的行为<br>
                              异步方法调用更像一个消息传递,一旦开始,方法调用就会立即返回,调用者可以继续后续的操作.
          <ul>
             <li>
                                                关于异步目前比较经典以及常用的实现方式就是消息队列:在不使用消息队列服务器的时候,用户的请求数据直接写入数据库,在<br>
                                                高并发的情况下数据库压力剧增,使得响应速度变慢.但是在使用消息队列之后,用户的请求数据发送给消息队列之后立即返回,再<br>
                                                由消息队列的消费者进程从消息队列中获取数据,异步写入数据库.由于小消息队列服务器处理速度快于数据库(消息队列也比数据库<br>
                                                有更好的伸缩性),因此响应速度得到大幅改善.
             
             </li>
          </ul>
        
        </p>
    </div>
    
    <div>
        <h3>2.2并发(Concurrency)和并行(Parallelism)</h3>
        <p>
                             并发和并行是两个非常容易被混淆的概念.他们都可以表示两个或者多个任务一起执行.但是偏重点有些不同.<br>
                             并发偏重于多个任务交替执行,而多个任务之间有可能还是串行的.而并行是真正意义上的"同时执行".
        </p>
        <p>
                          多线程在单核CPU的话是顺序执行,也就是交替你运行(并发).多核CPU的话,因为每个CPU有自己的运算器,所以在多<br>
                          个CPU中可以同时运行(并行)
        
        </p>
    </div>
    
    <div>
        <h3>2.3 高并发</h3>
        <p>
                          高并发(High Concurrency)是互联网分布式系统架构设计中必须考录的因素之一.它通常是指,通过设计保证系统能<br>
                          够同时并行处理很多请求.<br>
                         高并发相关常用的一些指标有响应时间(Response Time),吞吐量(Throughput),每秒查询率Qps(Query PerSecond),并发用户数等.                  
        </p>
    </div>
    
    <div>
        <h3>2.4 临界区</h3>
        <p>
                            临界区用来表示一种公共资源或者说是共享数据,,可以被多个线程使用.但是每一次,只能有一个线程使用它,一旦临界<br>
                            区资源被占用,其他线程要想使用这个资源,就必须等待.在并行程序中,临界区资源是保护的对象.
        </p>
    </div>
 
    <div>
        <h3>2.5阻塞和非阻塞</h3>
        <p>
                            非阻塞指在不能立刻得到结果之前,该函数不会阻塞当前线程,而会立刻返回,而阻塞与之相反.
        </p>
    </div>
   
 
    <div>
        <h2>三 使用多线程常见的三种方式</h2>
        <p>
                                   前两种实际上很少使用,一般都是用线程池的方式比较多一点
        </p>
    </div>
    
    <div>
        <h3>①继承Thread类</h3>
        <p>
             <pre>
             public class MyThread extends Thread {
	               @Override
	               public void run() {
		               super.run();
		               System.out.println("MyThread");
	               }
             }
             
             </pre>
             ThreadRun.java
             <pre>
             
             public class ThreadRun {

	              public static void main(String[] args) {
		              MyThread mythread = new MyThread();
		              mythread.start();
		              System.out.println("运行结束");
	              }

              }
             </pre>                          
                                     运行结果:
            <pre>
              1.运行结束
              2.MyThread
            </pre>                   
            从上面的运行结果可以看出:线程是一个子任务,CPU以不确定的方式,或者说是以随机的时间来调用线程中的Run方法.                      
        </p>
    </div>
    
    <div>
        <h3>②实现Runnable接口</h3>
        <p>
                          推荐实现Runnable接口方式开发多线程,因为Java单继承但是可以实现多个接口.<br>
         MyRunnable.java
         <pre>
             public class MyRunnable implements Runnable {
	             @Override
	             public void run() {
		             System.out.println("MyRunnable");
	             }
             }
         </pre>                 
         RunnableRun.java 
         <pre>
             public class RunnableRun {

	             public static void main(String[] args) {
		               Runnable runnable=new MyRunnable();
		               Thread thread=new Thread(runnable);
		               thread.start();
		               System.out.println("运行结束！");
	             }

             }
         </pre>
                           运行结果
         <pre>
           1.运行结束
           2.MyRunnable                  
         </pre>                  
                                                                 
        </p>
    </div>
    
    <div>
        <h3>③使用线程池</h3>
        <p>
                              使用线程池的方式也是最推荐的一种方式,另外《阿里巴巴Java开发手册》    在第一章第六节并发处理之一部分也强调到<br>
          "线程资源必须通过线程池提供,不允许在应用中自行显示创建线程 ".这里就不给大家演示代码了,线程池这一节会详<br>
                              细介绍到这部分内容分.(好吧,等我看到那一块再说,线程真的好麻烦呀)                 
        </p>
    </div>
    
    <div>
        <h2>四 实例变量和线程安全</h2>
        <p>
                            线程类中的实例变量针对其他线程可以有 共享和不共享之分.下面通过两个简单的例子来说明!                 
        </p>
    </div>
    
    <div>
        <h3>4.1不共享数据的情况</h3>
        <p>
            <pre>
                
 			/**
 			 * 
 			 * @author yf
 			 * @date 2018年10月30日
 			 * @Description: 多个线程之间不共享变量线程安全的情况
 			 */
			public class MyThreadTwo extends Thread {

				private int count = 5;

				public MyThread(String name) {
						super();
						this.setName(name);
				}

				@Override
				public void run() {
					super.run();
					while (count > 0) {
						count--;
						System.out.println("由 " + MyThread.currentThread().getName() + " 计算，count=" + count);
					}
				}

				public static void main(String[] args) {
					MyThread a = new MyThread("A");
					MyThread b = new MyThread("B");
					MyThread c = new MyThread("C");
					a.start();
					b.start();
					c.start();
				}
			}
 
            </pre>  
            由结果可以看出每个线程都有一个属于自己实力变量count,它们之间互不影响.我们在来看看另一种情况.                  
        </p>
    </div>
    
    <div>
       <h3>4.2共享数据的情况</h3>
       <p>
         <pre>
             /**
              * 
 			  * @author SnailClimb
              * @date 2018年10月30日
              * @Description: 多个线程之间共享变量线程不安全的情况
              */
              public class SharedVariableThread extends Thread {
	              private int count = 5;

	              @Override
	              public void run() {
		              super.run();
		              count--;
		              System.out.println("由 " + SharedVariableThread.currentThread().getName() + " 计算，count=" + count);
	              }

	              public static void main(String[] args) {

		              SharedVariableThread mythread = new SharedVariableThread();
		              // 下列线程都是通过mythread对象创建的
		              Thread a = new Thread(mythread, "A");
		              Thread b = new Thread(mythread, "B");
		              Thread c = new Thread(mythread, "C");
		              Thread d = new Thread(mythread, "D");
		              Thread e = new Thread(mythread, "E");
		              a.start();
		              b.start();
		              c.start();
		              d.start();
		              e.start();
	              }
              }

         </pre>
               多运行几次,就会发现每次运行结果都不同,而且也并不是我们想要的一次递减的结果.为什么呢?<br>
              因为在大多数jvm中,count-的操作分为如下三步:<br>
     <ol>
        <li>取得原有count值</li>
        <li>计算i-1</li>
        <li>对i进行赋值</li>
     </ol>    
                所以多个线程同时访问时出现问题就难以避免了.<br>
     <h4>那么有没有什么解决办法呢?</h4>           
                         答案是:当然有,而且很简单. 给大家提供两种解决办法:一种是利用synchronized 关键字(保证任意时刻只能有一个<br>
                          线程执行该方法),一种是利用AtomicInteger类(JUC中的Atomic原子类).大家如果之前没有接触Java多线程的<br>
                          话,可能对这两个概念不太熟悉,不过不要担心我后面会一一向你介绍到!这里不能用volatle关键字,因为volatile关<br>
                          键字不能保证复合操作的原子性.
       </p>
    </div>
    
    <div>
       <h2>五 一些常用方法</h2>
       <p>
         <h3>5.1 currentThread()</h3>
                                 返回对当前正在执行的线程对象的引用<br>
         <h3>5.2 getId()</h3>
                                 返回此线程的标识符<br>
         <h3>5.3 getName()</h3>
                                 返回此线程的名称<br>
         <h3>5.4 getPriority()</h3>
                                 返回此线程的优先级<br>
         <h3>5.5 isAlive()</h3>
                                  测试这个线程是否还处于活动状态<br>
         <h4>什么是轰动状态呢?</h4>
                                  活动状态就是线程已经启动且尚未终止.线程处于正在运行或准备运行的状态.<br> 
         <h3>5.6 sleep(long millis)</h3>
                                  使当前正在执行的线程以指定的毫秒数 "休眠" (暂时停止执行),具体取决于系统定时器和调度程序的精确度和准确性.<br>                                  
         <h3>interrupt()</h3>
                                 中断当前这个线程.<br>
         <h3>5.8 interrupted()和isInterrupted()</h3>
           interrupted() : 测试当前线程是否已经是中断状态,执行后具有将状态清除为false的功能.<br>
           isInterrupted : 测试线程Thread对相关是否已经是中断状态,但不清楚状态标志.<br> 
         <h3>5.9 setName(String name)</h3>
                                 将此线程的名称更改为等于参数name.<br>  
         <h3>5.10 isDaemon()</h3>
                                 测试这个线程是否是守护线程.<br>  
         <h3>5.11 setDaemon(boolean on)</h3>
                                将此线程标记为 daemon线程或用户线程.<br>
         <h3>5.12 join()</h3>
                                在很多情况下,主线程生成并启动了子线程,如果子线程里要进行大量的耗时的运算,主线程往往将于子线程之间结束,<br>
                                但是如果主线程处理完其他的事务后,需要用到子线程的处理结果,也就是<b>主线程需要等待子线程执行完成之后在<br>
                                结束,这个时候就要用到join()方法了.</b><br>
                       
         <h3>5.13 yield()</h3>
          yield()方法的作用是放弃当前的CPU资源,将它让给其他的任务去占用CPU时间.注意:放弃的时间不确定,可能一会就<br>
                             会重新获得CPU时间片.<br>  
         <h3>5.14 setPriority(int newPriority)</h3>
                             更改此线程的优先级<br>  
       </p>
    </div>
   
    <div>
       <h2>六如何停止一个线程呢?</h2>
       <p>
       stop(),suspend(),resume()(仅用于与suspend()一起使用)这些方法已被弃用,所以不予讲解.
       </p>
    </div>
   
    <div>
       <h3>6.1使用interrupt()方法</h3>
       <p>
                   我们上面提到了interrupt()方法,先来试一下interrupt()方法能不能停止线程
        <pre>
             public class MyThread extends Thread {
	             @Override
	             public void run() {
		             super.run();
		             for (int i = 0; i < 5000000; i++) {
			             System.out.println("i=" + (i + 1));
		             }
	             }
		         public static void main(String[] args) {
		             try {
			             MyThread thread = new MyThread();
			             thread.start();
			             Thread.sleep(2000);
			             thread.interrupt();
		             } catch (InterruptedException e) {
			             System.out.println("main catch");
			             e.printStackTrace();
		             }
	             }
              }

        </pre>
                                  运行上述代码你会发现,<span style="color: read;">线程并不会终止</span><br>
                                  针对上面代码的一个<span style="color: read;">改进</span><br>
           interrupted()方法判断线程是否停止,如果是停止状态则break<br>
        <pre>
        
           /**
            * 
            * @author SnailClimb
            * @date 2018年10月30日
            * @Description: 使用interrupt()方法终止线程
            */
            public class InterruptThread2 extends Thread {
	            @Override
	            public void run() {
		            super.run();
		            for (int i = 0; i < 500000; i++) {
			            if (this.interrupted()) {
				           System.out.println("已经是停止状态了!我要退出了!");
				           break;
			            }
			            System.out.println("i=" + (i + 1));
		            }
		            System.out.println("看到这句话说明线程并未终止------");
	            }

	            public static void main(String[] args) {
		            try {
			            InterruptThread2 thread = new InterruptThread2();
			            thread.start();
			            Thread.sleep(2000);
			            thread.interrupt();
		            } catch (InterruptedException e) {
			            System.out.println("main catch");
			            e.printStackTrace();
		            }
	            }
            }
        </pre> 
        
        for循环虽然停止执行了,但是for循环下面的语句还是会执行,说明线程并未被停止.<br>
        
        <pre>
        public class MyThread extends Thread {

	        @Override
	        public void run() {
			    while (true) {
				     if (this.isInterrupted()) {
					     System.out.println("ֹͣ停止了!");
					     return;
				     }
				     System.out.println("timer=" + System.currentTimeMillis());
			    }
	        }
	        public static void main(String[] args) throws InterruptedException {
		         MyThread t=new MyThread();
		         t.start();
		         Thread.sleep(2000);
		         t.interrupt();
	        }

        }
        </pre>
                        当然还有其他停止线程的方法,后面再做介绍                          
       </p>
    </div>
   
    <div>
       <h2>七 线程的优先级</h2>
       <p>
                         每个线程都具有各自的优先级,<span style="color: read;">线程的优先级可以在程序中表明该线程的重要性,如果有很多线程处于就绪状态,系统会<br>
                         根据优先级来决定首先使用哪个线程进入运行状态</span>.但这个并不意味着低优先级的线程得不到运行,而只是它运行<br>
                         的几率比较小,如垃圾回收机制线程的优先级就比较低.所以很多垃圾得不到及时的回收处理.<br>
        <span style="color: read;">线程优先级具有继承特性</span>比如A线程启动B线程,则B线程的优先级和A是一样的.<br>
        <span style="color: read;">线程优先级具有随机性</span>也就是说线程优先级高的不一定每一次都先执行完.<br>
        Thread类中包含的成员变量代表了线程的某些优先级.如Thread.MIN_PRIORITY(常数1),<br>
        Thread.NORM_PRIORITY(常数5)<br>
        Thread.MAX_PRIORITY(常数10).其中每个线程的优先级都在Thread.MIN_PRIORITY(常数1) 到<br>
        Thread.MAX_PRIORITY(常数10) 之间，在默认情况下优先级都是Thread.NORM_PRIORITY(常数5).<br>
                        学过操作系统这门课程的话,我们可以发现多线程优先级或多或少借鉴了操作系统对进程的管理.<br>
        <h4>线程优先级具有继承特性测试代码:</h4>                
        MyThread1.java:<br>
        <pre>
        public class MyThread1 extends Thread {
	        @Override
	        public void run() {
		        System.out.println("MyThread1 run priority=" + this.getPriority());
		        MyThread2 thread2 = new MyThread2();
		        thread2.start();
	        }
        }
        </pre>
        MyThread2.java:<br>
        <pre>
        public class MyThread2 extends Thread {
	        @Override
	        public void run() {
		          System.out.println("MyThread2 run priority=" + this.getPriority());
	        }
        }
        </pre>
         Run.java:<br>
         <pre>
         public class Run {
	         public static void main(String[] args) {
		         System.out.println("main thread begin priority="
				     + Thread.currentThread().getPriority());
		         Thread.currentThread().setPriority(6);
		         System.out.println("main thread end   priority="
				     + Thread.currentThread().getPriority());
		         MyThread1 thread1 = new MyThread1();
		         thread1.start();
	         }
         }
         </pre>
                         运行结果: <br>
        main thread begin priority=5<br>
        main thread end   priority=6<br>
        MyThread1 run priority=6<br>
        MyThread2 run priority=6<br>               
       </p>
    </div>
   
    <div>
       <h2>八Java多线程分类</h2>
       <h3>8.1 多线程分类</h3>
       <p>
         <span style="color: read;">用户线程</span>:运行在前台,执行具体的任务,如程序的主线程,连接网络的子线程等都是用户线程<br>
         <span style="color: read;">守护线程</span>:运行在后台,为其他前台线程服务,也可以说守护线程是JVM中非守护线程的<b>"佣人".</b><br>
         <span style="color: read;">特点</span>:一旦所有用户线程都结束运行,守护线程会随JVM一起结束工作 <br>
         <span style="color: read;">应用</span>:数据库链接池中的检测线程,JVM虚拟机启动后的检测线程<br>     
         <span style="color: read;">最常见的守护线程</span>:垃圾回收线程
       </p>
    </div>
   
    <div>
       <h3>8.2如何设置守护线程?</h3>
       <p>
                           可以通过调用<span style="color: read;">Thread类的setDaemon(true)方法 </span>设置当前的线程为守护线程<br>
         <span style="color: read;">注意事项:</span>                  
         <pre>
             1. setDaemon(true)必须在start()方法前执行,否则会抛出IllegalThreadStateException异常
             2. 在守护线程中产生的新线程也是守护线程
             3. 不是所有的任务都可以分配给守护线程来执行,比如读写操作或者计算逻辑.
         </pre>
          
         MyThread.java<br>
         <pre>
             public class MyThread extends Thread {
	               private int i = 0;
	               @Override
	               public void run() { 
		              try {
			              while (true) {
				              i++;
				              System.out.println("i=" + (i));
				              Thread.sleep(100);
			              }
		              } catch (InterruptedException e) {
			            // TODO Auto-generated catch block
			            e.printStackTrace();
		              }
	              }
              }
             
         </pre>
         Run.java:
         <pre>
             public class Run {
	                public static void main(String[] args) {
		                try {
			                MyThread thread = new MyThread();
			                thread.setDaemon(true);
			                thread.start();
			                Thread.sleep(5000);
			                System.out.println("我离开thread对象也不再打印了，也就是停止了！");
		               } catch (InterruptedException e) {
			                 // TODO Auto-generated catch block
			                 e.printStackTrace();
		               }
	               }
             }
         </pre>
       </p>
    </div>
   
    <div>
       <h3></h3>
       <p>
       </p>
    </div>



</div>
			
</body>
<script type="text/javascript">
</script>



</html>
