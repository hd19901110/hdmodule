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
    <h3>hibernate注解</h3>
    <p>
     注解何其多,遇到就是缘分,记录一下,留与后来人.
    </p>
    
    <div>
       <h3>普通字段上的注解</h3>
       <p> 
          <ol>
             <li>@NotNull: 不能为null,但可以为enpty</li>
             <li>@NotEmpty: 不能为null,而且长度必须大于0</li>
             <li>@NotBlank: 只能作用在String上,不能为null,而且调用trim()后，长度必须大于0</li>
             <li>@Length(min=0,max=10): 限制字段长度,只对string有效,min最短,max最长</li>
             <li>@Column:属性详解
                 <ol>
                    <li>name: 定义了被标注字段在数据库表中所对应字段的名称</li>
                    <li>unique: 表示该字段是否为唯一标识,默认为false.如果表中有一个字段需要唯一标识.则既可以使用该标记, 也可以使用@table标记中的 @UniqueConstraint.</li>
                    <li>nullable: 表示该字段是否可以未null值,默认为true</li>
                    <li>insertable: 表示在使用"INSERT"脚本插入数据时,是否需要插入插入该地段的值.</li>
                    <li>updatable: 表示在使用"UPDATE"脚本插入数据时,是否需要更新该字段的值.insertable和updatable属性一般多用于只读的属性，例如主键和外键等。这些字段的值通常是自动生成的。</li>
                    <li>columnDefinition(大多数情况，几乎不用): 表示创建表时，该字段创建的SQL语句，一般用于通过Entity生成表定义时使用。也就是说，如果DB中表已经建好，该属性没有必要使用。</li>
                    <li>table: 表示当映射多个表时,指定表中的字段.默认值为主表的表名.</li>
                    <li>length: 表示字段的长度,当字段的类型为varchar时,该属性才有效.默认为255个字符</li>
                    <li>precision和scale: precision属性和scale属性表示精度，当字段类型为double时，precision表示数值的总长度，scale表示小数点所占的位数。</li>
                    <li>@Column可以标注在属性前或getter方法前</li>
                 
                 </ol>              
             </li>
             <li></li>
             <li></li>
             <li></li>
             <li></li>
          
          
          
          
          
          
          </ol>   
       </p>
    </div>
    

   
   
   

</div>
			
</body>
<script type="text/javascript">
</script>



</html>
