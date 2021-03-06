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
    <h3>Java多线程学习(七)并发编程中一些问题</h3>
    <p>原文地址: https://blog.csdn.net/qq_34337272/article/details/79844051
    </p>
    
    <div>
       <h3>多线层就一定好吗?快吗?</h3>
       <p>
         并发编程的目的就是为了能提高程序的执行效率提高程序运行速度,但是并发编程并不总是能提高程<br>
         序运行速度的,而且并发编程可能会遇到很多问题,比如:内存泄露,上下文切换,死锁还有受限于<br>
         硬件和软件的资源闲置问题.<br>
    多线程就是几乎同时执行多个线程(一个处理器在某一个时间点上永远 只能运行一个线程!即使这个处理器<br>
    是多核的,除非有多个处理器才能实现多个线程同时运行).CPU通过给每个线程分配CPU时间片来实现<br>     
   伪同时运行,因为CPU时间片一般很短很短,所以给人一种同时运行的感觉.      
       </p>
       <h3>上下文切换</h3>
      <p>
         上下文切换通常是计算密集型的.也就是说,它需要相当可观的处理器时间,字每秒几十上百次的切<br>
         换中,每次切换都需要纳秒量级的时间.所以,上下文切换对系统来说意味着消耗大量的CPU时<br>
         间,事实上,可能是操作系统中时间消耗最大的操作.<br>
    Linux相比与其他操作系统（包括其他类 Unix 系统）有很多的优点，其中有一项就是，其上下文切换<br>
           和模式切换的时间消耗非常少<br> 
      </p> 
      <p>
      <h3>减少上下文切换</h3>
       上下文切换又分为2种:让步式上下文切换和抢占式上下文切换.前者是指执行线程主动释放CPU,<br>
       与锁竞争严重程度成正比,可通过减少锁竞争和使用CAS算法来避免;后者是指线程因分配的时间片<br>
       用尽而被迫放弃CPU或者被其他优先级更高的线程所抢占,一般由于线程数大于CPU可用核心数引起,<br>
       可通过适当减少线程数和使用携程来避免.<br>
           总结下一:<br>
           <ol>
              <li>减少锁的使用,因为多线程竞争锁时会引起上下文切换</li>
              <li>使用CAS算法,这种算法也是为了减少锁的使用.CAS算法是一种无锁算法.</li>
              <li>减少线程的使用,任务很少的时候创建大量线程会导致大量线程都处于等待状态.</li>
              <li>使用协程</li>
           </ol>
         CSA算法<br>
         
       <b>
        CAS（比较与交换，Compare and swap） 是一种有名的无锁算法。无锁编程，即不使用锁的情况下实现多<br>
                     线程之间的变量同步，也就是在没有线程被阻塞的情况下实现变量的同步，所以也叫非阻塞同步<br>
                     （Non-blocking Synchronization）。实现非阻塞同步的方案称为“无锁编程算法”<br>
                     （ Non-blocking algorithm）。<br>
                      相对应的，独占锁是一种悲观锁，synchronized就是一种独占锁，它假设最坏的情况，并且只有在确保其它<br>
                      线程不会造成干扰的情况下执行，会导致其它所有需要锁的线程挂起，等待持有锁的线程释放锁。
        </b>
                      协程<br>
         <b>
                            协程也可以说是微线程或者说是轻量级的线程，它占用的内存更少并且更灵活。很多编程语言中都有协程。<br>
          Lua, Ruby 等等都有自己的协程实现。Go完全就是因为协程而发展壮大的。维基百科上面并没有Java实现协程<br>
                           的方式，但是不代表Java不能实现协程。比如可以使用Java实现的开源协程库：Quasar。Quasar官网：<br>
          http://www.paralleluniverse.co/quasar/，。这个库实现了一种可以和Go语言中的Goroutine相对标的编程<br>
                           概念：Fiber。Fiber是一种真正的协程。<br>
         </b>             
                           最后Mark两篇关于协程的文章:<br>
                          协程，高并发IO终极杀器(3)：https://zhuanlan.zhihu.com/p/27590299<br>
                         次时代Java编程（一）：Java里的协程：http://geek.csdn.net/news/detail/71824<br>
        
      </p>  
    </div>
    
    <div>
       <h3>避免死锁</h3>
       <p>
                       在操作系统中，死锁是指两个或两个以上的进程在执行过程中，由于竞争资源或者由于彼此通信而造<br>
                       成的一种阻塞的现象，若无外力作用，它们都将无法推进下去。此时称系统处于死锁状态或系统产生<br>
                       了死锁，这些永远在互相等待的进程称为死锁进程。<br>
                       在线程中,如果两个线程同时等待对方释放锁也会产生死锁.<br>
                       锁是一个好东西，但是使用不当就会造成死锁。一旦死锁产生程序就无法继续运行下去。所以如何避<br>
                       免死锁的产生，在我们使用并发编程时至关重要。<br>
                       常见的避免死锁的方法有四种:<br>
         <ol>
         <li>避免一个线程同时获得多个锁</li>
         <li>避免一个线程在锁内同时占用多个资源,尽量保证每个锁只占用一个资源</li>
         <li>尝试使用定时锁,使用Lock.tryLock(timeout)来代替使用内部锁机制</li>
         <li>对于数据库锁,加锁和解锁必须在一个数据库连接里,否则会出现解锁失败的情况</li>
         </ol>                                           
       </p>   
   </div>
  <div>
  <h3>解决资源限制</h3>
   <h2>什么是资源限制</h2>
   <p>
               所谓资源限制就是我们在进行并发编程时，程序的运行速度受限于计算机硬件资源比如CPU,内存等等或软件<br>
               资源比如软件的质量、性能等等。举个例子：如果说服务器的带宽只有2MB/s，某个资源的下载速度是1MB/s，<br>
               系统启动10个线程下载该资源并不会导致下载速度编程10MB/s，所以在并发编程时，需要考虑这些<br>
               资源的限制。硬件资源限制有：带宽的上传和下载速度、硬盘读写速度和CPU处理速度；软件资源限制有<br>
               数据库的连接数、socket连接数、软件质量和性能等等。<br>
   </p>
  </div> 
   <div>
   <h3>资源限制引发的问题</h3>
      <p>
                      在并发编程中，程序运行加快的原因是运行方式从串行运行变为并发运行，但是如果如果某段程序的并发执行<br>
                      由于资源限制仍然在串行执行的话，这时候程序的运行不仅不会加快，反而会更慢，因为可能增加了上下文切换<br>
                      和资源调度的时间。
      </p>
   <h3>如何解决资源限制的问题</h3>
      <p>
                      对于硬件资源限制，可以考虑使用集群并行执行程序。既然单机的资源有限制，那么就让程序在多机上运行。<br>
                      比如使用Hadoop或者自己搭建服务器集群。<br>
                     对于软件资源的限制，可以考虑使用资源池将资源复用。比如使用连接池将数据库和Socket复用，或者在调<br>
                     用对方webservice接口获取数据时，只建立一个连接。另外还可以考虑使用良好的开源软件。<br>
      </p>
   <h3>在资源限制的情况下如何进行并发编程</h3>
      <p>
                     根据不同的资源限制调整程序的并发度，比如下载文件程序依赖于两个资源-带宽和硬盘读写速度。有数据库<br>
                     操作时，设计数据库练连接数，如果SQL语句执行非常快，而线程的数量比数据库连接数大很多，则某些线程<br>
                     会被阻塞，等待数据库连接。<br>                     
      </p>
               上下文切换的详解：http://ifeve.com/context-switch-definition/<br>
   </div>
   

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
