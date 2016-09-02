<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script type="text/javascript">
	$(top.hangge());
	
	//保存
	function save(){
		
		if($("#loginName").val()=="" || $("#loginName").val()=="此用户名已存在!"){
			
			$("#loginName").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#loginName").focus();
			$("#loginName").val('');
			$("#loginName").css("background-color","white");
			return false;
		}else{
			$("#loginName").val(jQuery.trim($('#loginName').val()));
		}
		
		if($("#password").val()==""){
			
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#plainPassword").val()){
			
			$("#plainPassword").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
			$("#plainPassword").focus();
			return false;
		}
		//  昵称
		if($("#name").val()==""){
			
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		
		if($("#qq").val()==""){
			
			$("#qq").tips({
				side:3,
	            msg:'请输入qq',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#qq").focus();
			return false;
		}
		
		if($("#telName").val()==""){
			
			$("#telName").tips({
				side:3,
	            msg:'请输入联系人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#telName").focus();
			return false;
		}
		
		if($("#companyName").val()==""){
			
			$("#companyName").tips({
				side:3,
	            msg:'请输入公司名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#companyName").focus();
			return false;
		}
		if($("#roleId").val()==""){
	
			$("#roleId").tips({
				side:3,
		        msg:'请选择角色',
		        bg:'#AE81FF',
		        time:3
		    });
		$("#roleId").focus();
		return false;
		}
		if($("#userType").val()==""){
			
			$("#userType").tips({
				side:3,
		        msg:'请选择用户类型',
		        bg:'#AE81FF',
		        time:3
		    });
			$("#userType").focus();
			return false;
		}
		
		//手机号码
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#telphone").val()==""){
			$("#telphone").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#telphone").focus();
			return false;
		}else if($("#telphone").val().length != 11 && !myreg.test($("#telphone").val())){
			$("#telphone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#telphone").focus();
			return false;
		}
		
		if($("#email").val()==""){
			
			$("#email").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#email").focus();
			return false;
		}else if(!ismail($("#email").val())){
			$("#email").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#email").focus();
			return false;
		}
		
		if($("#userid").val()==""){
			hasloginname();
		}else{
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	
	//判断用户名是否存在
	function hasloginname(){
		var loginName = $.trim($("#loginName").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>system/validateUser',
			data : {
				loginName : loginName
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				} else {
					$("#loginName").tips({
						side : 3,
						msg : '此用户名已经存在',
						bg : '#AE81FF',
						time : 2
					});

					$("#loginName").focus();
					$("#loginName").css("background-color", "white");
				}
			}
		});
	}
	
	
</script>
</head>
<body>
	<form action="system/doAddUser" name="userForm" id="userForm"
		method="post">
		<div id="zhongxin">
			<table id="table_report"
				class="table table-striped table-bordered table-hover">

				<tr>
					<th>用户名：</th>
					<td><input type="text" name="loginName" id="loginName"
						autocomplete="off" value="" maxlength="32" placeholder="这里输入用户名"
						title="用户名" /></td>
				</tr>
				<tr>
					<th>昵称：</th>
					<td><input type="text" name="name" id="name"
						autocomplete="off" value="" maxlength="32" placeholder="昵称"
						title="昵称" /></td>
				</tr>
				<tr>
					<th>邮箱：</th>
					<td><input type="text" name="email" id="email"
						autocomplete="off" value="" maxlength="32" placeholder="邮箱"
						title="邮箱" /></td>
				</tr>
				<tr>
					<th>联系人：</th>
					<td><input type="text" name="telName" id="telName" value=""
						maxlength="11" placeholder="这里输入联系人" title="联系人" /></td>
				</tr>
				<tr>
					<th>QQ：</th>
					<td><input type="text" name="qq" id="qq" value=""
						maxlength="11" placeholder="这里输入QQ" title="QQ" /></td>
				</tr>
				<tr>
					<th>手机：</th>
					<td><input type="text" name="telphone" id="telphone" value=""
						maxlength="11" placeholder="这里输入手机号" title="手机号" /></td>
				</tr>
				<tr>
					<th>公司名称：</th>
					<td><input type="text" name="companyName" id="companyName"
						value="" maxlength="11" placeholder="这里输入公司名称" title="公司名称" /></td>
				</tr>
				<tr>
					<th>密码：</th>
					<td><input type="password" name="password" id="password"
						autocomplete="off" value="" maxlength="32" placeholder="输入密码"
						title="密码" /></td>
				</tr>
				<tr>
					<th>重复密码：</th>
					<td><input type="password" name="plainPassword"
						id="plainPassword" maxlength="32" placeholder="确认密码" title="确认密码" /></td>
				</tr>
				<!-- 角色 -->
				<tr>
					<th>角色：</th>
					<td><select class="chzn-select" name="roleId" id="roleId"
						data-placeholder="角色" style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${roleList}" var="role">
								<option value="${role.id }">${role.roleName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>客户类型：</th>
					<td><select class="chzn-select" name="userType" id="userType"
						data-placeholder="用户类型" style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${userTypes}" var="usertype">
								<option value="${usertype.id}">${usertype.typeName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>

	</form>

	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<script type="text/javascript">
		$(function() {

			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});
		});
	</script>

</body>
</html>