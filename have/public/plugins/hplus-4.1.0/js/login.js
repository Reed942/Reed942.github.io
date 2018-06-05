function refresh(obj) {
	obj.src = basePath+"/admin/index/imgCode.do?v=" + new Date().getTime();
}
function submitLoginForm() {
	var _data = {
		loginName : $("#loginName").val(),
		loginPwd : $("#loginPwd").val(),
		imgCode : $("#imgCode").val()
	};
	$.ajax({
		type : "post",
		url : basePath+"/admin/index/checkLogin.do?v="+ new Date().getTime(),
		data : _data,
		dataType : "json",
		success : function(data) {
			if (data.status == 0) {
				window.location.href = basePath+'/admin/index/index.do';
			} else {
				$('#msg').html("提&nbsp;&nbsp;&nbsp;示："+data.info);
			}
		}
	});
}
function resetLoginForm() {
	$('#loginName').val("");
	$('#loginPwd').val("");
	$('#imgCode').val("");
	$('#msg').html("");
}