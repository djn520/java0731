<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<script>
	$(function() {
		$('#wlowin').window('open');
	});

	//验证form表单
	$.extend($.fn.validatebox.defaults.rules, {
		midLength_account : {
			/* validator : function(value, param) {
				return value.length >= param[0] && value.length <= param[1];
			},
			message : '账号的长度必须在{0}~{1}个字符之间！' */
		},
		midLength_password : {
			/* validator : function(value, param) {
				return value.length >= param[0] && value.length <= param[1];
			},
			message : '账号的长度必须在{0}~{1}个字符之间！' */
		}
	});

	//提交表单验证
	function submitForm() {
		$('#ff').form('submit', {
			url : 'UserServlet?method=login ',//servlet里的登录...
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = $.parseJSON(result);//字符串转JSON
				if(result.status == "ok"){
					window.location.href='showuser.jsp';
				}else{
					$.messager.show({
						title : result.status,
						msg : result.message
					});
				}
			}
		});
	}
</script>
</head>
<body>

	<div id="wlowin" class="easyui-window" title="用户登录窗口"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width: 500px; height: 300px; padding: 30px;">
		<form id="ff" method="post">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="username" required="required" prompt="账号"
					validType="midLength_account[5,10]" missingMessage="账号必填！"
					iconWidth="28" style="width: 100%; height: 34px; padding: 10px;">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" name="password" required="required" prompt="口令"
					validType="midLength_password[6,15]" missingMessage="口令必填！"
					iconWidth="28" style="width: 100%; height: 34px; padding: 10px">
			</div>

		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton c5"
				onclick="submitForm()" style="width: 80px">登录</a> <a
				href="javascript:void(0)" class="easyui-linkbutton c6"
				onclick="clearForm()" style="width: 80px">重置</a>
		</div>
	</div>


</body>
</html>