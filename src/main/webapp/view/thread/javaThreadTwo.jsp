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
    <h3>Java多线程学习(二) synchronized关键字(1)</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79655194
    </p>
    
    <div>
       <h3>一简介</h3>
       <p>Java并发编程这个领域中<span style="color: read">synchronized关键字</span>一直都是元老级别的角色,很久之前很多人都会称它为"重量级锁".但<br>
                              是,在JavaSE1.6之后进行了主要包括为了<span style="color: read">减少获得锁和释放锁带来的性能消耗而引入的偏向锁和轻量级锁</span>以及其他各种<br>
                              优化后变得在某些情况下并不是那么重了.<br>
                              这一篇文章不会介绍synchronized关键字的实现原理,更多的是synchronized关键字的试用版.如果想要了解的可以看看<br>
                              方腾飞的《Java并发编程的艺术》(别人推荐的我还没有看过)                                        
       </p>
    </div>
    
    <div>
       <h3>二变量安全性</h3>
       <p>"非线程安全"问题存在于"实例变量" 中,如果是方法内部的私有变量,则不存在"非线程安全"问题,锁的结果也就是 <br>
       "线程安全"的了.<br>
                       如果两个线程同时操作对象中的实例变量,则会出现 "非线程安全",解决办法就是在方法前加上<span style="color: read">synchronized关键字</span><br>
                      即可.前面一篇文章我们已经讲过,而且贴过响应代码,所以这里就不再帖代码了.           
       </p>   
   </div>
   
   <div>
       <h3>三多个对象多个锁</h3>
       <p>
         HasSelfPrivateNum.java<br>
         <pre>
              public class HasSelfPrivateNum {

                  private int num = 0;

                  synchronized public void addI(String username) {
                         try {
                                 if (username.equals("a")) {
                                         num = 100;
                                         System.out.println("a set over!");
                                         //如果去掉hread.sleep(2000)，那么运行结果就会显示为同步的效果
                                         Thread.sleep(2000);
                                 } else {
                                         num = 200;
                                         System.out.println("b set over!");
                                 }
                                 System.out.println(username + " num=" + num);
                             } catch (InterruptedException e) {
                                  // TODO Auto-generated catch block
                                  e.printStackTrace();
                             }
                  }

            }         
         </pre>
       ThreadA.java<br>
         <pre>
              public class ThreadA extends Thread {

                   private HasSelfPrivateNum numRef;

                   public ThreadA(HasSelfPrivateNum numRef) {
                       super();
                       this.numRef = numRef;
                   }

                   @Override
                   public void run() {
                        super.run();
                        numRef.addI("a");
                   }

              }
         </pre>
         ThreadB.java<br>
         <pre>
             public class ThreadB extends Thread {

                  private HasSelfPrivateNum numRef;

                  public ThreadB(HasSelfPrivateNum numRef) {
                       super();
                       this.numRef = numRef;
                  }

                  @Override
                  public void run() {
                       super.run();
                       numRef.addI("b");
                  }

             }
         </pre>
         Run.java
         <pre>
             public class Run {
                  public static void main(String[] args) {
                       HasSelfPrivateNum numRef1 = new HasSelfPrivateNum();
                       HasSelfPrivateNum numRef2 = new HasSelfPrivateNum();
                       ThreadA athread = new ThreadA(numRef1);
                       athread.start();
                       ThreadB bthread = new ThreadB(numRef2);
                       bthread.start();
                  }
             } 

         </pre>
         运行结果:<br>
   a num = 100 停顿一会才执行 <br>   
        上面实例中两个线程ThreadA和ThreadB分别访问同一个类的不同实例的相同名称的同步方法,但是效果确实异步执行.<br>
   <span style="color: read">为什么会这样呢?</span><br>
         这是因为<span style="color: read">synchronized取得的锁都是对象锁,而不是把一段代码或方法当做锁</span>.所以在上面的实例中,那个线程先执行<br>
         带synchronized关键字的方法,那个线程就持有该方法<span style="color: read">所属对象的锁Lock</span>,那么其他线程只能呈等待状态,<span style="color: read">前提是多<br>
         个线程访问的是同一个对象</span>.本例中很显然是两个对象.<br>
         在本例中创建了两个HasSelfPrivateNum类对象,所以就产生了两个锁.当ThreadA的引用执行到addI方法中的<br>
   runThread.sleep(2000)语句时,ThreadB就会"乘机执行".所以才会导致执行结果如上图所示(备注:由于<br>
   runThread.sleep(2000),"a num=100" 停顿了两秒才输出)            
       </p>
   </div>
   
   <div>
       <h3>四synchronized方法与锁对象</h3>
       <p>
                          通过上面我们知道synchronized取得的锁都是对象锁,而不是把一段代码或方法当做锁.如果多个线程访问的是同一个<br>
                         对象,哪个线程先执行带synchronize关键字的方法,则哪个线程就持有该方法,那么其他线程只能呈等待状态.如果<br>
                        多个线程访问的是多个对象则不一定,因为对个对象会产生多个锁.<br>
        <span style="color: read">那么我们思考一下当多个线程访问的是同一个对象中的非synchronized类型方法会是什么效果?</span><br>
        <b>答案是:</b>会异步调用非synchronized类型方法,解决方法也很简单在非synchronized类型方法前加上synchronized关键<br>
                        字即可<br>
       </p>
   </div>
   
   <div>
       <h3>五 脏读</h3>
       <p>
       发生脏读的情况是在读取实例变量是,此值已经被其他线程更改过.<br>
       publicVar.java<br>
       <pre>
           public class PublicVar {
                public String username = "A";
                public String password = "AA";
                synchronized public void setValue(String username, String password) {
                          try {
                                this.username = username;
                                Thread.sleep(5000);
                                this.password = password;
                                System.out.println("setValue method thread name="
                                + Thread.currentThread().getName() + " username="
                                + username + " password=" + password);
                              } catch (InterruptedException e) {
                                  e.printStackTrace();
                              }
                }
                //该方法前加上synchronized关键字就同步了
                public void getValue() {
                     System.out.println("getValue method thread name="
                         + Thread.currentThread().getName() + " username=" + username
                         + " password=" + password);
                }
          }
       </pre>
       ThreadA.java<br>
       <pre>
            public class ThreadATwo extends Thread {
                 private PublicVar publicVar;

                 public ThreadATwo(PublicVar publicVar) {
                      super();
                      this.publicVar = publicVar;
                 }

                 @Override
                 public void run() {
                      super.run();
                      publicVar.setValue("B", "BB");
                 }
             }
       </pre>
       Test.java
       <pre>
       public class Test {

             public static void main(String[] args) {
                  try {
                         PublicVar publicVarRef = new PublicVar();
                         ThreadATwo thread = new ThreadATwo(publicVarRef);
                         thread.start();
                         Thread.sleep(200);//打印结果受此值大小影响
                         publicVarRef.getValue();
                      } catch (InterruptedException e) {
                         // TODO Auto-generated catch block
                         e.printStackTrace();
                      }
             }
       }
      
       </pre>
       解决方法:getValue()方法前加上synchronized关键字即可.
       </p>
   </div>
   
   <div>
       <h3>六 synchronized锁重入</h3>
       <p>
       可重入锁 概念是:自己可以再次获取自己的内部锁.比如一个线程获得了某个对象的锁,此时这个对象锁还没有释放,<br>
       当其再次想要获取这个对象锁的时候还是可以获取的,如果不可锁重入的话,就会造成死锁.
       </p>
       <p>
       Service.java<br>
       <pre>
       public class Service {
           synchronized public void service1() {
                 System.out.println("service1");
                 service2();
           }
           synchronized public void service2() {
                System.out.println("service2");
                service3();
           }
           synchronized public void service3() {
                System.out.println("service3");
           }

       }
       </pre>
       MyThread.java<br>
       <pre>
       public class Run {
           public static void main(String[] args) {
               MyThread t = new MyThread();
               t.start();
           }
        }
       </pre>
       Run.java<br>
       <pre>
       public class Run {
           public static void main(String[] args){
               MyThread t = new MyThread();
               t.start();
           }      
       }
       </pre>
       另外可重入锁也支持在父子类继承的环境中<br>
       Main.java<br>
       <pre>
         public class Main {
              public int i = 10;
              synchronized public void operateIMainMethod() {
                   try {
                         i--;
                         System.out.println("main print i=" + i);
                         Thread.sleep(100);
                       } catch (InterruptedException e) {
                         // TODO Auto-generated catch block
                         e.printStackTrace();
                       }
               }
          }
       </pre>
       Sub.java<br>
       <pre>
           public class Sub extends Main {

               synchronized public void operateISubMethod() {
                     try {
                            while (i > 0) {
                                 i--;
                                 System.out.println("sub print i=" + i);
                                 Thread.sleep(100);
                                 this.operateIMainMethod();
                            }
                          } catch (InterruptedException e) {
                                  e.printStackTrace();
                          }
                 }
            }
       </pre>
       MyThread.java<br>
       <pre>
           public class MyThread extends Thread {
               @Override
               public void run() {
                   Sub sub = new Sub();
                   sub.operateISubMethod();
               }
            }
       </pre>
       Run.java;
       <pre>
          public class Run {
              public static void main(String[] args) {
                  MyThread t = new MyThread();
                  t.start();
              }
          }
       </pre>
                     说明当存在父子类继承关系时,子类时完全可以通过"可重入锁" 调用父类的同步方法.<br>
                     另外出现异常时,其锁持有的锁会自动释放.<br>
       </p> 
   </div>
   <div>
       <h3>七同步不具有继承性</h3>
       <p>
                            如果父类有一个带synchronized关键字的方法,子类继承并重写了这个方法.<br>
                            但是同步不能继承,所以还是需要在子类方法中添加synchronized 关键字.
       </p>
   
   
   
   </div>
  
  
  
  
  
</div>
			
</body>
<script type="text/javascript">
</script>



</html>
