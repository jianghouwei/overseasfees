<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	System.out.println(path);
	//获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath
	//变量
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(basePath);
	//将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
	pageContext.setAttribute("basePath", basePath);
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	System.out.println("error校验值" + error);
	request.setAttribute("error", error);
%>
<!DOCTYPE html>
<html>
<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
</head>
<body>
	<div style="width: 100%; text-align: center; margin: 0 auto; position: absolute;">
		<div id="loginbox">
			<form action="login" method="post" name="loginForm" id="loginForm"
				onsubmit="return check();">
				<div class="control-group normal_text">
					<h3>
						海外计费平台
						<!-- <img src="static/login/logo.png" alt="Logo" /> -->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg"> <i><img height="37"
									src="static/login/user.png" /></i>
							</span><input type="text" name="username" id="username" value=""
								placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly"> <i><img height="37"
									src="static/login/suo.png" /></i>
							</span><input type="password" name="password" id="password"
								placeholder="请输入密码" value="" />
						</div>
					</div>
				</div>
				<div style="float: right; padding-right: 10%;">
					<div style="float: left; margin-top: 3px; margin-right: 2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" name="rememberMe"
							type="checkbox" onclick="savePaw();" style="padding-top: 0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width: 86%; padding-left: 8%;">
						<div style="float: left;">
							<i><img src="static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="captcha" id="captcha" class="login_code"
								style="height: 16px; padding-top: 0px;" />
						</div>
						<div style="float: left;">
							<i><img style="height: 22px;" id="img_captcha" alt="点击更换"
								title="点击更换" src="static/login/images/kaptcha.jpg" /></i>
						</div>
						<span class="pull-right" style="padding-right: 3%;">
							<button class="btn btn-success" type="button" onclick="jump();">取消</button>
						</span> <span class="pull-right">
							<button class="flip-link btn btn-info" type="submit">提交</button>
						</span>
					</div>
				</div>
			</form>
			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr"></span></font>
				</div>
			</div>
		</div>
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="static/login/images/banner_slide_01.jpg"></div>
			<div data-src="static/login/images/banner_slide_02.jpg"></div>
			<div data-src="static/login/images/banner_slide_03.jpg"></div>
		</div>
		<!-- #camera_wrap_3 -->
	</div>
	<script type="text/javascript">
		$(function() {
			var errormsg = "${error}".toString();
			$('#img_captcha').click(
					function() {
						$(this).attr(
								'src',
								'static/login/images/kaptcha.jpg?t='
										+ genTimestamp());
					});
			
			if(errormsg == "com.org.utils.CaptchaException"){
				$("#captcha").tips({
					side : 1,
					msg : "验证码输入有误",
					bg : '#FF5080',
					time : 5
				});
				$("#captcha").focus();
			}
			if(errormsg == "org.apache.shiro.authc.UnknownAccountException"){
				$("#username").tips({
					side : 2,
					msg : "用户名或密码有误",
					bg : '#FF5080',
					time : 5
				});
				$("#username").focus();
			}
			if(errormsg == "org.apache.shiro.authc.AuthenticationException"){
				$("#username").tips({
					side : 2,
					msg : "用户不存在",
					bg : '#FF5080',
					time : 5
				});
				$("#username").focus();
			}
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		//客户端校验
		function check() {
			if ($("#username").val() == "") {
				$("#username").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#username").focus();
				return false;
			} else {
				$("#username").val(jQuery.trim($('#username').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#password").focus();
				return false;
			}
			if ($("#captcha").val() == "") {
				$("#captcha").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#captcha").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});
			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		/* function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('usernameusername', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		} */
		function jump() {
			$("#username").val('');
			$("#password").val('');
			$("#captcha").val('');
		}

		jQuery(function() {
			/* var loginname = $.cookie('username');
			var password = $.cookie('password');
			if (typeof (loginname) != "undefined"
					&& typeof (password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#captcha").focus();
			} */
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</body>

</html>