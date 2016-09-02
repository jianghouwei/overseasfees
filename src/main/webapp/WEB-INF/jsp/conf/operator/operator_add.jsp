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

		if ($("#country").val() == "") {

			$("#country").tips({
				side : 3,
				msg : '请输入国家',
				bg : '#AE81FF',
				time : 3
			});
			$("#country").focus();
			return false;
		}
		if ($("#operator").val() == "") {

			$("#operator").tips({
				side : 3,
				msg : '请输入运营商',
				bg : '#AE81FF',
				time : 3
			});
			$("#operator").focus();
			return false;
		}
		if ($("#shortCode").val() == "") {

			$("#shortCode").tips({
				side : 3,
				msg : '请输入计费短号',
				bg : '#AE81FF',
				time : 3
			});
			$("#shortCode").focus();
			return false;
		}
		if ($("#localPrice").val() == "") {

			$("#localPrice").tips({
				side : 3,
				msg : '请输入当地价格',
				bg : '#AE81FF',
				time : 3
			});
			$("#localPrice").focus();
			return false;
		}
		if ($("#mcc").val() == "") {

			$("#mcc").tips({
				side : 3,
				msg : '请输入MCC',
				bg : '#AE81FF',
				time : 3
			});
			$("#mcc").focus();
			return false;
		}
		if ($("#mnc").val() == "") {

			$("#mnc").tips({
				side : 3,
				msg : '请输入mnc',
				bg : '#AE81FF',
				time : 3
			});
			$("#mnc").focus();
			return false;
		}
		if ($("#keyword").val() == "") {

			$("#keyword").tips({
				side : 3,
				msg : '请输入keyword',
				bg : '#AE81FF',
				time : 3
			});
			$("#keyword").focus();
			return false;
		}
		if ($("#priceService").val() == "") {

			$("#priceService").tips({
				side : 3,
				msg : '请输入计费服务提供商',
				bg : '#AE81FF',
				time : 3
			});
			$("#priceService").focus();
			return false;
		}

		$("#usertypeaddForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="conf/doOperatorAdd" name="usertypeaddForm"
		id="usertypeaddForm" method="post">
		<div id="zhongxin">
			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<tr>
					<th>国家：</th>
					<td><input type="text" name="country" id="country"
						autocomplete="off" value="" maxlength="32" placeholder="请在这里国家"
						title="国家" /></td>
				</tr>
				<tr>
					<th>运营商：</th>
					<td><input type="text" name="operator" id="operator"
						autocomplete="off" value="" maxlength="32" placeholder="请在这里运营商"
						title="运营商" /></td>
				</tr>
				<tr>
					<th>计费短号：</th>
					<td><input type="text" name="shortCode" id="shortCode"
						autocomplete="off" value="" maxlength="32" placeholder="请在这里计费短号"
						title="计费短号" /></td>
				</tr>
				<tr>
					<th>当地价格：</th>
					<td><input type="text" name="localPrice" id="localPrice"
						autocomplete="off" value="" maxlength="32" placeholder="请在这里当地价格"
						title="当地价格" /></td>
				</tr>
				<tr>
					<th>MCC：</th>
					<td><input type="text" name="mcc" id="mcc" autocomplete="off"
						value="" maxlength="32" placeholder="请在这里MCC" title="MCC" /></td>
				</tr>
				<tr>
					<th>MNC：</th>
					<td><input type="text" name="mnc" id="mnc" autocomplete="off"
						value="" maxlength="32" placeholder="请在这里MNC" title="MNC" /></td>
				</tr>
				<tr>
					<th>KeyWord：</th>
					<td><input type="text" name="keyword" id="keyword"
						autocomplete="off" value="" maxlength="32"
						placeholder="请在这里KeyWord" title="KeyWord" /></td>
				</tr>
				<tr>
					<th>计费服务提供商：</th>
					<td><input type="text" name="priceService" id="priceService"
						autocomplete="off" value="" maxlength="32"
						placeholder="请在这里计费服务提供商" title="计费服务提供商" /></td>
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