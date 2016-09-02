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
	function save() {

		if ($("#appName").val() == "") {
			$("#appName").tips({
				side : 3,
				msg : '请应用名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#appName").focus();
			return false;
		}
		if ($("#pkgName").val() == "") {
			$("#pkgName").tips({
				side : 3,
				msg : '请在这里应用名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#pkgName").focus();
			return false;
		}
		if ($("#appBriefing").val() == "") {
			$("#appBriefing").tips({
				side : 3,
				msg : '应用包名',
				bg : '#AE81FF',
				time : 3
			});
			$("#appBriefing").focus();
			return false;
		}
		if ($("#appUser").val() == "") {
			$("#appUser").tips({
				side : 3,
				msg : '请输入应用简介',
				bg : '#AE81FF',
				time : 3
			});
			$("#appUser").focus();
			return false;
		}
		$("#applyeditForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="conf/doApplyEdit" name="applyeditForm"
		id="applyeditForm" method="post">
		<input name="id" id="id" value="${appinfo.id}" type="hidden" />
		<div id="zhongxin">
			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<tr>
					<th>应用ID：</th>
					<td><input type="text" name="appId" id="appId"
						autocomplete="off" value="${appinfo.appId}" maxlength="32"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>用户名：</th>
					<td><input type="text" name="appName" id="appName"
						autocomplete="off" value="${appinfo.appName}" maxlength="32"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>应用包名：</th>
					<td><input type="text" name="pkgName" id="pkgName"
						autocomplete="off" value="${appinfo.pkgName}" maxlength="32"
						placeholder="请在这里用应用包名" title="应用包名" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>应用简介：</th>
					<td><textarea class="form-control limited" id="form-field-9"
							name="appBriefing" maxlength="128" placeholder="请在这里输入应用简介"
							title="应用简介">${appinfo.appBriefing }</textarea></td>
				</tr>
				<tr>
					<th>应用所有者：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="appUser" id="appUser" data-placeholder="应用所有者"
						style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${users}" var="user">
								<option value="${user.id }" 
								<c:if test="${user.id == appinfo.appUser}">selected</c:if>>${user.name}</option>
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
	<script type="text/javascript" src="static/js/chosen.jquery.min.js">
		
	</script>
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