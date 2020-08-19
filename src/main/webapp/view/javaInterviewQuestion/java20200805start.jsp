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
	
	<style type="text/css">
	pre {
	     background:#282c34;
	     color:#abb2bf;
	     font-size: 14px;
	     font-family:Source Code Pro,DejaVu Sans Mono,Ubuntu Mono,Anonymous Pro,Droid Sans Mono,Menlo,Monaco,Consolas,Inconsolata,Courier,monospace,PingFang SC,Microsoft YaHei,sans-serif;  
	}
	div{ border-bottom: 1px solid black;
	
	
	}
	
	</style>
	
	
	
</head>
<body>
<div class="header">
   <div style="margin-left: 36px;margin-right: 36px;padding:12px;">
    
   
    <div>
    https://blog.csdn.net/qq_41701956/article/details/103253168
        <h3>51.ThreadLocal是什么?有哪些使用场景?</h3>
       <p>
                         线程局部变量是局限于线程内部的变量,属于线程自身所有,不在过个线程间共享.Java提供<br>
         ThreadLocal类来支持线程局部变量,是一种实现线程安全的方式.但是在管理环境下(如web服务<br>
                         器)使用线程局部变零的时候要特别小心.在这种情况下,工作线程的生命周期比任何应用变量的生命<br>
                         周期都要长.任何线程局部变量一旦在工作完成后没有释放,Java应用就存在内存泄露的风险.
       </p>   
   </div>
   <div>
       <h3>52.说一下synchronized底层实现原理?</h3>
       <p>
          synchronized可以保证方法或者代码块在运行时,同一时刻只有一个方法可以进入到临界区,同时它<br>
          还可以保证共享变量的内存可见性.        
       </p>
          java中每一个对象都可以作为锁.这是synchronized实现同步的基础:
          <ul>
              <li>普通同步方法,锁时当前实例对象</li>
              <li>静态同步方法,锁时当前类的class对象</li>
              <li>同步方法块,锁时括号里面的对象</li> 
          </ul>      
   </div>
   <div>
       <h3>53.synchronized和volatile的区别是什么?</h3>
       <ol>
           <li>volatile本质是在告诉jvm当前变量在寄存器(工作内存)中的值是不确定的,需要从主存中读取;<br>
           synchronized则是锁定当前变量,只有当前线程可以访问该变量,其他线程被阻塞住.</li>
           <li>volatile仅能使用在变量级别;synchronized则可以使用在变量,方法,和类级别的.</li>
           <li>volatile仅能实现变量的修改可见性,不能保证原子性;而synchronized则可以保证变量的休干<br>
                             可见性和原子性.</li> 
           <li>volatile不会造成线程的阻塞;synchronized可能会造成线程的阻塞.</li>
           <li>volatile标记的变零不会被编译器优化;synchronized标记的变量可以被编译器优化.</li>
       </ol>
   </div>
   <div>
       <h3>54.synchronized 和 Lock 有什么区别？</h3>
       <ol>
       <li>首先synchronized是java内置关键字，在jvm层面，Lock是个java类;</li>
       <li>synchronized无法判断是否获取锁的状态，Lock可以判断是否获取到锁;</li>
       <li>synchronized会自动释放锁(a 线程执行完同步代码会释放锁 ；b 线程执行过程中发生异常会释<br>
                               放锁)，Lock需在finally中手工释放锁（unlock()方法释放锁），否则容易造成线程死锁;</li>
       <li>用synchronized关键字的两个线程1和线程2，如果当前线程1获得锁，线程2线程等待。如果线<br>
                              程1阻塞，线程2则会一直等待下去，而Lock锁就不一定会等待下去，如果尝试获取不到锁，线程<br>
                              可以不用一直等待就结束了;</li>
       <li>synchronized的锁可重入、不可中断、非公平，而Lock锁可重入、可判断、可公平（两者皆可）</li>
       <li>Lock锁适合大量同步的代码的同步问题，synchronized锁适合代码少量的同步问题</li>
       </ol>   
   </div>
   <div>
        <h3>55. synchronized 和 ReentrantLock 区别是什么？</h3>
        <p>synchronized是和if、else、for、while一样的关键字，ReentrantLock是类，这是二者的本质区别。<br>
                               既然ReentrantLock是类，那么它就提供了比synchronized更多更灵活的特性，可以被继承、可以有<br>
                                方法、可以有各种各样的类变量，ReentrantLock比synchronized的扩展性体现在几点上： 
        </p>
        <ol>
           <li>ReentrantLock可以对获取锁的等待时间进行设置，这样就避免了死锁 </li>
           <li>ReentrantLock可以获取各种锁的信息</li>
           <li>ReentrantLock可以灵活地实现多路通知 </li>
        </ol>
        <p>
                      另外，二者的锁机制其实也是不一样的:ReentrantLock底层调用的是Unsafe的park方法加锁，<br>
        synchronized操作的应该是对象头中mark word。  
        </p>  
   </div>
   <div>
       <h3>56. 说一下 atomic 的原理？</h3>
       <p>
       Atomic包中的类基本的特性就是在多线程环境下，当有多个线程同时对单个（包括基本类型及引用类<br>
                   型）变量进行操作时，具有排他性，即当多个线程同时对该变量的值进行更新时，仅有一个线程能成<br>
                   功，而未成功的线程可以向自旋锁一样，继续尝试，一直等到执行成功。<br>             
       </p>
       <p>
       Atomic系列的类中的核心方法都会调用unsafe类中的几个本地方法。我们需要先知道一个东西就是<br>
       Unsafe类，全名为：sun.misc.Unsafe，这个类包含了大量的对C代码的操作，包括很多直接内存分<br>
                   配以及原子操作的调用，而它之所以标记为非安全的，是告诉你这个里面大量的方法调用都会存在安全隐患,<br>
                  需要小心使用,否则会导致严重的后果,例如在通过unsafe分配内存的时候,如果自己指定某些区域可能<br>
                  会导致一些类似C++一样的指针越界到其他进程的问题.
       </p>
   
   </div>
   <div>
       <h2>四.反射</h2>
       <h3>57.什么是反射?</h3>
                 反射主要是指程序可以访问,检测和修改它本身状态或行为的一种能力<br>
       Java反射:
       在java运行时环境中,对于任意一个类,能否知道这个类有哪些属性和方法?对于任意一个对象,能否<br>
       调用它的任意一个方法.<br>
   Java反射机制主要提供了以下功能:<br>
   <ol>
       <li>在运行时判断任意一个对象所属的类.</li>
       <li>在运行时构造任意一个类的对象.</li>
       <li>在运行时判断任意一个类所具有的成员变量和方法.</li>
       <li>在运行时调用任意一个对象的方法.</li>
   </ol>
   </div>
   <div>
       <h3>58.什么是java序列化?什么情况下需要序列化?</h3>
       <p>
                        简单说就是为了保存在内存中的各种对象的状态（也就是实例变量，不是方法），并且可以把保存的<br>
                        对象状态再读出来。虽然你可以用你自己的各种各样的方法来保存object states，但是Java给你提供<br>
                        一种应该比你自己好的保存对象状态的机制，那就是序列化。<br>                           
       </p>
                    什么情况下需要序列化:<br>
       <ol>
           <li>当你想把内存中的对象状态保存到一个文件中或者数据库中的时候;</li>
           <li>当你想用套接字在网络上传送对象的时候;</li>
           <li>当你想通过RMI传输对象的时候;</li>
       </ol>             
   </div>  
   <div>
       <h3>59.动态代理是什么?有哪些应用?</h3>
       
             动态代理:<br>
     <p>
             当想要给实现了某个接口的类中的方法,加一些额外的处理.比如说加日志,加事务等.可以给这个<br>
             类创建一个代理,顾名思义就是创建一个新的类,这个类不仅包含原来类方法的功能,而且还在原来的<br>
             基础上添加了额外处理的新类.这个代理类并不是定义好的,是动态生成的.具有解耦意义,灵活,扩展性强 <br>
     </p>
             动态代理的应用<br>
     <ol>
       <li>Spring的AOP</li>
       <li>加事务</li>
       <li>加权限</li>
       <li>加日志</li>
     </ol>                       
   </div>
  <div>
      <h3>60.怎么实现动态代理?</h3>
      <p>
                      首先必须定义一个接口,还要有Invo擦通Handler(将实现接口的类的对象传递给它)处理类.再<br>
                   有一个工具类Proxy(习惯性将其称为代理类,因此调用他的newInstance()可以产生代理对象,其实他<br>
                   只是一个产生代理对象的工具类).利用到InvocationHander,拼接代理类源码,将其编译生成代理类 <br>
                   的二进制码,利用加载器加载,并将其实例化产生代理对象,最后返回.                          
      </p>
  </div> 
  <div>
      <h2>五,对象拷贝</h2>
      <h3>61.为什么要使用克隆?</h3>
    <p>  相对一个对象进行处理,又想保留原有的数据进行接下来的操作,就需要克隆了,Java语言中克隆针对<br>
      的是类的实例.</p>
  </div> 
   
   <div>
       <h3>62.如何实现对象克隆</h3>
       有两种方式:<br>
   <ol>
      <li>实现Cloneable接口并重写Object类中的clone()方法;</li>
      <li> 实现Serializable接口，通过对象的序列化和反序列化实现克隆，可以实现真正的深度克隆，代码如下：</li>  
   </ol>    
   <pre>
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
 
public class MyUtil {
 
    private MyUtil() {
        throw new AssertionError();
    }
 
    @SuppressWarnings("unchecked")
    public static &lt;T extends Serializable&gt; T clone(T obj) throws Exception {
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(bout);
        oos.writeObject(obj);
 
        ByteArrayInputStream bin = new ByteArrayInputStream(bout.toByteArray());
        ObjectInputStream ois = new ObjectInputStream(bin);
        return (T) ois.readObject();
 
        // 说明：调用ByteArrayInputStream或ByteArrayOutputStream对象的close方法没有任何意义
        // 这两个基于内存的流只要垃圾回收器清理对象就能够释放资源，这一点不同于对外部资源（如文件流）的释放
    }
}

   </pre>
   下面是测试代码<br>
   
   <pre>
   
import java.io.Serializable;
 
/**
 * 人类
 * @author nnngu
 *
 */
class Person implements Serializable {
    private static final long serialVersionUID = -9102017020286042305L;
 
    private String name;    // 姓名
    private int age;        // 年龄
    private Car car;        // 座驾
 
    public Person(String name, int age, Car car) {
        this.name = name;
        this.age = age;
        this.car = car;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
 
    public Car getCar() {
        return car;
    }
 
    public void setCar(Car car) {
        this.car = car;
    }
 
    @Override
    public String toString() {
        return "Person [name=" + name + ", age=" + age + ", car=" + car + "]";
    }
 
}
   
   </pre>
   <pre>
/**
 * 小汽车类
 * @author yf
 *
 */
class Car implements Serializable {
    private static final long serialVersionUID = -5713945027627603702L;
 
    private String brand;       // 品牌
    private int maxSpeed;       // 最高时速
 
    public Car(String brand, int maxSpeed) {
        this.brand = brand;
        this.maxSpeed = maxSpeed;
    }
 
    public String getBrand() {
        return brand;
    }
 
    public void setBrand(String brand) {
        this.brand = brand;
    }
 
    public int getMaxSpeed() {
        return maxSpeed;
    }
 
    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }
 
    @Override
    public String toString() {
        return "Car [brand=" + brand + ", maxSpeed=" + maxSpeed + "]";
    }
 
}
   
   
   
   
   </pre>
   
   
   
      
      <pre>
      class CloneTest {
           public static void main(String[] args) {
               try {
                     Person p1 = new Person("郭靖", 33, new Car("Benz", 300));
                     Person p2 = MyUtil.clone(p1);   // 深度克隆
                     p2.getCar().setBrand("BYD");
                     // 修改克隆的Person对象p2关联的汽车对象的品牌属性
                     // 原来的Person对象p1关联的汽车不会受到任何影响
                     // 因为在克隆Person对象时其关联的汽车对象也被克隆了
                     System.out.println(p1);
                   } catch (Exception e) {
                     e.printStackTrace();
                   }
           }
      }
      
      
      </pre>
   
   <p>
   注意:基于序列化和反序列化实现的克隆不仅仅是深度克隆,更重要的是通过泛型限定,可以检查出<br>
   要克隆的对象是否支持序列化,这项检查是编译器完成的,不是在运行时抛出异常,这种方案明显优于使用<br>
 Object类的clone方法克隆对象.让问题在编译的时候暴露出来总是好过把问题留到运行时. 
   </p>
   
   </div>
   <div>
      <h3>63.深拷贝和浅拷贝区别是什么?</h3> 
      <ol>
      <li>浅拷贝只是复制了对象的引用地址,两个对象指向同一个内存地址,所以修改其中任意的值,另<br>
                           一个值都会随之变化,这就是浅拷贝(例:assign())</li>
      <li>深拷贝是将对象及值复制过来,两个对象修改其中任意的值另一个值不会改变,这就是深拷贝<br>
          (例：JSON.parse()和JSON.stringify()，但是此方法无法复制函数类型)</li>
      </ol>
   </div>
   <div>
       <h2>六.Java Web</h2>
       <h3>64.jsp和servlet有什么区别?</h3>
        <ol>
           <li>jsp经编译后就变成了Servlet(JSP的本质就是Servlet,JVM只能识别java的类,不能识别JSP的代码,<br>
           Web容器将JSP的代码编译成JVM能够识别的java类)</li>
           <li>JSP更擅长表现于页面显示,servlet更擅长于逻辑控制.</li>
           <li>Servlet中没有内置对象,Jsp中的内置对象都是必须通过HttpServletRequest对象,<br>
           HttpServletResponse对象以及HttpServlet对象得到.</li>
           <li>Jsp是Servlet的一种简化,使用Jsp只需要完成程序员需要输出到客户端的内容,Jsp中的Java<br>
                               脚本如何镶嵌到一个类中,由Jsp容器完成,而Servlet则是个完整的Java类,这个类的Service方<br>
                               法用于生成客户端的响应.</li>
        </ol>
   </div>  
   <div>
       <h3>65. jsp 有哪些内置对象？作用分别是什么？</h3>
       JSP有9个内置对象
        <ol>
           <li>request:封装客户端的请求,其中包含来自GET或POST请求的参数;</li>
           <li>response:封装服务器对客户端的响应;</li>
           <li>pageContext:通过该对象可以获取其他对象;</li>
           <li>session:封装用户会话的对象;</li>
           <li>application:封装服务器运行环境的对象;</li>
           <li>out:输出服务器响应的输出流对象;</li>
           <li>config:Web应用的配置对象;</li>
           <li>Page:JSP页面本身(相当于Java程序中的this)</li>
           <li>exception:封装页面抛出异常的对象.</li>
        </ol>
   </div>
   <div>
       <h3>66.说一下jsp的4种作用域?</h3>
       JSP中的四种作用域包括page,request,session和application.具体来说:
       <ol>
       <li>page:代表与一个页面相关的对象和属性.</li>
       <li>request:代表与Web客户端发出的一个请求相关的对象和属性.一个请求可能跨越多个页面,涉及<br>
                      多个Web组件;需要在页面显示的临时数据可以置于此作用域.</li>
       <li>session:代表某个用户与服务器建立的一次会话相关的对象和属性.跟某个用户相关的数据应该<br>
                      放在用户自己的session中.</li>
       <li>apolication代表与整个web应用程序相关的对象和属性,它实质上是跨越整个web应用程序,<br>
                    包括多个页面,请求和会话的一个全局作用域.</li>
       </ol>
   </div>
   <div>
       <h3>67.session和cookie 有什么区别?</h3>
       <ol>
       <li>由于HTTP协议是无状态的协议，所以服务端需要记录用户的状态时，就需要用某种机制来识具<br>
                              体的用户，这个机制就是Session.典型的场景比如购物车，当你点击下单按钮时，由于HTTP协议<br>
                              无状态，所以并不知道是哪个用户操作的，所以服务端要为特定的用户创建了特定的Session，<br>
                              用于标识这个用户，并且跟踪用户，这样才知道购物车里面有几本书。这个Session是保存在<br>
                              服务端的，有一个唯一标识。在服务端保存Session的方法很多，内存、数据库、文件都有。集<br>
                              群的时候也要考虑Session的转移，在大型的网站，一般会有专门的Session服务器集群，用来保<br>
                              存用户会话，这个时候 Session 信息都是放在内存的，使用一些缓存服务比如Memcached之类<br>
                              的来放 Session.</li>
       <li>思考一下服务端如何识别特定的客户？这个时候Cookie就登场了。每次HTTP请求的时候，客户<br>
                              端都会发送相应的Cookie信息到服务端。实际上大多数的应用都是用 Cookie 来实现Session跟<br>
                              踪的，第一次创建Session的时候，服务端会在HTTP协议中告诉客户端，需要在 Cookie 里面记<br>
                              录一个Session ID，以后每次请求把这个会话ID发送到服务器，我就知道你是谁了。有人问，如 <br>
                              果客户端的浏览器禁用了Cookie怎么办?一般这种情况下，会使用一种叫做URL重写的技术来<br>
                              进行会话跟踪,即每次HTTP交互,URL后面都会被附加上一个诸如sid=xxxxx这样的参数,服务端<br>
                              根据此来识别用户.</li>
       <li>Cookie其实还可以用在一些方便用户的场景下,设想你某次登陆过一个网站,下次登陆的时候不<br>
                              想再次输入账号了，怎么办？这个信息可以写到Cookie里面，访问网站的时候，网站页面的脚本<br>
                              可以读取这个信息，就自动帮你把用户名给填了，能够方便一下用户。这也是Cookie名称的由来,<br>
                              给用户的一点甜头。所以，总结一下：Session是在服务端保存的一个数据结构，用来跟踪<br>
                              用户的状态，这个数据可以保存在集群、数据库、文件中；Cookie是客户端保存用户信息的一种<br>
                              机制，用来记录用户的一些信息，也是实现Session的一种方式。</li>
       </ol>
   </div>
   <div>
       <h3>68.说一下session的工作原理?</h3>
       <p>
                          其实session是一个存在服务器上的类似于一个散列表格的文件。里面存有我们需要的信息，在我们需<br>
                          要用的时候可以从里面取出来。类似于一个大号的map吧，里面的键存储的是用户的sessionid，用<br>
                         户向服务器发送请求的时候会带上这个sessionid。这时就可以从中取出对应的值了。                                       
       </p>
   </div>
   <div>
       <h3>69.如果客户端禁止 cookie 能实现 session 还能用吗？</h3>
       <p>
          Cookie与 Session，一般认为是两个独立的东西，Session采用的是在服务器端保持状态的方案，而<br>
          Cookie采用的是在客户端保持状态的方案。但为什么禁用Cookie就不能得到Session呢？因为<br>
          Session是用Session ID来确定当前对话所对应的服务器Session，而Session ID是通过Cookie来传递<br>
                           的，禁用Cookie相当于失去了Session ID，也就得不到Session了。
       </p>
                     假定用户关闭Cookie的情况下使用Session，其实现途径有以下几种：<br>
        <ol>
        <li>设置php.ini配置文件中的"session.use_trans_sid = 1",或者编译时打开了"--enable-<br>
        trans-sid"选项,让PHP自动跨页传递Session ID.</li>             
        <li>手动通过URL传值,隐藏表单传递Session ID.</li>             
        <li>用文件,数据库等形式保存Session ID,在跨页过程中手动调用.</li>             
        </ol>
   </div>
   <div>
       <h3>70. spring mvc 和 struts 的区别是什么？</h3>
       (1)拦截机制的不同<br>
       <p>
       Struts2是类级别的拦截，每次请求就会创建一个Action，和Spring整合时Struts2的ActionBean注入<br>
                  作用域是原型模式prototype，然后通过setter，getter吧request数据注入到属性。Struts2中，一个<br>
       Action对应一个request，response上下文，在接收参数时，可以通过属性接收，这说明属性参数是<br>
                  让多个方法共享的。Struts2中Action的一个方法可以对应一个url，而其类属性却被所有方法共享，<br>
                  这也就无法用注解或其他方式标识其所属方法了，只能设计为多例。           
       </p>
       <p>
       SpringMVC是方法级别的拦截，一个方法对应一个Request上下文，所以方法直接基本上是独立的，<br>
                   独享request，response数据。而每个方法同时又和一个url对应，参数的传递是直接注入到方法中<br>
                   的，是方法所独有的。处理结果通过ModeMap返回给框架。在Spring整合时，SpringMVC的<br>
       Controller Bean默认单例模式Singleton，所以默认对所有的请求，只会创建一个Controller，又因<br>
                   为没有共享的属性，所以是线程安全的，如果要改变默认的作用域，需要添加@Scope注解修改。                        
       </p>
       <p>
          Struts2有自己的拦截Interceptor机制，SpringMVC这是用的是独立的Aop方式，这样导致Struts2的<br>
                          配置文件量还是比SpringMVC大。
       </p>
       (2)底层框架的不同<br>
       <p>
          Struts2采用Filter(StrutsPrepareAndExecuteFilter)实现,SpringMVC(DispatcherServlet)则<br>
                          采用Servlet实现.Filter在容器启动之后即初始化;服务停止以后坠毁,晚于Servlet.Servlet是在<br>
                          调用时初始化,先于Filter调用,服务停止后销毁.
       </p>
       (3)性能方面<br>
        <p>
           Struts是类级别的拦截,每次请求对应实例一个新的Action,需要加载所有的属性值注入,<br>
           SpringMVC实现了零配置,由于SpringMVC基于方法的拦截,有加载一次单例模式bean注入.所以<br>
           SpringMVC开发效率和性能高于Struts2.
        </p>
       (4)配置方面<br>
       Spring MVC和Spring是无缝的.从这个项目的管理和安全上也比Struts2高.
   </div>
   <div>
       <h3>71.如何避免sql注入?</h3>
       <ol>
       <li>PreparedStatement(简单又有效的方法)</li>
       <li>使用正则表达式过滤传入的参数</li>
       <li>字符串过滤</li>
       <li>JSP中调用该函数检查是否包含非法字符</li>
       <li>JSP页面判断代码</li>
       </ol>
   </div>
   <div>
       <h3>72.什么是XSS攻击,如何避免?</h3>
       <p>
          XSS攻击又称CSS,全称Cross Site Script(跨站脚本攻击),其原理是攻击者向右XSS漏洞的网站中输入恶意<br>
                         的HTML代码,当用户浏览该网站时,这段HTML代码会自动执行,从而达到攻击的目的.XSS攻击类似于SQL注入攻击,<br>
         SQL注入攻击中以SQL语句作为用户输入,从而达到查询/修改/输出数据的目的,而在xss攻击中,通过插入恶意脚本,<br>
                        实现对用户浏览器的控制,获取用户的一些信息.XSS是Web程序中常见的漏洞,XSS属于被动式且用于客户端的攻击方式.<br>
         XSS防范的总体思路是:对输入(和URL参数)进行过滤,对输出进行编码.       
       </p>
   </div>
   <div>
       <h3>73.什么是CSRF攻击,如何避免?</h3>
       <p>
          CSRF(Cross-site request forgery)也被称为 one-click attack或者 session riding,中文全称是<br>
                         叫跨站请求伪造.一般来说,攻击者通过伪造用户的浏览器的请求,向访问一个用户自己曾经认证访<br>
                         问过的网站发送出去,使目标网站接收并误以为是用户的真实操作而去执行命令.常用于盗取账号.<br>
                         转账,发送虚假消息等.攻击者利用网站对请求的验证漏洞而实现这样的攻击行为,网站能够确认请求<br>
                         来源于用户的浏览器,却不能验证请求是否源于用户的真实意愿下的操作行为.
       </p>
                    如何避免:<br>
       1.验证 HTTP Referer字段<br>
       <p>
       HTTP头中的Referer字段记录了该 HTTP 请求的来源地址。在通常情况下，访问一个安全受限<br>
                   页面的请求来自于同一个网站，而如果黑客要对其实施 CSRF攻击,他一般只能在他自己的网站构造<br>
                   请求。因此，可以通过验证Referer值来防御CSRF 攻击。
       </p>             
       2.使用验证码<br>
       <p>
                           关键操作页面加上验证码,后台收到请求后通过判断验证码可以防御CSRF.但这种方法对用户不太友好.
       </p>
       3.在请求地址中添加token并验证.<br>
       <p>
         CSRF 攻击之所以能够成功，是因为黑客可以完全伪造用户的请求，该请求中所有的用户验证信<br>
                         息都是存在于cookie中，因此黑客可以在不知道这些验证信息的情况下直接利用用户自己的<br>
         cookie 来通过安全验证。要抵御 CSRF，关键在于在请求中放入黑客所不能伪造的信息，并且<br>
                         该信息不存在于 cookie 之中。可以在 HTTP 请求中以参数的形式加入一个随机产生的 token，<br>
                         并在服务器端建立一个拦截器来验证这个 token，如果请求中没有token或者 token 内容不正<br>
                         确，则认为可能是 CSRF 攻击而拒绝该请求。这种方法要比检查 Referer 要安全一些，token<br>
                         可以在用户登陆后产生存放于session之中，然后在每次请求时把token 从 session 中拿出，与 <br>
                         请求中的 token 进行比对，但这种方法的难点在于如何把 token 以参数的形式加入请求.<br>                               
                          对于 GET 请求，token 将附在请求地址之后，这样 URL 就变成 http://url?csrftoken=tokenvalue.<br>
                         而对于 POST 请求来说，要在 form 的最后加上 &lt;input type="hidden" name="csrftoken"<br>
         value="tokenvalue"/&gt;，这样就把token以参数的形式加入请求了。                                                               
       </p>
       4.在HTTP头中自定义属性并验证<br>
       <p>
                         这种方法也是使用 token 并进行验证，和上一种方法不同的是，这里并不是把 token 以参数的<br>
                        形式置于 HTTP 请求之中，而是把它放到 HTTP 头中自定义的属性里。通过 XMLHttpRequest<br>
                        这个类,可以一次性给所有该类请求加上csrftoken这个HTTP头属性,并把token值放入其中.<br>
                        这样解决了上种方法在请求中加入token的不便,同时,通过XMLHttpRequest请求的地址不会<br>
                        被记录到浏览器的地址栏,也不用担心token会透过Referer泄露到其他网站中去.                            
       </p>
   
   </div>
   <div>
       <h2>七.异常</h2> 
       <h3>74.throw 和 throws的区别?</h3>
       <p>
       throws是用来声明一个方法可能抛出的所有异常信息，throws是将异常声明但是不处理，而是将异<br>
                   常往上传，谁调用我就交给谁处理。而throw则是指抛出的一个具体的异常类型。<br>
       </p>
   </div>
   <div>
       <h3>75.final,finally,finalize有什么区别?</h3>
       <ol>
          <li>final可以修饰类,变量,方法,修饰类便是该类不能被继承,修饰方法表示该方法不能被重写,<br>
                                      修饰变量表示该变量是一个常量不能被重新赋值.</li>
          <li>finally一般作用在try-catch代码块中,在处理异常的时候,通常我们将一定要执行的代码方法<br>
              finally代码块中,便是不管是否出现异常,该代码块都会执行,一般用来存放一些关闭资源的代码.</li>
          <li>finalize是一个方法,属于Object类的一个方法,而Object类是所有类的父类,该方法一般由垃<br>
                                      圾回收器来调用,当我们调用System的gc()方法的时候,由垃圾回收器调用finalize(),回收垃圾</li>
       </ol>
   
   </div>
   <div>
      <h3>76. try-catch-finally 中哪个部分可以省略？</h3>
      <p>
                        答:catch 和 finally 语句块可以省略其中一个。但是不能同时省略?              
      </p>
   </div>
   <div>
       <h3>77.ry-catch-finally 中，如果 catch 中 return 了，finally 还会执行吗？</h3>
                              答:会执行,在return前执行.<br> 
       <pre>
        
    /*
     * java面试题--如果catch里面有return语句，finally里面的代码还会执行吗？
     */
     public class FinallyDemo2 {
         public static void main(String[] args) {
             System.out.println(getInt());
         }
 
         public static int getInt() {
             int a = 10;
             try {
                   System.out.println(a / 0);
                   a = 20;
                 } catch (ArithmeticException e) {
                   a = 30;
                   return a;
                  /*
                   * return a 在程序执行到这一步的时候，这里不是return a 而是 return 30；这个返回路径就形成了
                   * 但是呢，它发现后面还有finally，所以继续执行finally的内容，a=40
                   * 再次回到以前的路径,继续走return 30，形成返回路径之后，这里的a就不是a变量了，而是常量30
                   */
                } finally {
                  a = 40;
                }
 
                 //      return a;
         }
     }

       </pre>
                  执行结果：30<br>
   
   <pre>
       /*
        * java面试题--如果catch里面有return语句，finally里面的代码还会执行吗？
        */
   public class FinallyDemo2 {
            public static void main(String[] args) {
                System.out.println(getInt());
            }
 
        public static int getInt() {
            int a = 10;
            try {
                 System.out.println(a / 0);
                 a = 20;
            } catch (ArithmeticException e) {
                a = 30;
               return a;
               /*
                * return a 在程序执行到这一步的时候，这里不是return a 而是 return 30；这个返回路径就形成了
                * 但是呢，它发现后面还有finally，所以继续执行finally的内容，a=40
                * 再次回到以前的路径,继续走return 30，形成返回路径之后，这里的a就不是a变量了，而是常量30
                */
            } finally {
                a = 40;
               return a; //如果这样，就又重新形成了一条返回路径，由于只能通过1个return返回，所以这里直接返回40
            }
 
               //return a;
         }
    }

   </pre>
         执行结果：40<br>
   </div>
   <div>
       <h3>78. 常见的异常类有哪些？</h3>
       <ol>
           <li>NullPointerException:当应用程序试图访问空对象时,则抛出该异常(空指针异常) </li>
           <li>SQlException:提供关于数据库访问错误或其他错误信息的异常.</li>
           <li>IndexOutOfBoundsException：指示某排序索引（例如对数组、字符串或向量的排序）<br>
                                         超出范围时抛出。(我喜欢叫它数组越界异常)</li>
           <li>NumberFormatException：当应用程序试图将字符串转换成一种数值类型，但该字符串不能转<br>
                                        换为适当格式时，抛出该异常。</li>
           <li>FileNotFoundException：当试图打开指定路径名表示的文件失败时，抛出此异常。 <li>
           <li>IOException：当发生某种I/O异常时，抛出此异常。此类是失败或中断的I/O操作生成的异常的通用类。</li>
           <li>ClassCastException：当试图将对象强制转换为不是实例的子类时，抛出该异常。</li>
           <li>ArrayStoreException：试图将错误类型的对象存储到一个对象数组时抛出的异常。</li>
           <li>IllegalArgumentException：抛出的异常表明向方法传递了一个不合法或不正确的参数。</li>
           <li>ArithmeticException：当出现异常的运算条件时，抛出此异常。例如，一个整数“除以零”<br>
                                时，抛出此类的一个实例。 </li>
           <li>NegativeArraySizeException：如果应用程序试图创建大小为负的数组，则抛出该异常。</li>
           <li>NoSuchMethodException：无法找到某一特定方法时，抛出该异常。</li>
           <li>SecurityException：由安全管理器抛出的异常，指示存在安全侵犯。</li>
           <li>UnsupportedOperationException：当不支持请求的操作时，抛出该异常。</li>
           <li></li>
       </ol> 
   </div>
   <div>
       <h2>八.网络</h2>
       <h3>79.http响应码301和302代表的是什么?有什么区别</h3>
       答：301，302 都是HTTP状态的编码，都代表着某个URL发生了转移。<br>
    区别： <br>   
      <ol>
         <li>301 redirect: 301 代表永久性转移(Permanently Moved)。 </li>
         <li>302 redirect: 302 代表暂时性转移(Temporarily Moved )</li>
      </ol>
   </div>
   <div>
       <h3>80. forward 和 redirect 的区别？</h3>
   Forward和Redirect代表了两种请求转发方式：直接转发和间接转发。<br>
        直接转发方式（Forward），客户端和浏览器只发出一次请求，Servlet、HTML、JSP或其它信息资<br>
   源，由第二个信息资源响应该请求，在请求对象request中，保存的对象对于每个信息资源是共享的。<br>
        间接转发方式（Redirect）实际是两次HTTP请求，服务器端在响应第一次请求的时候，让浏览器再 <br>
   向另外一个URL发出请求，从而达到转发的目的。      
   举个通俗的例子:<br>
    直接转发就相当于：“A找B借钱，B说没有，B去找C借，借到借不到都会把消息传递给A”；<br>
    间接转发就相当于："A找B借钱，B说没有，让A去找C借"。<br>
   </div>
   <div>
       <h3>81.简述tcp和udp的区别?</h3>
        <ol>
           <li>TCP面向连接(如打电话要先拨号建立连接):UDP是无连接的,即发送数据之前不需要建立连接.</li>
           <li>TCP提供可靠的服务.也就是说,通过TCP连接传送的数据,无差错,不丢失,不重复,且按序到达;<br>
               UDP尽最大努力交付,即不保证可靠交付.</li>
           <li>TCP通过效验和,重传控制,序号标识,滑动窗口,确认应答实现可靠传输.如丢包时的重发控制<br>
                                         还可以对次序错乱的分包进行顺序控制.</li>
           <li>UDP具有较好的实时性,工作效率比TCP高,适用于对高速传输和实时性有较高的通信或广播通信.</li>
           <li>每一条TCP链接只能是点到点的;UDP支持一对一,一对多,多对一和多对多的交互通信.</li>
           <li>TCP对系统资源要求较多,UDP对系统资源要求较少.</li>
        </ol>
   </div>
   <div>
        <h3>82.tcp为什么要三次握手,两次不行吗?为什么?</h3>
        <p>
          为了实现可靠数据传输,TCP协议的通信双方,都必须维护一个序列号,以标识发送出去的数据包中,哪些是已经被对象收到的.<br>
          三次握手的过程即是通信双方相互告知序列号起始值,并确认对象已经收到了序列号起始值的必经步骤.<br>
           如果只是两次握手,至多只有链接发起方的起始序列号能被确认,另一方面选择的序列号则得不到确认.
        </p>
   </div>
   <div>
       <h3>83.说一下tcp粘包是怎么产生的?</h3>
          1.发送方产生粘包<br>
                              采用TCP协议传输数据的客户端与服务器经常是保持一个长链接的状态?(一次链接发送一次数据不存在粘包),<br>
                              双方在链接不断开的情况下,可以一直传输数据;但当发送的数据包过于的小时,那么TCP协议默认的会启用<br>
           Nagle算法,将这些较小的数据包进行合并发送(缓冲去数据发送是一个堆压的过程)这个合并过程就是在发送缓冲区中<br>
                              进行的,也就是说数据发送出来它已经是粘包的状态了.
          2接收方产生粘包<br>
                              接收方采用TCP协议接收数据时的过程是这样的:数据到底接收方,从网络模型的下方传至传输层,传输层的TCP协议<br>
                              处理时将其放置接收缓冲区,然后由应用层来主动获取(C语言用recv,read等函数);这时会出现一个问题,就是我<br>
                              们在程序中调用的读取数据函数不能及时的把缓冲区中的数据拿出来,而下一个数据又到来并有一部分放入缓冲区的末尾,<br>
                              等我们读取数据是就是一个粘包.(方数据的速度>应用层拿数据的速度.)
   </div>
   <div>
        <h3>84.OSI的七层模型都有哪些?</h3>
        <ol>
           <li>应用层:网络服务与最终用户的一个接口.</li>
           <li>表示层:数据的表示,安全,压缩.</li>
           <li>会话层:建立,管理,终止会话.</li>
           <li>传输层:定义传输数据的协议端口号,以及流控制和差错效验.</li>
           <li>网络层:进行逻辑地址寻址,实现不同网络之间的路径选择.</li>
           <li>数据链路层:建立逻辑连接,进行硬件地址寻址,差错效验等功能.</li>
           <li>物理层:建立,维护,断开物理连接</li>
        </ol>
   </div>
   <div>
       <h3>85.get和post请求有哪些区别?</h3>
       <ol>
          <li>GET在浏览器回退时是无害的,而POST会再次提交请求.</li>
          <li>GET产生的URL地址可以被Bookmark(书签收藏),而POST不可以</li>
          <li>GET请求会被浏览器主动cache(缓存),而POST不会,除非手动设置.</li>
          <li>GET请求只能进行url编码,而POST支持多种编码方式.</li>
          <li>GET请求参数会被完整保留在浏览器历史记录里,而POST中的参数不会被保留.</li>
          <li>GET请求在URL中传送的参数是有长度限制的,而POST么有.</li>
          <li>对参数的数据类型,GET只接受ASCII字符,而POST没有限制.</li>
          <li>GET比POST更不安全,因为参数直接暴露在URL上,所以不能用来传递敏感信息.</li>
          <li>GET参数通过URL传递,POST放在Request body中.</li>
          <li></li>
       </ol>
   </div>
   <div>
       <h3>86.如何实现跨域?</h3>
       <h4>方式一:图片ping或script标签跨域</h4>
       图片ping常用于跟踪用户点击页面或动态广告曝光次数.<br>
  script标签可以得到从其他来源数据,这也是JSONP依赖的根据.<br>     
       <h4>方式二: JSONP跨域</h4>
       <p>JSONP(JSON with Padding)是数据格式JSON的一种"使用模式",可以让网页从别的网域要数据<br>
                   根据XmlHttpRequest对象受到同源策略的影响,而利用&lt;script&gt;元素的这个开放策略,网页<br>
                   可以得到从其他来源动态产生的JSON数据,而这种使用模式就是所谓的JSONP.用JSONP抓到的数据并不是<br>
       JSON,而是任意的JavaScript,用JavaScript解释器运行而不是用JSON解释器解析.所有,通过<br>
       Chrome查看的所有JSONP发送的Get请求都是js类型,而非XHR.
       <p>           
           缺点:<br> 
       <ol>
       <li>只能使用Get请求</li>
       <li>不能注册success,error等事件监听函数,不能很容易的确定JSONP请求是否失败</li>
       <li>JSONP 是从其他域中加载代码执行,容易受到跨站请求伪造的攻击,其安全性无法确保</li>
       </ol>
      <h4>方式三: CORS</h4>
       <P>
         Cross-Origin Resource Sharing(CORS)跨域资源共享是一份浏览器技术的规范,提供了Web服务<br>
                       从不同域传来的沙盒脚本的方法,以避开浏览器的同源策略,确保安全的跨域数据传输.现代浏览器使用CORS在API容器<br>
                       如XMLHttpRequest来减少HTTP请求的风险来源.与JSONP不同,COARS除了GET请求方法以外也支持其他的<br>
         HTTP请求.服务器一般需要增加如下响应头的一种或几种:               
        <pre>
            Access-Control-Allow-Origin: *
            Access-Control-Allow-Methods: POST, GET, OPTIONS
            Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
            Access-Control-Max-Age: 86400
        </pre>
       </P>   
                     跨域请求默认不会携带Cookie信息,如果需要携带,请配置下述参数:<br>
       <pre>    
         "Access-Control-Allow-Credentials": true
         // Ajax设置
         "withCredentials": true
       </pre>              
        <h4>方式四window.name+iframe</h4>
        <p>
        window.name通过在iframe（一般动态创建i）中加载跨域HTML文件来起作用。然后，HTML文件<br>
                      将传递给请求者的字符串内容赋值给window.name。然后，请求者可以检索window.name值作为响应。
        <ol>
           <li>iframe 标签的跨域能力;</li>
           <li>window.name属性值在文档刷新后依旧存在的能力(且最大允许2M左右)</li>
        </ol>
        </p> 
       <p>
                           每个iframe都有包裹它的window，而这个window是top window的子窗口。contentWindow属性<br>
                          返回&lt;iframe&gt;元素的Window对象。你可以使用这个Window对象来访问iframe的文档及其内部DOM。      
          <pre>
          
&lt;!-- 
 下述用端口 
 10000表示：domainA
 10001表示：domainB
--&gt;
 
&lt;!-- localhost:10000 --&gt;
&lt;script>
  var iframe = document.createElement('iframe');
  iframe.style.display = 'none'; // 隐藏
 
  var state = 0; // 防止页面无限刷新
  iframe.onload = function() {
      if(state === 1) {
          console.log(JSON.parse(iframe.contentWindow.name));
          // 清除创建的iframe
          iframe.contentWindow.document.write('');
          iframe.contentWindow.close();
          document.body.removeChild(iframe);
      } else if(state === 0) {
          state = 1;
          // 加载完成，指向当前域，防止错误(proxy.html为空白页面)
          // Blocked a frame with origin "http://localhost:10000" from accessing a cross-origin frame.
          iframe.contentWindow.location = 'http://localhost:10000/proxy.html';
      }
  };
 
  iframe.src = 'http://localhost:10001';
  document.body.appendChild(iframe);
&lt;/script>
 
&lt;!-- localhost:10001 --&gt;
&lt;!DOCTYPE html&gt;
...
&lt;script&gt;
  window.name = JSON.stringify({a: 1, b: 2});
&lt;/script&gt;
&lt;/html&gt;
          </pre>
          没看懂!!!<br>                              
       </p>
       <h4>方式五：window.postMessage()</h4>
       <h4>方式六：修改document.domain跨子域</h4>
       <h4>方式七：WebSocket</h4>
       <h4>方式八：代理</h4>
   </div>
  <div>
      <h3>87.说一下 JSONP 实现原理？</h3>
      <p>
      jsonp即 json+padding，动态创建script标签，利用script标签的src属性可以获取任何域下的js脚<br>
                 本，通过这个特性(也可以说漏洞)，服务器端不在返货json格式，而是返回一段调用某个函数的js代<br>
                 码，在src中进行了调用，这样实现了跨域。           
      </p>
  </div> 
  <div>
      <h2>九.设计模式</h2>
     <h3>88.说一下你熟悉的设计模式?</h3>
     <p>
               参考:
     <a href="http://mp.weixin.qq.com/s?__biz=MzIwMTY0NDU3Nw==&amp;mid=2651938221&amp;idx=1&amp;sn=9cb29d1eb0fdbdb5f976306b08d5bdcc&amp;chksm=8d0f32e3ba78bbf547c6039038682706a2eaf83002158c58060d5eb57bdd83eb966a1e223ef6&amp;scene=21#wechat_redirect" rel="nofollow">常用的设计模式汇总，超详细！</a>
     </p> 
  </div> 
  <div>
      <h3>89.简单工厂和抽象工厂有什么区别?</h3>
      <h4>简单工厂模式:</h4>
  这个模式本身很简单而且使用在业务较简单的情况下.一般用于小项目或者具体产品很少扩展的情况(这样工厂类才不用经常更改).<br>
  它由3种角色组成:<br>
     <ol>
     <li>工厂类角色:这是本模式的核心,含有一定的商业逻辑和判断逻辑,根基逻辑不同,产生具体的工厂产品,如例子中的Driver类.</li>
     <li>抽象产品角色:它一般是具体产品继承的父类或者实现的接口.由接口或者抽象类拉实现.如例中的Car接口</li>
     <li>具体产品角色:工厂类所创建的对象就是此角色的实例.在Java中由一个具体类实现,如例子中的Benz,Bmw类.</li>
     
     </ol>
            抽象工厂模式:<br>
      <p>
         可以这么说,它和工厂方法模式的区别就在于需要常见对象的复杂程度上.而且抽象工厂模式是三个里面最为抽象的,最具一般性的.<br>
         抽象工厂模式的用意为:给客户端提供一个接口,可以创建多个产品族中的产品对象.<br>
         而且使用抽象工厂模式还要满足一下条件:
   <ol>
      <li>系统中有多个产品族,而系统一次只可能消费其中一族产品</li>
      <li>同属于同一个产品族的产品以其使用.</li>
   </ol>
   来看看抽象工厂模式的各个角色(和工厂方法的如出一辙):
   <ol>
       <li>抽象工厂角色:这是工厂方法模式的核心,它与应用程序无关.是具体工厂角色必须实现的接口或者必须继承的父类.<br>
                    在java中它由具体的类来实现.</li>
       <li>具体工厂角色:它含有和具体业务逻辑有关的代码.由应用程序调用以创建对应的具体产品的对象.在java中它由具体的类来实现.</li>
       <li>抽象产品角色:它是具体产品继承的父类或者是实现的接口.在java中一般由抽象类或者接口来实现.</li>
       <li>具体产品角色:具体工厂角色锁创建的对象就是此角色的实例.在java中由具体的类来实现.</li>
   </ol>
      </p>        

  </div>
  
  <div>
      <h2>十.Spring/Spring MVC</h2>  
      <h3>90.为什么要使用spring?</h3>
      <h4>1简介</h4>
      <ol>
         <li>目的:解决企业应用开发的复杂性</li>
         <li>功能:使用基本的JavaBean代替EJB,并提供了更多的企业应用功能</li>
         <li>范围:任何java应用</li>
      </ol>
              简单来说,Spring是一个轻量级的控制反转(IOC)和面向切面的(AOP)的容器框架.
     <h4>2.轻量</h4>
      <p>从大小与开销两方面而言Spring都是轻量的.完整的Spring框架可以在一个大小只有1MB多的JAR文件里发布.<br>
                         并且Spring所需的处理开销也是微不足道的.此外,Spring是非侵入式的:典型地,Spring应用中的对象不依赖<br>
                         于SPring的特定类.</p>
     <h4>3.控制反转</h4>
     <p>
       Spring通过一种称作控制反转(IOC)的技术促进了松耦合.当应用了IOC,一个对象依赖的其它对象<br>
                   会通过被动的方式传递进来,而不是这个对象自己创建或者查找依赖对象.你可以认为IOC与JNDI相反--<br>
                   不是对象从容器中查找依赖,而是容器在对象初始化时不等对象请求就主动将依赖传递给它.
     </p>
     <h4>4.面向切面</h4>
     <p>
       Spring提供了面向切面编程的丰富支持,允许通过分离应用的业务逻辑与系统服务(例如审计(auditing)和事务<br>
       (transaction)管理)进行内聚性的开发.应用对象只实现它们应该做的--完成业务逻辑--仅此而已.它们并不<br>
                   负责(甚至是意识)其它的系统级关注点,例如日志或事务支持.
     </p>
     <h4>5.容器</h4>
       <p> Spring包含并管理应用对象的配置和生命周期,在这个意义上它是一种容器,你可以配置你的每个bean如何被创建--基于<br>
                        一个可配置原型(prototype),你的bean可以创建一个单独的实例或者每次需要时都生成一个新的实例--以及它们是如<br>
                      何相互关联的.然而,Spring不应该被混同于传统的重量级的EJB容器,它们经常是庞大与笨重的,难以使用.
       </p>
     <h4>6框架</h4>
     <p>
        Spring可见将简单的组件配置,组合成为复杂的应用.在Spring中,应用对象被声明式地组合,典型地是在一个XML文件里.<br>
        Spring也提供了很多基础功能(事务管理,持久化框架集成等等),将应用逻辑的开发留给了你.<br>
                     所有Spring的这些特征使你能够编写更干净,更可管理,并且更易于测试的代码.它们也为Spring中的各种模块提供了基础支持.
     </p>  
  </div>
  <div>
      <h4>91.解释一下什么是aop?</h4>
      <p>
         AOP(Aspect-Orienred Programming,面向方面编程),可以说是OOP(Object-Oriented Programing,<br>
                        面向对象编程)的补充和完善.OOP引入封装,继承和多态性等概念来建立一种对象层次结构,用以模拟公共行为的一个集合.<br>
                        当我们需要为分散的对象引入公共行为的时候,oop则显得无能为力.也就是说OOP允许你定义从上到下的关系,但并不适合定义<br>
                        从左到右的关系.例如日志功能.日志代码往往水平地地散布在所有对象层次中,而与它所散步到的对象的核心功能毫无关系.<br>
                        对于其他类型的代码,如安全性,异常处理和透明的持续性也是如此.这种散布在各处的无关的代码被称为横切(cross-cutting)代码,
                        在OOP设计中,它导致了大量代码的重复,而不利于各个模块的重用.<br>
      </p> 
      <p>
                       而AOP技术则恰恰相仿,它利用一种称为"横切"的技术,剖解开封装的对象内部,并将那些影响了多个类的公共行为封装到一个可重用<br>
                      模块,并将其名为"Aspect",即方面.所谓"方面",简单地说,就是将那些与业务无关,却为业务模块所共同调用的逻辑或责任封装<br>
                      起来,便于减少系统的重复代码.减低模块间的耦合度,并有利于未来的可操作性和可维护性.AOP代表的是一个横向的关系,如果说<br>
        "对象"是一个空心的圆柱体,其中封装的是对象的属性和行为;那么面向方面变成编程的方法,就仿佛一把利刃,将这些空心的圆柱<br>
                      体剖开,以获得其内部的消息.而剖开的切面,就是所谓的"方面了",然后它又以巧夺天功的妙手将这些剖开的切面复原,不留痕迹.<br>           
      </p>
      <p>
                          使用"横切"技术,AOP把软件系统分为两个部分:核心关注点和横切关注点.业务处理的主要流程是核心关注点,与之关系不大的<br>
                          部分是横切关注点.横切关注点的一个特点是,他们经常发生在核心关注点的多处,而各处都基本相似.比如权限认证,日志,事务处理.<br>
         AOP的作用在于分离系统找那个的各种关注点,将核心关注点和横切关注点分离开来.正如Avanade公司的高级方案架构师AdamMagee<br>
                        所说,AOP的核心思想就是"将应用程序中的商业逻辑同对其提供支持的通用服务进行分离."
      </p>
  </div>
  <div>
      <h3>9.2解释一下什么是ioc?</h3>
     <p>
        IOC是Inversion of Control的缩写,多数书籍翻译成"控制反转".<br>
                      简单来说就是把复杂系统分解成相互合作的对象，这些对象类通过封装以后，内部实现对外部是透明的，从而降低了解决问题的复杂度，<br>
                      而且可以灵活地被重用和扩展。<br>
     </p>          
  </div>
  <div>
      <h3>94.Spring常用的注入方式有哪些?</h3>
      Spring通过DI(依赖注入)实现IOC(控制反转),常用的注入方式主要有三种:
      <ol>
         <li>构造方法注入</li>
         <li>setter注入</li>
         <li>基于注解的注入<li>
      </ol>
  </div>
  <div>
      <h3>95.Spring中的bean是线程安全的吗?</h3>
      <p>
         Spring容器中的Bean是否线程安全.容器本身没有提供Bean的线程安全策略.因此可以说spring<br>
                        容器中的bean 本身不具备线程安全的特性,但是具体还是要结合具体的scope的bean去研究.
      </p>
  </div>
  <div>
      <h3>96.spring支持几种bean的作用域?</h3>
      <p>
                         当通过spring容器创建一个Bean实例时,不仅可以完成Bean实例的实例化,还可以为Bean指定特定的作用域.<br>
         Spring支持如下5种作用域;
         <ol>
            <li>singleton:单例模式.在整个SpringIOC容器中,使用Singleton定义的Bean将只有一个实例 </li>
            <li>prototype:原型模式,每次通过容器的getBean方法获取prototype定义的Bean时,都将产生一个新的Bean实例</li>
            <li>request:对于每次HTTP请求,使用request定义的Bean都将产生一个新实例,即每次HTTP请求将会<br>
                                            产生不同的Bean实例.只有在Web应用中使用Sping时,该作用域才有效.</li>
            <li>session:对于每次HTTP Session,使用session定义的Bean都将产生一个新实例.同样只有在Web<br>
                                            应用中使用Spring时,该作用域才有效</li>
            <li>globalsession:每个全局的HTTP Session,使用Session定义的Bean将产生一个新实例.典型情况下,仅在<br>
                                           使用portlet context的时候有效.同样只有在Web应用中使用Spring时,该作用域才有效.</li>
         </ol>
      </p>
      <p>
                       其中计较常用的是singleton和prototype两种作用域.对于singleton作用域的Bean,每次请求该Bean都将获得相同的实例.<br>
                       容器负责跟踪Bean实例的状态,负责维护Bean实例的声命周期行为 ;如果一个Bean被设置成prototype作用域,程序每次请求该id的<br>
        Bean,Spring都会新建一个Bean实例,然后返回给程序.这种情况下,Spring容器仅仅使用new关键字创建Bean实例,一旦创建成功,<br>
                      容器不在跟踪实例,也不会维护Bean实例的状态.<br>
                     如果不指定Bean的作用域,Spring默认使用singleton作用域.Java在创建Java实例时,需要进行内存申请;销毁实例时,需要完成垃圾回收,<br>
                     这些工作都会导致系统开销增加.因此,prototype作用域Bean的创建,销毁代价比较大.而singleton作用域的Bean实例一旦创建成功,可以<br>
                     重复使用.因此,除非必要,否则尽量避免将Bean被设置成prototype作用域.         
      </p>
  </div>
  <div>
     <h3>97.Spring 自动装配Bean有哪些方式?</h3>
      <p> Spring容器负责创建应用程序中的Bean同时通过ID来协调这些对象之间的关系.作为开发人员,我们需要告诉<br>
      Spring要创建哪些bean并且如何将其装配到一起.<br>
      spring中bean装配有两种方式:<br>
      <ol>
          <li>隐式的bean发现机制和自动装配</li>
          <li>在java代码或者XML中进行显示配置</li>
      
      </ol>
      </p>
  </div>
    
  <div>
  <h3>98.事务实现方式有哪些?</h3>
     <ol>
        <li>编程式事务管理对于基于POJO的应用来说是唯一选择,我们需要在代码中调用beginTransaction(),commit(),<br>
        rollback()等事务部管理相关的方法,这就是编程式事务管理</li>
        <li>基于TransactionProxyFactoryBean的声明式事务管理</li>
        <li>基于@Transactional的声明式事务管理</li>
        <li>基于Aspectj AOP配置事务</li>
  
     </ol>
  </div>  
  <div>
      <h3>99.说一下spring的事务隔离?</h3>
      <p>事务隔离级别指的是一个事务对数据的修改与另一个并行的事务的隔离程度,当多个事务同时访问相同数据时,<br>
      如果没有采取必要的隔离机制,就可能发生一下问题:</p>
      <ol>
         <li>脏读:一个事务读到另一个事务未提交的更新数据.</li>
         <li>幻读:例如第一个事务对一个表中的数据进行了修改,比如这种修改涉及到表中的"全部数据行".<br>
                         同时,第二个事务也修改这个表中的数据,这种修改是向表中插入"一行新数据".那么,以后就会发生操作<br>
                         第一个事务的用户发现表中还存在没有修改的数据行,就好像发生了幻觉一样.</li>
         <li>不可重复读:比方说在同一个事务中先后执行两条一模一样的select语句,期间在此次事务中没有执行<br>
                          过任何DDL语句,但先后得到的结果不一致,这就是不可重复读.</li>               
      </ol>
  </div>
  <div>
      <h3>100.说一下Spring mvc 运行流程?</h3>
      <ol>
         <li>用户向服务器发送请求,请求被Spring前端控制Servelt Dispatchervlet 捕获;</li>
         <li>DispatcherServlet对请求URL进行解析,得到请求资源标识符(URI).然后根据该URI,调用<br>
         HandlerMapping获得该Handler配置的所有相关对象(包括Handler对象以及handler对象对应<br>
                         的拦截器),最后以HandlerExecutionChain对象的形式返回;</li> 
         <li> DispatcherServlet 根据获得的Handler，选择一个合适的HandlerAdapter；（附注：<br>
                          果成功获得HandlerAdapter后，此时将开始执行拦截器的preHandler(...)方法） </li>
         <li>提取Request中的模型数据，填充Handler入参，开始执行Handler（Controller)。 在填充Handler的入参过程中<br>
                         根据你的配置，Spring将帮你做一些额外的工作：
               <ol>
                   <li>HttpMessageConveter:将请求信息(如Json,xml等数据)转换成一个对象,将对象转换为指定的响应信息</li>
                   <li>数据转换:对请求消息进行数据转换.如String转换成Integer,Double等</li>
                   <li>数据根式化:对请求消息进行数据格式化.如将字符串转换成格式化数字或格式化日期等</li>
                   <li>数据验证:验证数据的有效性(长度,格式等),验证结果存储到BindingResult或Error中</li>
               </ol>
                         
        </li>
        <li>Handler执行完成后,向DisPatcherServlet返回一个ModelAndView对象;</li>
        <li>根据返回的ModelAndView,选择一个合适的ViewResolver(必须是已经注册到Spring容器中的ViewResolver)返回给DispatcherServlet</li>
        <li>ViewResolver结合Model和view,来渲染视图;</li>
        <li>将渲染结果返回给客户端.</li>      
      </ol>
  </div>  
  <div>
      <h3>101.Spring mvc有哪些组件?</h3>
      Spring MVC的核心组件:
      <ol>
          <li>DispatcherServlet:中央控制器,把请求给转发到具体的控制类</li>
          <li>Controller:具体处理请求的控制器</li>
          <li>HandlerMapping:映射处理器,负责映射中央处理器转发给controller时的映射策略</li>
          <li>ModelAndView:服务层返回的数据和视图层的封装类</li>
          <li>viewResolver:视图解析器,解析具体的视图</li>
          <li>Interceptors:拦截器,负责拦截我们定义的请求然后做处理工作</li>
      </ol>
  </div>  
  <div>
       <h3>102.@RequestMapping的作用是什么?</h3>
     <p>RequestMapping是一个用来处理请求地址映射的注解,可用于类或方法上.用于类上,表示类中的所有响应<br>
     请求的方法都是以该地址作为父路径.<br>
     RequestMapping注解有六个属性,小面我们把她分成三类进行说明.<br>
     value,method:<br>
     <ol>
     <li>value:指定请求的实际地址,指定的地址可以是URI Template模式</li>
     <li>method:指定请求的method类型,GET,POST,PUT,DELETE等</li>
     </ol>
     consumes,produces<br>
     <ol>
        <li>consumes:指定处理请求的提交内容类型(Content-Type),例如application/json,text/html</li>
        <li>produces:指定返回的内容类型,仅当request请求头中的(Accept)类型中包含该指定类型才返回;</li>
     </ol>  
     params,herders<br>
     <ol>
        <li>params:指定request中必须包含某些参数值时,才让该方法处理.</li>
        <li>headers:指定request中必须包含某些指定的header值,才能让该方法处理请求.</li>
     </ol>
     
     
     
     
     </p>
     
  
  
  
  </div>  
  
   
   
</div>
			
</body>
<script type="text/javascript">
</script>



</html>
