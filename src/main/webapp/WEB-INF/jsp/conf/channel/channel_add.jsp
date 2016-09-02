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

		if ($("#appId").val() == "") {

			$("#appId").tips({
				side : 3,
				msg : '应用名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#appId").focus();
			return false;
		}
		if ($("#channelName").val() == "") {

			$("#channelName").tips({
				side : 3,
				msg : '请输渠道名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#channelName").focus();
			return false;
		}
		if ($("#channelCode").val() == "") {

			$("#channelCode").tips({
				side : 3,
				msg : '请输入渠道号',
				bg : '#AE81FF',
				time : 3
			});
			$("#channelCode").focus();
			return false;
		}
		if ($("#channelBriefing").val() == "") {

			$("#channelBriefing").tips({
				side : 3,
				msg : '请输入渠道简介',
				bg : '#AE81FF',
				time : 3
			});
			$("#channelBriefing").focus();
			return false;
		}
		if ($("#channelUser").val() == "") {

			$("#channelUser").tips({
				side : 3,
				msg : '请选择渠道所有者',
				bg : '#AE81FF',
				time : 3
			});
			$("#channelUser").focus();
			return false;
		}
		if ($("#percentage").val() == "") {

			$("#percentage").tips({
				side : 3,
				msg : '请填写扣量百分比',
				bg : '#AE81FF',
				time : 3
			});
			$("#percentage").focus();
			return false;
		}
		if ($("#percentage").val() > 100 || $("#percentage").val()<0) {

			$("#percentage").tips({
				side : 3,
				msg : '扣量百分比值在0~100',
				bg : '#AE81FF',
				time : 3
			});
			$("#percentage").focus();
			return false;
		}
		$("#ChannelForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="conf/doChannelAdd" name="ChannelForm" id="ChannelForm"
		method="post">
		<div id="zhongxin">
			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<tr>
					<th>应用名称：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="appId" id="appId" data-placeholder="应用名称"
						style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<c:forEach items="${appnames}" var="app">
								<option value="${app.appId }">${app.appName}</option>
							</c:forEach>
					</select>
				</tr>
				<tr>
					<th>渠道名称：</th>
					<td><input type="text" name="channelName" id="channelName"
						autocomplete="off" value="" maxlength="32"
						placeholder="请在这里填写渠道名称" title="渠道名称" /></td>
				</tr>
				<tr>
					<th>渠道号：</th>
					<td><input type="text" name="channelCode" id="channelCode"
						autocomplete="off" value="" maxlength="32"
						placeholder="渠道号" title="渠道号" /></td>
				</tr>
				<tr>
					<th>渠道简介：</th>
					<td>
					<textarea class="form-control limited" id="form-field-9"
							name="channelBriefing"  maxlength="128"
							placeholder="请在这里输入渠道简介" title="渠道简介"></textarea>
							</td>
				</tr>
				<tr>
					<th>渠道所有者：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="channelUser" id="channelUser" data-placeholder="渠道所有者"
						style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<c:forEach items="${users}" var="cuser">
								<option value="${cuser.id }">${cuser.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>扣量百分比：</th>
					<td><input type="text" name="percentage" id="percentage"
						autocomplete="off" value="0" maxlength="3"
						placeholder="请在这里填写扣量百分比" title="扣量百分比" /></td>
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