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
    <h3>Java多线程学习（五）线程间通信知识点补充</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79694226
    </p>
    
    <div>
      
       <p> 我们通过之前几章的学习已经知道在线程间通信用到了synchronized关键字,volatile关键字以及等待/通知<br>
       (wait/notity)机制.今天我们就来讲一下线程间通信的其他指示表点:管道输入/输出流,Thread.join()的使用,<br>
       ThreadLocal的使用.
       </p>
    </div>
    
    <div>
       <h3>一管道输入/输出流</h3>
       <p>
         管道输入/输出流和普通文件的输入/输出流或者网络输入,输出流不同之处在于管道输入/输出 流主要<br>
         用于线程之间的数据传输,而且传输的媒介为内存. <br>
         管道输入/输出流主要包括下列两类的实现:<br>
         面向字节: PipedOutputStream, PipedInputStream<br>
        面向字符: PipedWriter, PipedReader<br>                   
       </p>   
   </div>
   <div>
       <h3>1.1第一个管道输入/输出流实例</h3>       
       <p>
                            完整代码    : https://github.com/Snailclimb/threadDemo/tree/master/src/pipedInputOutput<br>
         writeMethod方法<br>
         <pre>
             public void writeMethod(PipedOutputStream out) {
                  try {
                        System.out.println("write :");
                        for (int i = 0; i < 300; i++) {
                            String outData = "" + (i + 1);
                            out.write(outData.getBytes());
                            System.out.print(outData);
                      }
                      System.out.println();
                      out.close();
                 } catch (IOException e) {
                     e.printStackTrace();
                }
             }
         </pre>


       </p>      
   </div>
   
   <div>
       <h3>二等待/通知机制的实现</h3>
       <h4>2.1我的第一个等待/通知机制程序</h4>
      MyList.java<br>
      <pre>
           public class MyList {
                 private static List&lt;String&gt; list = new ArrayList&lt;String&gt;();

                 public static void add() {
                      list.add("anyString");
                 }

                 public static int size() {
                      return list.size();
                 }

          }

      </pre> 
      ThreadA.java<br>
      <pre>
          public class ThreadA extends Thread {

                  private Object lock;

                  public ThreadA(Object lock) {
                       super();
                       this.lock = lock;
                  }

                  @Override
                  public void run() {
                       try {
                             synchronized (lock) {
                                if (MyList.size() != 5) {
                                    System.out.println("wait begin "
                                          + System.currentTimeMillis());
                                    lock.wait();
                                    System.out.println("wait end  "
                                          + System.currentTimeMillis());
                                }
                             }
                           } catch (InterruptedException e) {
                                 e.printStackTrace();
                           }
                   }
           }

      </pre>
   ThreadB.java<br>
       <pre>
           public class ThreadB extends Thread {
                private Object lock;

                public ThreadB(Object lock) {
                    super();
                    this.lock = lock;
                }

                @Override
                public void run() {
                    try {
                          synchronized (lock) {
                               for (int i = 0; i < 10; i++) {
                                   MyList.add();
                                   if (MyList.size() == 5) {
                                       lock.notify();
                                       System.out.println("已发出通知！");
                                   }
                                   System.out.println("添加了" + (i + 1) + "个元素!");
                                   Thread.sleep(1000);
                               }
                          }
                        } catch (InterruptedException e) {
                           e.printStackTrace();
                        }
                }
         }

   
       </pre>
       Run.java<br>
       <pre>
           public class Run {
                 public static void main(String[] args) {
                      try {
                            Object lock = new Object();
                            ThreadA a = new ThreadA(lock);
                            a.start();
                            Thread.sleep(50);
                            ThreadB b = new ThreadB(lock);
                            b.start();
                          } catch (InterruptedException e) {
                            e.printStackTrace();
                          }
                 }           
          }       
       </pre>
        <img alt="线程" src="${ctxStatic}/images/resultImage/result001.jpeg"><br>    
                    从运行结果:"wait end 1521967322359" 最后输出可以看出,notify()执行后并不会立即释放锁.<br>
                   下面我们会补充介绍这个知识点<br>
       synchronized关键字可以将任何一个Object对象作为同步对象来看待,而java为每个Object都实现<br>
                    了等待/通知(wait/notify)机制的相关方法,他们必须用在synchronized关键字同步的Object的临<br>
                    界区内.通过调用wait()方法可以使处于临界区内的线程进入等待状态.同时释放被同步对象的锁.<br>
                    而notify()方法可以唤醒一个因调用wait操作而处于阻塞状态中的线程.使其进入就绪状态.被重新唤<br>
                    醒的线程会试图重新获得临界区的控制权也就是锁,并继续执行表wait方法之后的代码.如果发出<br>
      notify操作时没有处于阻塞状态中的线程,那么该命令会被忽略.
                                                         
   </div>
   <div>
       <h3>2.2线程的基本状态</h3>
       <p>
                         上面几章的学习中我们已经掌握了与线程有关的大部分API,这些API可改变线程对象的状态.如下图所示<br>
         <img alt="线程" src="${ctxStatic}/images/resultImage/线程生命周期.png"><br>               
        <ol>
           <li>新建(new):新创建了一个线程对象.</li>
           <li>可运行(Runnable):线程对象创建后,其他线程(比如main线程)调用了该对象的start()方法.该状态<br>
           的线程位于可运行线程池中,等待被线程调度选中,获取cpu的使用权
           </li>
           <li>运行(running):可运行状态(runnable)的线程获得了cpu的时间片(timeslice),执行程序代码</li>
           <li>阻塞(block):阻塞状态是指线程因为某种原因放弃了cpu使用权,也即让出了cpu timeslice,暂时停止运行,<br>
           直到线程进入可运行(Runnable)状态,才有机会再次获得cpu timeslice转到运行(running)状态.<br>
           阻塞的情况分三种<br>
              <ol>
                  <li>等待阻塞:运行(running)的线程执行o.wait()方法,JVM会把该线程放入等待队列(waitting queue)中.</li>          
                  <li>同步阻塞:运行(running)的线程在获取对象的同步锁时,若该同步锁,被别的线程占用,则JVM会把该线程放入锁池(lock pool)中.</li>          
                  <li>其他阻塞:运行(running)的线程执行Thread.sleep(long ms)或t.join()方法,或者发出了I/O请求时,JVM会把该线程置为阻塞状态.<br>
                                                                  当sleep()状态超时join()等待线程终止或者超时,或者I/O处理完毕时,线程重新转入可运行(Runnable)状态
                  </li>          
              </ol>
           </li>
           <li>死亡(dead):线程 run(),main()方法执行结束,或者因异常退出了run()方法,则该线程结束生命周期,死亡的线程不可再次复生.</li>
        </ol>
       </p>   
   </div>
   <div>
      <h3>2.3notify()锁不释放</h3>
      <p>
      <span style="color: read">当方法wait()被执行后,锁自动被释放,但执行完notify()方法后,锁不会自动释放,必须执行完<br>
      notity()方法所在的synchronized代码块后才释放.
      </span>
      </p>
   </div>
   <div>
   <h3>2.4当interrupt方法遇到wait方法</h3>
   <p>
      <span style="color: read">当线程呈wait状态时,对线程对象调用interrupt方法会出现InterrupedExcption异常</span><br>
      Service.java<br>
     <pre>
         public class Service {
              public void testMethod(Object lock) {
                   try {
                         synchronized (lock) {
                              System.out.println("begin wait()");
                              lock.wait();
                              System.out.println("  end wait()");
                         }
                       } catch (InterruptedException e) {
                            e.printStackTrace();
                            System.out.println("出现异常了，因为呈wait状态的线程被interrupt了！");
                       }
               }
        }
     </pre>
   ThreadA.java<br>
   <pre>
        public class ThreadA extends Thread {

            private Object lock;

            public ThreadA(Object lock) {
                super();
                this.lock = lock;
            }
            
            @Override
            public void run() {
                 Service service = new Service();
                 Service.testMethod(lock);
            }
        }
   </pre>
   Test.java<br>
   <pre>
   public class Test {
        public static void main(String[] args) {
             try {
                   Object lock = new Object();
                   ThreadA a = new ThreadA(lock);
                   a.start();
                   Thread.sleep(5000);
                   a.interrupt();
                 } catch (InterruptedException e) {
                   e.printStackTrace();
                 }
        }
   }

   
   
   </pre>
   
   </p>
   
   
   </div>
   
   

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
