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
	
	
	</style>
	
	
	
</head>
<body>
<div class="header">
   <div style="margin-left: 36px;margin-right: 36px;padding:12px;">
    
   
    <div>
    https://blog.csdn.net/qq_41701956/article/details/103253168
        <h3>一.java基础</h3>
        <h3>1.JDK和JRE有什么区别?</h3>
       <p>
         <ol>
           <li>JDK:Java Development Kit 的简称,java开发工具包,提供了Java额开发环境和运行环境.</li>
           <li>JRE:Java Runtime Environment的简称,java运行环境,为java的运行提供了所需环境</li>                   
         </ol>
                               具体来说 JDK 其实包含了 JRE，同时还包含了编译 java 源码的编译器 javac，还包含了很多 java 程<br>
                               序调试和分析的工具。简单来说：如果你需要运行 java 程序，只需安装 JRE 就可以了，如果你需要<br>
                               编写 java 程序，需要安装 JDK。
       </p>   
   </div>
   
    <div>
        <h3>2.==和equals的区别是什么?</h3>
       <p>
         <h4>对于基本类型和引用类型 == 的作用效果是不同的,如下:</h4>
         <ol>
           <li>基本类型:比较的是值是否相同;</li>
           <li>引用类型:比较的是引用的是否相同;</li>                          
         </ol>
                         代码示例<br>
         <pre>
         String x = "string";
         String y = "string";
         String z = new String("string");
         System.out.println(x==y); // true
         System.out.println(x==z); // false
         System.out.println(x.equals(y)); // true
         System.out.println(x.equals(z)); // true
         </pre>
                           代码解读：因为 x 和 y 指向的是同一个引用，所以 == 也是 true，而 new String()方法则重写开辟<br>
                           了内存空间，所以 == 结果为 false，而 equals 比较的一直是值，所以结果都为 true。<br>
         <h2>equals 解读</h2>
         equals本质上就是==,只不过String和Integer等重写了equals方法,把它变成了值比较.<br>
                        首先来看默认情况下 equals 比较一个有相同值的对象，代码如下：<br>
         <pre>           
          class Cat {
              public Cat(String name) {
                  this.name = name;
              } 
              private String name;
 
              public String getName() {
                  return name;
              }
 
              public void setName(String name) {
                   this.name = name;
              }
          }
 
          Cat c1 = new Cat("王磊");
          Cat c2 = new Cat("王磊");
          System.out.println(c1.equals(c2)); // false
         </pre> 
         输出结果出乎我们的意料，竟然是 false？这是怎么回事，看了 equals 源码就知道了，源码如下：<br>
         <pre>         
             public boolean equals(Object obj) {
                  return (this == obj);
             }
         </pre> 
                          原来 equals 本质上就是 ==。<br>
                          那问题来了，两个相同值的 String 对象，为什么返回的是 true？代码如下：<br>
         <pre>
         String s1 = new String("老王");
         String s2 = new String("老王");
         System.out.println(s1.equals(s2)); // true
         </pre>
                         同样的，当我们进入 String 的 equals 方法，找到了答案，原来是String重写了<br>
         Object的equals方法,把引用比较该成了值比较.<br>
         <b>总结</b>: == 对于基本类型来说是值比较,对于引用类型来说比较的是引用;而equals默认情况下<br>
                         是引用比较,只是很多类重写了equals方法 ,比如String,Integer等吧它变成了值比较,所以一般<br>
                        情况下equals比较的是值是否相等.                              
                    
       </p>   
   </div>
   <div>
       <h3>3.两个对象的hashCode()相同,则equals()也一定为true,对吗?</h3>
       <p>
            不对 ,两个对象的hashCode()相同,equals()不一定true.<br>
           代码示例:<br>
       <pre>
         String str1 = "通话";
         String str2 = "重地";
         System.out.println(String.format("str1：%d | str2：%d",  str1.hashCode(),str2.hashCode()));
         System.out.println(str1.equals(str2));   
       </pre>
                 执行结果<br>
        <pre>
        str1：1179395 | str2：1179395

        false
        </pre>
                       代码解读:很显然"通话"和"重地"的hashCode()相同,然而equals()则为false,因为在散列<br>
                       表中,hashCode()相等即两个键值对的哈希值相等,然而哈希值相等,比一定能得出键值对相等.                         
   </p>
   </div>
   
   <div>
   <h3>4.final在java中有什么作用?</h3>
       <ol>
           <li>final 修饰的类叫最终类,该类不能被继承.</li>
           <li>final 修士的方法不能被重写</li>
           <li>final 修饰的变量叫常量,常量必须初始化,初始化之后值就不能被修改</li>
       </ol>
   </div>
   
   <div>
   <h3>5.java中的Math.round(-1.5)等于多少</h3>
      <p>等于-1,因为在数轴上取值时,中间之(0.5)向右取整,所以正0.5是往上取整,负0.5是直接舍弃.</p>
   </div>

   <div>
   <h3>6.String属于基础的数据类型吗?</h3>
      <p>String 不属于基础数据类型,基础类型有8种:byte,boolean,char,short,int,float,long<br>
      double,而String属于对象.
      </p>
   </div>

   <div>
      <h3>7.java 中操作字符串都有哪些类?他们之间有什么区别?</h3>
      <p>
                     操作字符串的类有 :String,StringBuffer,StringBuilder.<br>
        String 和 StringBuffer,StringBuilder的区别在于String声明的是不可变的对象,每次操作都会生<br>
                     成新的String 对象,然后将指针指向新的String对象,而StringBuffer,StringBuilder可以在原有<br>
                     对象的基础上进行操作,所以在京城改变字符串内容的情况下最好不要使用String.                           
        StringBuffer 和 StringBuilder 最大的区别在于，StringBuffer 是线程安全的，而 StringBuilder 是<br>
                     非线程安全的，但 StringBuilder 的性能却高于 StringBuffer，所以在单线程环境下推荐使用 <br>
        StringBuilder，多线程环境下推荐使用 StringBuffer。             
      </p>
   </div>
   
   <div>
      <h3>8.java String str="i"与String str = new String("i")一样吗?</h3>
      <p>
                         不一样,因为内存的分配方式不一样.String str = "i"的方式,java 虚拟机会将其分配到常量池中;<br>
                         而String str =  new String("i")则会被分配到堆内存中.         
      </p>
   </div>
   
   <div>
      <h3>9.如何将字符串反转?</h3>
      <p>
                        使用StringBuilder或者StringBuffer 的reverse()方法.<br>
         <pre>      
              // StringBuffer reverse
              StringBuffer stringBuffer = new StringBuffer();
              stringBuffer.append("abcdefg");
              System.out.println(stringBuffer.reverse()); // gfedcba
              // StringBuilder reverse
              StringBuilder stringBuilder = new StringBuilder();
              stringBuilder.append("abcdefg");
              System.out.println(stringBuilder.reverse()); // gfedcba
         </pre>                                                                               
      </p>
   </div>
   
   <div>
      <h3>10.String类的常用方法有哪些?</h3>
     <ol>
        <li>indexOf():返回指定字符的索引.</li>
        <li>charAt():返回指定索引出的字符.</li>
        <li>replace():字符串替换.</li>
        <li>trim():去除字符串两端空白.</li>
        <li>split():分割字符串,返回一个分割后的字符串数组.</li>
        <li>getBytes():返回字符串的byte类型数组</li>
        <li>length():返回字符串长度.</li>
        <li>toLowerCase():将字符串转成大小写字母.</li>
        <li>toUpperCase():将字符串转成大写字符串.</li>
        <li>substring():截取字符串.</li>
        <li>equals():字符串比较.</li>
     </ol>
   </div>
   
   <div>
      <h3>11.抽象类必须要有抽象方法吗?</h3>
      <p>
                    不需要,抽象类不一定非要有抽象方法.<br>
                   示例代码<br>
       <pre>
       abstract class Cat {
           public static void sayHi() {
               System.out.println("hi~");
           }
       }   
       </pre>            
                     上面代码,抽象类并没有抽象方法但完全可以正常运行.                        
      </p>
   </div>
   
   <div>
      <h3>12.普通类和抽象类有哪些区别?</h3>
      <ol>
         <li>普通类不能包含抽象方法,抽象类可以包含抽象方法.</li>
         <li>抽象类不能直接实例化,普通类可以直接实例化.</li>
      </ol>
   </div>
   
   <div>
      <h3>13.抽象类能使用final修饰吗?</h3>
      <p>
                      不能,定义抽象类就是让其他类继承的,如果定义为final该类就是不能被继承,这样彼此就会产生矛<br>
                     盾,所以 final 不能修饰抽象类.(编辑器也会提示错误信息)
      </p>
   </div>
   
   <div>
      <h3>14.接口和抽象类有什么区别</h3>
      <li>实现:抽象类的子类使用 etends类继承;接口必须使用 implements 来实现接口.</li>
      <li>构造函数:抽象类可以有构造函数;接口不能有.</li>
      <li>main方法:抽象类可以有main方法,并且我们能运行它;接口不能有main方法.</li>
      <li>实现数量:类可以实现很多接口;但是只能继承一个抽象类.</li>
      <li>访问修饰符:接口中的方法默认使用public修饰:抽象类中的方法可以是任意访问修饰符</li>
   </div>
   
   <div>
      <h3>15.java中IO流分为几种</h3>
      <ol>
         <li>按功能来分:输入流(input),输出流(output).</li>
         <li>按类型来分:字节流和字符流</li>
         <li>字节流和字符流的区别是:字节流按8位传输以字节为单位输入输出数据,字符流按16位传输以字符为单位输入输出数据.</li>
      </ol>
    
   </div>
   
   <div>
      <h3>16.BIO,NIO,AIO有什么区别</h3>
      <ol>
         <li>BIO:Bolck IO 同步阻塞式IO,就是我们平常使用的传统IO,它的特点是模式简单使用方便,并发处理能力低</li>
         <li>NIO:New IO 同步非阻塞IO,是传统IO的升级,客户端和服务器端通过Channel(通道)通讯,实现了多路复用.</li>
         <li>AIO:Asynchronous IO是NIO的升级,也叫NIO2,实现了异步非阻塞IO,异步IO的操作基于事件个回调机制.</li>
      </ol> 
   </div>
   
   <div>
      <h3>17.Files的常用方法都有哪些?</h3>
      <ol>
         <li>Files.exists():检测文件路径是否存在</li>
         <li>Files.createFile():创建文件.</li>
         <li>Files.createDirectory:创建文件夹.</li>
         <li>Files.delete():删除一个文件或目录.</li>
         <li>Files.copy():复制文件.</li>
         <li>Files.move():移动文件.</li>
         <li>Files.size():查看文件个数.</li>
         <li>Files.read():读取文件.</li>
         <li>Files.write():写入文件.</li>
      </ol>
    
   </div>
   <div>
   <h3>18.java容器都有哪些?</h3>
   <p>
             常用容器的图录.<br>
     <img alt="常用容器" src="${ctxStatic}/images/resultImage/cyrqtl.jpg"><br>       
   </p>
   </div>   
   <h3>19.Collection 和Collections 有什么区别?</h3>
   <p>
      java.util.Collection是一个集合接口(集合类的一个顶级接口).它提供了对集合对象进行基本<br>
      操作的通用接口方法.Collection接口在Java类库中有很多具体的实现.Collection接口的意义<br>
      是为各种具体的集合提供了最大化的统一操作方式,其直接继承接口有List与Set.     
   </p>]
   <p>
      Collections则是集合类的一个工具类/帮助类,其中提供了一系列静态方法,用于对集合中元素<br>
      进行排序,搜索以及线程安全等各种操作. 
   </p>
   </div> 
     
   <div>
      <h3>20.List,Set,Map之间的区别是什么?</h3>
      <pre>
                     比较            List                                   set                                 Map
                  继承接口        Collection                             Collection
                 常见实现类     AbstractList(其常用子类有ArrayList         AbstractSet(其常用子类有HashSet        HashMap,HashTable                                         
                                      LinkedList,Vector)                   LikedHashSet,TreeSet)
                      元素            可重复                                不可重复(用equals()判断)                不可重复        
                      顺序             有序                                 无序(实际上由HashCode决定)
                 线程安全         Vector线程安全                                                                  HashTable线程安全
      </pre>
   </div>
     
   <div>
      <h3>21.HashMap和Hashtable有什么区别?</h3>
     <ol>
        <li>hashMap去掉了HashTable的contains方法,但是加上了containsValue()和containsKey()方法</li>
        <li>hashTbale同步的,而HashMap 是非同步的,效率上比hashTabe要高;</li>
        <li>hashMap允许空键值,而hashTable不允许.</li>
     </ol>
   </div>
     
   <div>
      <h3>22.如何决定使用HashMap还是TreeMap?</h3>
      <p>
                       对于在Map中插入,删除和定位元素这类操作,HashMap是最好的选择.然而,假如你需要对一个<br>
                       有序的key集合进行遍历,TreeMap是更好的选择.基于你的collection的大小,也许向HashMap中<br>
                       添加元素会更快,将map换为TreeMap进行有序Key的遍历.
      </p>
   </div>
   
   <div>
       <h3>23.说一下 HashMap的实现原理?</h3>
       <p>HashMap概述:HashMap是基于哈希表的Map接口的非同步实现.此实现提供所有可选的映射操<br>
                    作,并允许使用null值和null键.此类不保证映射的顺序,特别是它不保证该顺序恒久不变.<br>
       </p>
       <p>
          HashMap的数据结构:在Java编程语言中,最基本的结构就是两种,一个数数组,另外一个是模拟<br>
                    指针(引用),所有的数据结构都可以用这两个基本结构来构造的,HashMap也不例外.HashMap,<br>
                    实际上是一个"链表散列"的数据结构,即数组和链表的结合体.
       <p>
       <p>
                        当我们往Hashmap中put元素时,首先根据key的hashcode重新计算hash值,根绝hash值得到这个元素<br>
                       在数组中的位置(下标),如果该数组在该位置上已经存放了其他元素,那么在这个位置上的元素将以链表<br>
                       的形式存放,新加入的放在链头,最先加入的放入链尾.如果数组中该位置没有元素,就直接将该元素放到<br>
                       数组的该位置上。               
       </p>
       <p>
                          需要注意JDK1.8中对HashMap的实现做了优化,当链表中的节点数据超过八个之后,该链表会转为红黑<br>
                          树来提高查询效率,从原来的O(n)到O(logn)
       </p>
   </div>
   
   <div>
       <h3>24.说一下 HashSet的实现原理?</h3>
       <ol>
          <li>HashSet底层由HashMap实现</li>
          <li>HashSet的值存放在HashMap的key上</li>
          <li>HashMap的value统一为PRESENT</li>
       </ol>
   </div>
   
   <div>
       <h3>25.ArrayList和LinkedList的区别是什么?</h3>
       <p>
          最明显的区别是ArrayList底层的数据结构是数组,支持随机访问,而LikedList的底层数据结构是<br>
          双向循环链表,不支持随机访问.使用下标访问一个元素,ArrayList的时间复杂度还O(1),而LinkedList是O(n).
       </p>
   </div>
   
   <div>
       <h3>26.如何实现数组和List之间的转换?</h3>
       <ol>
          <li>List转换成为数组:调用ArrayList的toArray方法.</li>
          <li>数组转换成为List:调用Arrays的asList方法.</li>
       </ol>
   </div>
   
   <div>
       <h3>27.ArrayList和Vector的区别是什么?</h3>
       <ol>
          <li>Vector是同步的,而ArrayList不是.然而,如果你寻求在迭代的时候对列表进行改变,你应该使<br>
                                       用copyOnWriteArrayList.</li>
          <li>ArrayList比Vector快,它因为有同步,不会过载.</li>
          <li>ArrayList更加通用,因为我们可以使用Collections工具类轻易地获取同步列表和只读列表.</li>
       </ol>
   </div>
   
   <div>
       <h3>28.Array和ArrayList有何区别?</h3>
       <ol>
          <li>Array可以容纳基本类型和对象,而ArrayList只能容纳对象.</li>
          <li>Array是指定长度的,而ArrayList的长度既可以指定也可以不指定,是变长的.</li>
          <li>Array没有提供ArrayList那么多功能,比如addAll,removerAll和iterator等.</li>
       </ol>
   </div>
   
   <div>
       <h3>29.在Queue中poll()和remove()有什么区别?</h3>
       <p>
         poll()和remove()都是从队列中取出一个元素,但是poll()在获取元素失败的时候会返回空,但是<br>
         remove()失败的时候会抛出异常.
       </p>
   </div>

   <div>
       <h3>30.哪些集合类是线程安全的?</h3>
       <ol>
          <li>vector:就比arraylist多了个同步化机制(线程安全),因为效率较低,现在已经不太建议使用.<br>
                                     在web应用中,特别是前台页面,往往效率(页面响应速度)是优先考虑的.</li>
          <li>statck:堆栈类,先进后出.</li>
          <li>hashtable:就比hashmap多了个线程安全.</li>
          <li>enumeration:枚举,相当于迭代器.</li>
       </ol>
   </div>

   <div>
       <h3>31.迭代器Iterator是什么?</h3>
       <p>
                          迭代器是一种设计模式,它是一个对象,它可以遍历并选择序列中的对象.而开发人员不需要了解该<br>
                         序列的底层结构.迭代器通常被称为"轻量级"对象,因为创建它的代价小.                 
       </p>
   </div>

   <div>
       <h3>32.Iterator怎么使用?有什么特点?</h3>
       <p>
          Java中的Iterator功能比较简单,并且只能单向移动:<br>
          <ol>
             <li>使用方法iterator()要求容器返回一个Iterator.第一次调用Iterator的next()方法是,它返回序列<br>
                                              的第一个元素。注意：iterator()方法是java.lang.Iterable接口,被Collection继承。</li>
             <li>使用next()获得序列中的下一元素.</li>
             <li>使用hasNext()检查序列中是否还有元素.</li>
             <li>使用remove()将迭代器新返回的元素删除.</li>
          </ol>
           Iterator是Java迭代器最简单的实现,为List设计的ListIterator具有更多的功能,它可以从两个方向遍<br>
                                   历List,也可以从List中插入和删除元素.     
       </p>
   </div>
   <div>
       <h3>Iterator和ListIterator有什么区别?</h3>
       <ol>
          <li>Iterator可用来遍历Set和List集合,但是ListIterator只能用来遍历list.</li>
          <li>Iterator对集合只能是前向遍历,ListIterator既可以前向也可以后向.</li>
          <li>ListIterator实现了Iterator接口,并包含其他的功能,比如:增加元素,替换元素,获取前一个<br>
                                      和后一个元素的索引,等等.</li>
       </ol>
   </div> 
   <div>
        <h3>三.多线程</h3>
        <h3>35.并行和并发有什么区别?</h3>
        <ol>
           <li>并行是指两个或者多个事件在同一时刻发生;而并发是指两个或多个事件在同一时间间隔发生.</li>
           <li>并行是在不同实体上的多个事件,并发是在同一实体上的多个事件.</li>
           <li>并行:在多台处理器上同时处理多个任务(如hadoop分布式集群).并发:在同一台处理器上"同时"处理多个任务.</li>
        </ol>
                       所以并发编程的目标是充分的利用处理器的每一个核,以达到最高的处理性能.
   </div>
   <div>
       <h3>36.线程和进程的区别?</h3>
       <p>简而言之,进程是程序运行和资源分配的基本单位,一个程序至少有一个进程,一个进程至少有一个<br>
                       线程.进程在执行过程中拥有独立的内存单元,而多个线程共享内存资源,减少切换次数,从而效率<br>
                       更高.线程是进程的一个实体,是cpu调度和分派的基本单位,是比程序更小的能独立运行的基本单<br>
                       位.同一进程中的多个线程之间可以并发执行.</p>
   </div>
   <div>
   <h3>37.守护线程是什么?</h3>
               守护线程(即daemon thread),是个服务线程,准确地来说就是服务其他的线程.
   </div> 
   
   <div>
   <h3>38.创建线程有哪几种方式?</h3>
      <ol>
         <li>继承Thread类创建线程类
             <ul>
                <li>定义Thread类的子类，并重写该类的run方法，该run方法的方法体就代表了线程要完成的任<br>
                                                       务。因此把run()方法称为执行体。</li>
                <li>创建Thread子类的实例,即创建了线程对象.</li>
                <li>调用线程对象的start()方法来启动该线程</li>             
             </ul>
         </li>
         <li>通过Runnable接口创建线程类
            <ul>
               <li>定义runnable接口的实现类，并重写该接口的run()方法，该run()方法的方法体同样是该线程的线程执行体。</li>
               <li>创建 Runnable实现类的实例，并依此实例作为Thread的target来创建Thread对象，该Thread对象才是真正的线程对象。</li>
               <li>调用线程对象的start()方法来启动该线程。</li>   
            </ul>
         
         </li>
         <li>通过Callable和Future创建线程
            <ul>
               <li>创建Callable接口的实现类，并实现call()方法，该call()方法将作为线程执行体，并且有返回值。</li>
               <li>创建Callable实现类的实例，使用FutureTask类来包装Callable对象，该FutureTask对象封装了<br>
                                                    该Callable对象的call()方法的返回值。</li>
               <li>使用FutureTask对象作为Thread对象的target创建并启动新线程。</li>
               <li>调用FutureTask对象的get()方法来获得子线程执行结束后的返回值。</li>
            </ul>
         </li>
      </ol>     
   </div> 
   
   <div>
       <h3>39.说一下Runnable和callable有什么区别? </h3>
       <ol>
          <li>Runnable接口中的run()方法的返回值是void,它做的事情只是纯粹地去执行run()方法中的代码而已;</li>
          <li>Callable接口中的call()方法是有返回值的,是一个泛型,和Futture,FutureTask配合可以用来获<br>
                                       取异步执行的结果.</li>
       </ol>
   </div>
   <div>
       <h3>40.线程有哪些状态</h3>
       <p>线程通常都有五中状态,创建,就绪,运行,阻塞和死亡.</p>
       <ul>
          <li>创建状态.在生成线程对象，并没有调用该对象的start方法，这是线程处于创建状态</li>
          <li>就绪状态.当调用了线程对象的start方法之后，该线程就进入了就绪状态，但是此时线程调度程<br>
                                     序还没有把该线程设置为当前线程，此时处于就绪状态。在线程运行之后，从等待或者睡眠中回<br>
                                     来之后，也会处于就绪状态。</li>
          <li>运行状态。线程调度程序将处于就绪状态的线程设置为当前线程，此时线程就进入了运行状态，<br>
                                      开始运行run函数当中的代码。</li>
          <li>阻塞状态。线程正在运行的时候，被暂停，通常是为了等待某个时间的发生(比如说某项资源就<br>
                                      绪)之后再继续运行。sleep,suspend，wait等方法都可以导致线程阻塞。</li>
          <li>死亡状态.如果一个线程的run方法执行结束或者调用stop方法后，该线程就会死亡。对于已经<br>
                                      死亡的线程，无法再使用start方法令其进入就绪</li>
       </ul>
   </div>
    <div>
        <h3>41.sleep()和wait()有什么区别?</h3>
        <ol>
           <li>sleep:方法是线程(Thread)的静态方法,让调用线程进入睡眠状态,让出执行机会给其他线<br>
                                         程,等到休眠时间结束后,线程进入就绪状态和其他线程一起竞争cpu的执行时间.因为sleep()是<br>
               static静态的方法,他不能改变对象的机锁,当一个synchronized块中调用了sleep()方法,线程虽然<br>
                                         进入休眠,但是对象的机锁没有被释放,其他线程依然无法访问这个对象. </li>
           <li>wait():wait()是Object类的方法,当一个线程执行到wait方法时,它就进入到一个和该对象相关的等<br>
                                          待池,同时释放对象的机锁,使得其他线程能够访问,可以通过notify,notifyAll方法来唤醒等待的线程.</li>
        </ol>
   </div>
   
   <div>
       <h3>42.notify()和 notifyAll()有什么区别?</h3>
       <ol>
          <li>如果线程调用了对象的wait()方法,那么鲜吃呢个便会处于该对象的等待池中,等待池中的线程不会<br>
                                      去竞争该对象的锁.</li>   
          <li>
                                    当有线程调用了对象的 notifyAll()方法（唤醒所有 wait 线程）或 notify()方法（只随机唤醒一个<br>
             wait 线程），被唤醒的的线程便会进入该对象的锁池中，锁池中的线程会去竞争该对象锁。也就<br>
                                   是说，调用了notify后只要一个线程会由等待池进入锁池，而notifyAll会将该对象等待池内的所<br>
                                   有线程移动到锁池中，等待锁竞争。
          </li>
          <li>
                                   优先级高的线程竞争到对象锁的概率大,假若某线程没有竞争到该对象锁,它还会留在锁池中,<br>
                                   唯有线程再次调用wait()方法,它才会重新回到等待池中.而竞争到对象锁的线程则继续往下执<br>
                                   行,直到执行完了synchronized代码块,它会释放掉该对象锁,这是锁池中的线程会继续竞争该对象锁.                      
          </li>
       </ol>
   </div>
   <div>
       <h3>43.线程的run()和start()有什么区别?</h3>
       <p>每个线程都是通过某个特定Thread对象所对应的方法run()来完成其操作的,方法run()称为线程体.<br>
                           通过调用Thread类的start()方法来启动一个线程.</p>
       <p>start()方法来启动一个线程,真正实现了多线层运行.这时无需等待run方法体代码执行完毕,可以直<br>
                           接继续执行下面的代码;这时此鲜吃呢个是处于就绪状态,并没有运行.然后通过此Thread类调用方法<br>
          run()来完成其运行状态,这里方法run()称为线程体,它包含了要执行的这个线程的内容,Run方法<br>
                           运行结束,此线程终止.然后CPU在调度其他线程.</p>
       <p>run()方法是在本线程里的,只是线程里的一个函数,而不是多线程的.如果直接调用run(),其实就相当<br>
                          于调用了一个普通函数而已,直接调用run()方法必须等待run方法执行完毕才能执行下面的代<br>
                          码,所以执行路径还是只要一条,根本就没有线程的特征,所以在多线程执行时要使用start()方法而不是run方法.</p>
   </div>
   
   <div>
       <h3>44.创建线程池有哪几种方式?</h3>
       <ol>
           <li>newFixedThreadPool(int nThreads)<br>
               <p>创建一个固定长度的线程池,每当提交一个任务就创建一个线程,直到达到线程池的最大数量,这时<br>
                                                 线程规模将不再变化,当线程发生未预期的错误而结束时,线程池会补充一个新的线程.
               </p>
           </li>
           <li>newCachedThreadPool()<br>
               <p>
                                                创建一个可缓存的线程池,如果线程池的规模超过了处理需求,将自动回收空闲线程,而当需求增加<br>
                                         时,则可以自动添加新程序,线程池的规模不存在任何限制.                              
               </p>    
           </li>
           <li>newSingleThreadExecutor()<br>
               <p>这是一个单线程的Executor,它创建单个工作线程来执行任务,如果这个线程异常结束,会创建一个<br>
                                                 新的来替代它;它的特点是能确保依照任务在队列中的顺序来串行执行.
               </p>
           </li>
           <li>newScheduledThreadPool(int corePoolSize)<br>
                                         创建了一个固定长度的线程池,而且以延迟或定时的方式来执行任务,类似于Timer.
           </li>
       </ol> 
   </div>
   <div>
       <h3>45.线程池都有哪些状态?</h3>
       线程池有5种状态: Running,ShutDown,Stop,Tidying,Terminated. <br> 
      线程池各个状态切换框架图:<br>
  <img alt="常用容器" src="${ctxStatic}/images/resultImage/xccsmzq.jpg"><br>  
  </div>
  
  <div>
      <h3>46.线程池中submit()和execute()方法有什么区别?</h3>
      <ol>
         <li>接收的参数不一样</li>
         <li>submit有返回值,而execute没有</li>
         <li>submit方便Exception处理</li>
      </ol>
  </div> 
  
  <div>
      <h3>47.在java程序中怎么保证多线层的运行安全?</h3>
                         线程安全在三个方面体现:<br>
         <ol>
             <li>原子性:提供互斥访问,同一时刻只能有一个线程对数据进行操作.(atomic,synchronized);</li>
             <li>可见性:一个线程对主内存的修改可以及时地被其他线程看到,(synchronized,volatile);</li>
             <li>有序性:一个在线程观察其他线程中的指令执行顺序,由于指令重新排序,该观察结果一般杂乱,无序,<br>
             (happens-before原则).</li>
         </ol>               
  </div> 
   
   <div>
      <h3>48.多线程所的升级原理是什么?</h3>
       <p>
                          在Java中，锁共有4种状态，级别从低到高依次为：无状态锁，偏向锁，轻量级锁和重量级锁状态，<br>
                          这几个状态会随着竞争情况逐渐升级。锁可以升级但不能降级。<br>
                          锁升级的图示过程:
         <img alt="常用容器" src="${ctxStatic}/images/resultImage/ssjsyt.jpg"><br>                  
       </p>
   </div>
   
   <div>
       <h3>49.什么是死锁?</h3>
       <p>
                        死锁是指两个或两个以上的进程在执行过程中,由于竞争资源或者由于彼此通信而造成的一种阻塞的现象,<br>
                 现象,若无外力作用,它们都将无法推进下去.此时称系统处于死锁状态或系统产生了死锁,这些永<br>
                 远在互相等待的进程称为死锁进程.是操作系统层面的一个错误,是进程死锁的简称.最早在1965<br>
                 年由Dijkstra在研究银行家算法时提出的,它是计算机操作系统乃至整个并发程序设计领域最难处理<br>
                 的问题之一.               
       </p>
   </div>
   <div>
       <h3>50.怎么防止死锁?</h3>
                   死锁的四个必要条件:<br>
       <ol>
           <li>互斥条件:进程对所分配到的资源不允许其他进程进行访问,若其他进程访问该资源,只能等<br>
                                         待,直至占有该资源的进程使用完成后释放该资源.</li>
           <li>请求和保持条件:进程获得一定的资源之后,又对其他资源发出请求,但是该资源可能被其他进<br>
                                          程占有,此时请求阻塞，但又对自己获得的资源保持不放</li>
           <li>不可剥夺条件:是指进程已获得的资源，在未完成使用之前，不可被剥夺，只能在使用完后自己释放</li>
           <li>环路等待条件:是指进程发生死锁后，若干进程之间形成一种头尾相接的循环等待资源关系</li>
       </ol>
      <p>
                       这四个条件是死锁的必要条件，只要系统发生死锁，这些条件必然成立，而只要上述条件之 一不满<br>
                       足，就不会发生死锁。
     </p>
     <p>
                       理解了死锁的原因，尤其是产生死锁的四个必要条件，就可以最大可能地避免、预防和 解除死锁        
     </p>
     <p>
                       所以，在系统设计、进程调度等方面注意如何不让这四个必要条件成立，如何确 定资源的合理分配算<br>
                       法，避免进程永久占据系统资源。
     </p>
     <p>
                  此外，也要防止进程在处于等待状态的情况下占用资源。因此，对资源的分配要给予合理的规划.
     </p>
   </div>
</div>
			
</body>
<script type="text/javascript">
</script>



</html>
