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
<title>菜单</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());

	//保存
	function save() {
		if ($("#name").val() == "") {
			$("#name").tips({
				side : 3,
				msg : '请输入菜单名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#name").focus();
			return false;
		}
		if ($("#leveSort").val() == "") {
			$("#leveSort").tips({
				side : 3,
				msg : '请输入序号',
				bg : '#AE81FF',
				time : 3
			});
			$("#leveSort").focus();
			return false;
		}
		if ($("#code").val() == "") {
			$("#code").tips({
				side : 3,
				msg : '请输入序号',
				bg : '#AE81FF',
				time : 3
			});
			$("#code").focus();
			return false;
		}
		if ($("#levelLag").val() == "") {
			$("#levelLag").tips({
				side : 3,
				msg : '请选择菜单类型',
				bg : '#AE81FF',
				time : 3
			});
			$("#levelLag").focus();
			return false;
		}
		$("#menuForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}

	$(function() {
		//单选框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
	});
</script>

<body>
	<form action="system/doEditMenu" name="menuForm" id="menuForm"
		method="post">
		<input name="levelPid" id="levelPid" value="${resource.levelPid}" type="hidden" />
		<input name="id" id="id" value="${resource.id}" type="hidden" />
		<div id="zhongxin">
			<table>
				<tr>
					<th>菜单名称：</th>
					<td><input type="text" name="name" id="name"
						placeholder="这里输入菜单名称" value="${resource.name}" title="名称" /></td>
				</tr>
				<tr>
					<th>标识：</th>
					<td><input type="text" name="code" id="code" placeholder="标识"
						value="${resource.code}" title="标识" /></td>
				</tr>
				<tr>
					<th>资源地址：</th>
					<td><input type="text" name="url" id="url"
						placeholder="请输入资源地址" value="${resource.url}" title="资源地址" /></td>
				</tr>
				<tr>
					<th>排序：</th>
					<td><input type="number" name="leveSort" id="leveSort"
						placeholder="这里输入排序" value="${resource.leveSort}" title="排序" /></td>
				</tr>
				<tr>
					<th>菜单类型：</th>
					<td>
						<select class="chzn-select" name="levelLag" id="levelLag"
							data-placeholder="菜单类型" style="vertical-align: top; width: 120px;">
								<option value="3"<c:if test="${resource.levelLag == '3'}">selected</c:if>>菜单</option>
								<option value="2"<c:if test="${resource.levelLag == '2'}">selected</c:if>>字段</option>
								<option value="1"<c:if test="${resource.levelLag == '1'}">selected</c:if>>按钮</option>
						</select>
					</td>
				<tr>
					<th>描述：</th>
					<td><input type="text" name="msg" id="msg"
						placeholder="这里输入描述" value="${resource.msg}" title="描述" /></td>
				</tr>
				<tr>
					<td style="text-align: center; padding-top: 10px;" colspan="2"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
</body>
</html>