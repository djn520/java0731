<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>OA平台系统</title>
	<link rel="stylesheet"
		href="js/commons.js" />
	<link rel="stylesheet"
		href="js/jquery-easyui-1.5.3/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css"
		href="js/jquery-easyui-1.5.3/themes/icon.css">
	<link rel="stylesheet" type="text/css"
		href="js/jquery-easyui-1.5.3/themes/color.css">
	<script type="text/javascript"
		src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script type="text/javascript"
		src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/commons.js"></script>
<script type="text/javascript">

/* 	$(function (){
		$('a[title]').click(function(){
			var src = $(this).attr('title');
			var title = $(this).html();
			if($('#tt').tabs('exists' ,title)){
				$('#tt').tabs('select',title);
			} else {
				$('#tt').tabs('add',{   
				    title:title,   
				    content:'<iframe frameborder=0 style=width:100%;height:100% src='+ src +' ></iframe>',   
				    closable:true  
				});  
			}
		});
	}); */
	$(function(){
 		$('a[title]').click(function(){
 			var src=$(this).attr("title");
 			var tltle=$(this).text();
 		if($('#tt').tabs('exists',tltle)){
 			$('#tt').tabs('select',tltle);
 		}else{
 			// 添加一个未选中状态的选项卡面板
 			$('#tt').tabs('add',{
 				title: tltle,
 				/* selected: true, */
 				content:"<iframe frameborder='0' style='width:100%;height:100%'  src="+src+"></iframe>",
 				closable:true
 			});
 		}
 		});
 	});
 

</script>
</head>

<body class="easyui-layout">  

      	<div region="north" title="North Title" split="true" style="height:100px;"></div>  

      	<div region="south" title="South Title" split="true" style="height:100px;"></div>  

      	<div region="east" iconCls="icon-reload" title="East" split="true" style="width:100px;"></div>  

     	<div region="west" split="true" title="菜单" style="width:150px;">  
				<div id="aa" class="easyui-accordion" fit=true style="width:150px;">  
				   <div title="用户管理" iconCls="icon-man"  style="overflow:auto;padding:10px;"> 
				    
				       		<a title="showuser.jsp"><font size=2  color="orange">用户信息</font></a><br>
				        	<a title="index.jsp"><font size=2  color="green">用户登录</font></a><br>
				       
				        
				   </div>  
				   <div title="用户权限"  selected="true" style="padding:10px;">  
				         
				         
				    </div> 
				    <div title="资源管理" iconCls="" >  
				        
				    
				    </div>  
				     
				</div>  
		</div>


  		<div region="center"   title="主界面" style="padding:5px;background:#eee;">
  		 	
  		 	
  		 	
  		 	
  		 	
  		 	
  		 	
  		 	<div id="tt" class="easyui-tabs"  fit=true>  
			
			
			
			</div>  
  		
  		
  		</div>  

</body>  


</html>