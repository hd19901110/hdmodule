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
     



</div>
			
</body>
<script type="text/javascript">
</script>



</html>
