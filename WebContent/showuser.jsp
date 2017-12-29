<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>显示用户信息</title>
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
<script>
$(function() {

	/* var value = $('#value').datagrid('getSelected');	
	alert(value); */
	$('#t_user').datagrid({
		idField : 'id',//只要写数据表格一定要加idField
		title : '用户列表',
		/* width : 100, */
		/* height : 1000,   */
		//url : 'UserServlet?method=queryList',
		url : 'UserServlet?method=mohuchaxun&',
		loadMsg : '数据正在加载中，请等待....',
		rownumbers : true,//行号
		singleSelect : true,
		striped : true,//奇偶行颜色不一样
		//remoteSort : false,//本地排序 依据数据库排序
		//sortName : 'salary',
		//sortOrder : 'asc',
		rowStyler : function(index, record) {//年龄大于25本行变色
			//console.info(record);
			if (record.age == 22) {
				return 'background:red';
			}
		},
		//冻结列需要注销fitColumns:true 增加frozenColumns
		fitColumns : true,
		//加上以下配置
		/* frozenColumns:[[
			
		]], */
		columns : [ [  {
			field : 'u_id',
			title : '用户ID',
			width : 100
		},{
			field : 'u_username',
			title : '用户名',
			width : 100
		}, {
			field : 'u_password',
			title : '密码',
			width : 100
		}, {
			field : 'u_age',
			title : '年龄',
			width : 100
		}, {
			field : 'u_sex',
			title : '性别',
			width : 100
		}, {
			field : 'u_address',
			title : '地址',
			width : 100
		}] ],
		//分页 
		pagination : true,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25, 50 ],
		//表头
		toolbar : [ {
			text : '新增用户',
			iconCls : 'icon-add',
			handler : function() {
				$('#addDialog').dialog('open');
				$('#addDialog').form('clear');
				$('#btnsave').click(function() {
					if($('#myform').form('validate')){
						$.ajax({
							type:'post',
							url:'UserServlet?method=useradd',
							cache:false,
							data:$('#myform').serialize(),
							dataType:'json',
							success:function(result){
								//自动刷新
								$('#t_user').datagrid('load');


								//提交成功关闭窗口
								$('#addDialog').dialog('close');
								//提示保存成功
								$.messager.show({
									title:result.status,
									msg:result.message
								});
							},
							error:function(result){
								$.messager.show({
									title:result.status,
									msg:result.message
								});
							}
									
						});
					}else{
						$.messager.show({
							title:'提示信息',
							msg:'数据验证未通过，不能保存！'
						});
					}
				});
			}
		}, {
			text : '修改用户',
			iconCls : 'icon-edit',
			handler : function() {
				var arr =$('#t_user').datagrid('getSelections');
				if(arr.length <=0){
					$.messager.show({
						title:'提示信息:',
						msg:'至少选择一行记录进行修改!'
					});
				} else {
					 var row = $('#t_user').datagrid('getSelected');
					 if (row){
			                $('#addDialog').dialog('open').dialog('setTitle','修改');
			                $('#myform').form('load',row);
			         } 
					 $("#btnsave").click(function(){
			        	  if($('#addform').form('validate')){
			      			$.ajax({
			      				type:'post',
			      				url:'UserServlet?method=userupdate',
			      				cache:false,
			      				data:$('#myform').serialize(),
			      				dataType:'json',
			      				success:function(){
			      					//自动刷新
									$('#t_user').datagrid('load');
			      					//提交成功关闭窗口
			      					$('#addDialog').dialog('close');
			      					//提示保存成功
			      					$.messager.show({
			      						title:result.status,
			      						msg:result.message
			      					});  
			      				},
			      				error:function(result){
			      					$.messager.show({
			      						title:result.status,
			      						msg:result.message
			      					});
			      				} 
		      						
		      			});
		      		}else{
		      			$.messager.show({
		      				title:'提示信息',
		      				msg:'数据验证未通过，不能保存！'
		      			});
		      		} 
		           });
			  }
		  }
		}, {
			text : '删除用户',
			iconCls : 'icon-remove',
			handler : function() {
				var arr =$('#t_user').datagrid('getSelections');
				if(arr.length <=0){
					$.messager.show({
						title:'提示信息:',
						msg:'至少选择一行记录进行删除!'
					});
				} else {
				var row = $('#t_user').datagrid('getSelected');
	            if (row){
	                 $.messager.confirm('确认','您确定要删除吗？',function(r){
	                	 alert(row.u_id);
	                    	$.ajax({
	            				type:'post',
	            				url:'UserServlet?method=userdelete',
	            				data:"u_id="+row.u_id,
	            				dataType:'json',
	            				success:function(){
	            					//自动刷新
									$('#t_user').datagrid('load');
	            					$.messager.show({
	            						title:result.status,
	            						msg:result.message
	            					});  
	            				},
	            				error:function(result){
	            					
	            					$.messager.show({
	            						title:result.status,
	            						msg:result.message
	            					});
	            				} 
	            			}); 
	                });
	            }
			}
		}
		}, {
			text : '查询用户',
			iconCls : 'icon-search',
			handler : function() {
				$('#lay').layout('expand' , 'north');
				
			}
		} ]
	});
	/**
	 * 提交表单
	 */
	
	//关闭窗口
	$('#btnclose').click(function() {
		$('#addDialog').dialog('close');
	});
	//模糊查询的条件
	$('#searchbtn').click(function(){
		$('#t_user').datagrid('load' ,serializeForm($('#mysearch')));
	});
	//清空
	$('#cleanbtn').click(function(){
		$('#mysearch').form('clear');
		$('#t_user').datagrid('load' ,{});
	});
});
//js方法：序列化表单 			
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ','+this['value'];
		} else {
			obj[this['name']] =this['value'];
		}
	});
	return obj;
}

</script>

</head>
<body class="easyui-layout"> 
 <div id="lay" class="easyui-layout" style="width: 100%;height:100%" >  
    <div  data-options="region:'north',title:'用户查询',split:true"  collapsed=true style="height:100px;">
		<form id="mysearch" method="post">
			<!-- 用户编号,用户名,年龄,性别,地址 -->
			<input type="text" class="easyui-validatebox" name="values" id="value" value="">
			<a id="searchbtn" class="easyui-linkbutton">查询</a>
			<a id="cleanbtn" class="easyui-linkbutton">清空</a>
		</form>
     </div>
	<!-- ************************************************************************ -->
      
    <div region="center"  style="padding:5px;background:#eee;">
    
    	<table id="t_user"></table>
    	
    </div> 
 </div>     
	<!-- ************************************************************************ -->
	
	<div id="addDialog" modal="true" title="新增用户" draggable="false"
		class="easyui-dialog" closed="true" style="width: 320px">
		<form id="myform" action="" method="post">
			<table>
				<tr>
					<td><input type="hidden" name="id" style="width: 155px;"/>
					
					</td>
				</tr>
				<tr>
					<td>用户编号:</td>
					<td><input type="text" name="u_id" style="width: 155px;"
						class="easyui-validatebox" required=true
						validType="usernameLength[3,6]" missingMessage="u_000!"
						invalidMessage="用户名必须在3-6字符之间！" value=""  /></td>
				</tr>
				<tr>
					<td>用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户:</td>
					<td><input type="text" name="u_username" style="width: 155px;"
						class="easyui-validatebox" required=true
						validType="usernameLength[3,6]" missingMessage="用户名必填!"
						invalidMessage="用户名必须在3-6字符之间！" value="" /></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
					<td><input type="text" name="u_password"
						style="width: 155px;" class="easyui-validatebox" required=true
						validType="equalLength[4]" missingMessage="密码必填!" value="" /></td>
				</tr>
				<tr>
					<td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:</td>
					<td><input id="u_age" style="width: 159px;" type="text"
						name="u_age" value="" /></td>
				</tr>
				<tr>
					<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
					<td>男<input type="radio" checked="checked" name="u_sex"
						value="1" /> 女 <input type="radio" name="u_sex" value="0" />
					</td>
				</tr>
				<tr>
					<td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</td>
					<td><input id="u_address" style="width: 160px;" type="text"
						name="u_address" value="" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btnsave" class="easyui-linkbutton">确认保存</a>
						<a id="btnclose" class="easyui-linkbutton">放弃保存</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- ******************************************************************************** -->
	
	
</body>
</html>