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
    <h3>spring注解</h3>
    <p>20200729突然想做些什么,却不知道何去何从.锐气!</p>
    <div>
       <h4>Spring相关6个注解</h4>
       <p>
          spring Boot的有些注解也需要与Spring的注解搭配使用,这里梳理了在项目中与Spring Boot注解配合最为紧密<br>
                           的6个Spring基础框架注解<br>                
       </p>   
   </div>
   <div>
       <h3>1.@Configuration</h3>       
       <p>
                       从Spring3.0,<b>@Configuration</b>用于定义配置类,可替换xml配置文件,被注解的类内部包含有一个或多个被@Bean注解的方法<br>
                      这些方法将会被,AnnotationConfigApplicationContext或AnnotationConfigWebApplicationContext类进行扫描,并用<br>
                      于构建bean定义,初始化Spring容器.                   
       </p>      
   </div>
   <div>
       <h3>2.@ComponentScan</h3>       
       <p>
                      做过web开发的同学一定都有用过@Controller，@Service，@Repository注解，查看其源码你会发现，他们中有一个共同的注解<br>
        @Component，没错@ComponentScan注解默认就会装配标识了@Controller，@Service，@Repository，@Component注解的<br>
                      类到spring容器中。<br>                 
       </p>      
   </div>
   <div>
       <h3>3.@Conditional</h3>       
       <p>
         @Conditional是Spring4新提供的注解，通过@Conditional注解可以根据代码中设置的条件装载不同的bean，在设置条件注解之前，<br>
                        先要把装载的bean类去实现Condition接口，然后对该实现接口的类设置是否装载的条件。Spring Boot注解中的<br>
         @ConditionalOnProperty、@ConditionalOnBean等以@Conditional*开头的注解，都是通过集成了@Conditional来实现相应功能的。              
       </p>      
   </div>
   <div>
       <h3>4.@Import</h3>       
       <p>
                       通过导入的方式实现把实例加入springIOC容器中。可以在需要时将没有被Spring容器管理的类导入至Spring容器中。              
       </p>      
   </div>
   <div>
       <h3>5.@ImportResource</h3>       
       <p>
                          和@Import类似,区别就是@ImportResource导入的是配置文件                 
       </p>      
   </div>
   <div>
       <h3>6.@Component</h3>       
       <p>
          @Component是一个元注解，意思是可以注解其他类注解，如@Controller @Service @Repository。带此注解的类被看作组件，当<br>
                           使用基于注解的配置和类路径扫描的时候，这些类就会被实例化。其他类级别的注解也可以被认定为是一种特殊类型的组件，比如<br>
          @Controller 控制器（注入服务）、@Service服务（注入dao）、@Repository dao（实现dao访问）。@Component泛指组<br>
                           件，当组件不好归类的时候，我们可以使用这个注解进行标注，作用就相当于 XML配置，&lt;bean id="" class=""/&gt;。              
       </p>      
   </div>
   <div>
       <h4>Spring Boot最核心的20个注解</h4>       
       <p>
                        说完与Spring Boot密切相关的几个Spring基础注解后,下面我们就在一起看看Spring Boot 提供的核心注解的内容吧!     
       </p>      
   </div>
   <div>
       <h3>1.@SpringBootApplication</h3>       
       <p>
                        这个注解是Spring Boot最核心的注解，用在 Spring Boot的主类上，标识这是一个 Spring Boot 应用，用来开启 Spring Boot 的各<br>
                        项能力。实际上这个注解是@Configuration,@EnableAutoConfiguration,@ComponentScan三个注解的组合。由于这些注<br>
                        解一般都是一起使用，所以Spring Boot提供了一个统一的注解@SpringBootApplication。
       </p>      
   </div>
   <div>
       <h3>2.@EnableAutoConfiguration</h3>       
       <p>
          允许 Spring Boot 自动配置注解，开启这个注解之后，Spring Boot 就能根据当前类路径下的包或者类来配置 Spring Bean。<br>
   @EnableAutoConfiguration实现的关键在于引入了AutoConfigurationImportSelector，其核心逻辑为selectImports方法，逻辑<br>
       大致如下：<br>
      1.从配置文件META-INF/spring.factories加载所有可能用到的自动配置类;<br>
      2.去重，并将exclude和excludeName属性携带的类排除;<br>
      3.过滤，将满足条件(@Conditional)的自动配置类返回;<br>                 
       </p>      
   </div>
   <div>
       <h3>3.@SpringBootConfiguration</h3>       
       <p>
      这个注解就是 @Configuration 注解的变体，只是用来修饰是 Spring Boot 配置而已，或者可利于 Spring Boot 后续的扩展。             
       </p>      
   </div>
   <div>
       <h3>4.@ConditionalOnBean</h3>       
       <p>
         @ConditionalOnBean(A.class)仅仅在当前上下文中存在A对象时，才会实例化一个Bean，也就是说只有当A.class 在spring的<br>
         applicationContext中存在时，这个当前的bean才能够创建。<br>
       </p>      
   </div>
   <div>
       <h3>5.@ConditionalOnMissingBean</h3>       
       <p>
                          组合@Conditional注解，和@ConditionalOnBean注解相反，仅仅在当前上下文中不存在A对象时，才会实例化一个Bean。
       </p>      
   </div>
   <div>
       <h3>6.@ConditionalOnClass</h3>       
       <p>
                        组合 @Conditional 注解，可以仅当某些类存在于classpath上时候才创建某个Bean。
       </p>      
   </div>
   <div>
       <h3>7.@ConditionalOnMissingClass</h3>       
       <p>
                       组合@Conditional注解，和@ConditionalOnMissingClass注解相反，当classpath中没有指定的 Class才开启配置。
       </p>      
   </div>
   <div>
       <h3>8.@ConditionalOnWebApplication</h3>       
       <p>
                    组合@Conditional 注解，当前项目类型是 WEB 项目才开启配置。当前项目有以下 3 种类型:ANY(任何Web项目都匹配)、<br>
       SERVLET（仅但基础的Servelet项目才会匹配）、REACTIVE（只有基于响应的web应用程序才匹配）。
       </p>      
   </div>
   <div>
       <h3>9.@ConditionalOnNotWebApplication</h3>       
       <p>
                 组合@Conditional注解，和@ConditionalOnWebApplication 注解相反，当前项目类型不是 WEB 项目才开启配置。
       </p>      
   </div>
   <div>
       <h3>10.@ConditionalOnProperty</h3>       
       <p>
                         组合 @Conditional 注解，当指定的属性有指定的值时才开启配置。具体操作是通过其两个属性name以及havingValue来实现的，其<br>
                         中name用来从application.properties中读取某个属性值，如果该值为空，则返回false;如果值不为空，则将该值与havingValue指定<br>
                         的值进行比较，如果一样则返回true;否则返回false。如果返回值为false，则该configuration不生效；为true则生效。<br>      
       </p>      
   </div>
   <div>
       <h3>11.@ConditionalOnExpression</h3>       
       <p>
                        组合 @Conditional 注解，当 SpEL 表达式为 true 时才开启配置
       </p>      
   </div>
   <div>
       <h3>12.@ConditionalOnJava</h3>       
       <p>
                          组合@Conditional 注解，当运行的 Java JVM 在指定的版本范围时才开启配置。              
       </p>      
   </div>
   <div>
       <h3>13.@ConditionalOnResource</h3>       
       <p>
                          组合 @Conditional 注解，当类路径下有指定的资源才开启配置。       
       </p>      
   </div>
   <div>
       <h3>14.@ConditionalOnJndi</h3>       
       <p>
                          组合 @Conditional 注解，当指定的JNDI存在时才开启配置.   
       </p>      
   </div>
   <div>
       <h3>15.@ConditionalOnCloudPlatform</h3>       
       <p>
                          组合 @Conditional 注解，当指定的云平台激活时才开启配置.
       </p>      
   </div>
   <div>
       <h3>16.@ConditionalOnSingleCandidate</h3>       
       <p>
                          组合 @Conditional注解,当指定的class在容器中只有一个Bean,或者同时有多个但为首选时才开启配置.
       </p>      
   </div>

   <div>
       <h3>16.@ConditionalOnSingleCandidate</h3>       
       <p>
                          组合 @Conditional注解,当指定的class在容器中只有一个Bean,或者同时有多个但为首选时才开启配置.
       </p>      
   </div>
   <div>
       <h3>17.@ConfigurationProperties</h3>       
       <p>
        Spring Boot可使用注解的方式将自定义的properties文件映射到实体bean中，比如config.properties文件。
       </p>      
   </div>
   <div>
       <h3>18.@EnableConfigurationProPerties</h3>       
       <p>
                      当@EnableConfigurationProperties注解应用到你的@Configuration时，任何被@ConfigurationProperties注解的beans将自动被<br>
        Environment属性配置。 这种风格的配置特别适合与SpringApplication的外部YAML配置进行配合使用。
       </p>      
   </div>
   <div>
       <h3>19.@AutoConfigureAfter</h3>       
       <p>
                           用在自动配置类上面，表示该自动配置类需要在另外指定的自动配置类配置完之后。            
       </p>      
   </div>
   <div>
       <h3>20.@AutoConfigureBefore</h3>       
       <p>
                      这个和@AutoConfigureAfter注解使用相反，表示该自动配置类需要在另外指定的自动配置类配置之前。                       
       </p>      
   </div>
   <div>
       <h3>21.@AutoConfigureOrder</h3>       
       <p>
       Spring Boot 1.3.0中加的一个新注解@AutoConfigureOrder，用于确定配置加载的优先级顺序。              
       </p>      
   </div>
   
   
   

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
