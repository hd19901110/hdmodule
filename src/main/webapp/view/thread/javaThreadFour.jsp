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
    <h3>Java多线程学习（三）volatile关键字</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79680771
    </p>
    
    <div>
       <h3>一 简介</h3>
      <h4>先来看看维基百科对"volatile关键字"的定义:</h4>
       <p>
                           在程序设计中,尤其是在C语言,C++,C#和java语言中,使用volatile关键字声明的变量或对象通<br>
                          常具有优化,多线程相关的特殊属性.通常,volatile关键字用来阻止(伪)编译器认为的无法"被<br>
                         代码本身"改变的代码(变量/对象)进行优化.如在C语言中,<span style="color: read">volatile 关键字可以用来提醒编译器<br>
                          它后面所定义的变量随时有可能改变,因此编译后的程序每次需要存储或读取这个变量的时候,都会<br>
                        直接从变量地址中读取数.如果没有volatile关键字,则编译器可能优化读取和存储,可能暂时使用寄<br>
                        存器中的值,如果这个变量由别的程序更新了的话,将出现不一致的现象.<br>
    </span>
         在C环境中,volatile关键字的真实定义和适用范围经常被误解.虽然C++,C#和Java都保留了C中的<br>
   volatile关键字,但这些编程语言中volatile的用法和语义却大相径庭.<br> 
    <h3>Java中的"volatile关键字"关键字:</h3>
        在JDK1.2之前,Java的内存模型实现总是从主存(即共享内存)读取变量,是不需要进行特别的注<br>
        意的.而在当前java内存模型下,线程可以把变量保存本地内存(比如机器的寄存器)中,而不<br>
        是直接在主存中进行读写,这就可能造成一个线程在主存中修改了一个变量的值,而另外一个线程还<br>
        继续使用它在寄存器中的变量值的拷贝,造成数据的不一致.<br>
        要解决这个问题,就需要把变量声明为volatile,这就指示JVM,这这变量是不稳定的,每次使用它<br>
       都到主存中进行读取.      
   </p>
    </div>
    
    <div>
       <h3>二vilatile关键字的可见性</h3>
       <p>
          volatile修士的成员变量在每次被线程访问时,都强迫从主存(共享内存)中重读该成员变量的值.<br>
          而且,当成员变量发生变化时,强迫线程将变化值回写到主存(共享内存).这样在任何时刻,两个<br>
          不同的线程总是看到每个成员变量的同一个值,这样也就保证了同步数据的可见性.<br>
        RunThread.java<br>
        <pre>
        public  class RunThread extends Thread {
             private boolean isRunning = true;
             int m;
             public boolean isRunning() {
                 return isRunning;
             }
             public void setRunning(boolean isRunning) {
                 this.isRunning = isRunning;
             }
             @Override
             public void run() {
                 System.out.println("进入run了");
                 while (isRunning == true) {
                     int a=2;
                     int b=3;
                     int c=a+b;
                     m=c;
                 }
                 System.out.println(m);
                 System.out.println("线程被停止了！");
            }
        } 
        </pre>
        Run.java<br>
        <pre>
           public class Run {
               public static void main(String[] args) throws InterruptedException {
                   RunThread thread = new RunThread();

                   thread.start();
                   Thread.sleep(1000);
                   thread.setRunning(false);

                   System.out.println("已经赋值为false");
               }
           }
        </pre>
        RunThread类中的isRunning变量没有加上volatile关键字时,运行以上代码会出现死循环,这是因为<br>
        isRunning变量虽然被修改但是没有被写到主存中,这也就导致该线程在本地内存中的值一直为<br>
        true,这样就导致了死循环的产生.<br>
                        解决办法也很简单:isRunning变量前加上volatile关键字即可.<br>
                        <p></p>
         <span style="color: read">你是不是以为到这就完了?</span><br>
         不存在的!!!(这里还有一点需要强调,下面的内容一定要看,不然你在用volatile关键字时就会很迷<br>
         糊,因为书籍几乎都没有提这个问题)<br>
         假如你把while循环代码里加上任意一个输出语句或者sleep方法你会发现死循环也会停止,不管<br>
   isRunning变量是否被加上了volatile关键字.<br>
          加上输出语句:
    <pre>
         while (isRunning == true) {
            int a=2;
            int b=3;
            int c=a+b;
            m=c;
            System.out.println(m);
        }
    </pre>
             加上sleep方法<br>
    <pre>
        while (isRunning == true) {
            int a=2;
            int b=3;
            int c=a+b;
            m=c;
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    </pre>
     <span style="color: read">这是为什么呢?</span><br>
     因为:JVM会尽力保证内存的可见性,即便这个变量没有加同步关键字.换句话说,只要CPU有时<br>
     间,JVM会尽力去保证变量值的更新.这种与volatile关键字的不同在于,volatile关键字会墙柱的保<br>
     证线程的可见性.而不加这个关键字,JVM也会尽力去保证可见性别,但是如果CPU一直有其他的事情<br>
     在处理,它也没办法.最开始的代码,一直处于死循环中,CPU处于一直占用的状态,这个时候CPU<br>
     没有时间,JVM也不能强制要求CPU分点时间去取最新的变量值.而了输出或者sleep语句之后,<br>
  cpu就有可能有时间去保证内存的可见性,于是while循环可以被终止.<br>      
       </p>   
   </div>
   <div>
       <h3>三 volatile 关键字能保证原子性吗?</h3>
       《java并发编程艺术》,这本书上说保证但是在自增操作(非原子操作)上不保证,《java多线程编程<br>
       核心艺术》这本书说不保证.<br>
       个人倾向于:volatile 无法保证对变量原子性的.<br>
      MyThread.java<br>
      <pre>
      
      public class MyThread extends Thread {
           volatile public static int count;

           private static void addCount() {
                 for (int i = 0; i < 100; i++) {
                    count=i;
                 }
                 System.out.println("count=" + count);
           }
           @Override
           public void run() {
               addCount();
           }
      }
      </pre> 
   Run.java<br>
   <pre>
        public class Run {
             public static void main(String[] args) {
                  MyThread[] mythreadArray = new MyThread[100];
                  for (int i = 0; i < 100; i++) {
                       mythreadArray[i] = new MyThread();
                  }

                  for (int i = 0; i < 100; i++) {
                       mythreadArray[i].start();
                  }
             }
        }
   </pre>
   上面的"count=i"是一个原子操作,但是运行结果大部分都是正确结果99,但是也有部分不是99的结果<br>
   解决办法:<br>
 使用  synchronized关键字枷锁.(这只是一种办法,Lock和AtomicInteger原子类都可以,因为之前<br>
 (学过)sychronized关键字,所以我们使用synchronized关键的方法)<br>
   修改MyThread.java如下:
   <pre>
       public class MyThread extends Thread {
              public static int count;

              synchronized private static void addCount() {
                    for (int i = 0; i < 100; i++) {
                          count=i;
                    }
                    System.out.println("count=" + count);
              }
              @Override
              public void run() {
                  addCount();
              }
       }
   </pre>
            这样运行输出的count就都为99了,所以要保证数据的原子性还是要使用synchronized关键字.
   </div>
   
   <div>
       <h3>四synch容ized关键字和volatile关键字比较</h3>
       <ul>
          <li>
              volatile关键性是线程同步的轻量级实现,所以volatile性能肯定比synchronized关键字要好.<br>
                                   但是volatile关键字只能用于变量而synchronized关键字可以修饰方法以及代码块.<br>
            synchronized关键字在JavaSE1.6之后进行了主要包括为了减少获得锁和释放锁带来的性能消耗<br>
                                   而引入的偏向锁和轻量级锁以及其它各种优化之后执行效率有了显著提升,实际开发中使用<br>
            synchronized关键字还是更多一些.                       
          </li>
          <li>
                                       多线程访问volatile关键字不会发生阻塞,而synchronized关键字可能会发生阻塞
          </li>
          <li>
             volatlie关键字能保证数据的可见性,但不能保证数据的原子性.synchronized关键字两者都能保证.
          </li>
          <li>
             volatile 关键字用于解决变量在多个线程之间的可见性,而synchronized 关键字解决的是多个线<br>
                                      程之间访问资源的同步性.
          </li>
      
      
       </ul>
   
   
   
   
   </div>
   
   
   
   
   

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
