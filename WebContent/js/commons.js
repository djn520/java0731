$(function() {

	$.extend($.fn.validatebox.defaults.rules, {
		usernameLength : {
			validator : function(value, param) {
				return value.length >= param[0] && value.length <= param[1];
			},
			// message : '用户名长度必须在 {0}-{1} 个字符.'
			message : ''
		}
	});
	$('#age').numberbox({
		min : 0,
		max : 100,
		required : true,
		missingMessage : '年龄必填!',
		precision : 0
	});
	$('#birthday').datebox({
		required : true,
		missingMessage : '生日必填!',
		editable : false
	});

	$('#salary').numberbox({
		min : 1000,
		max : 15000,
		required : true,
		missingMessage : '薪水必填!',
		precision : 2
	});
	$('#startTime,#endTime').datetimebox({
		required : true,
		missingMessage : '时间必填!',
		editable : false
	});
});
