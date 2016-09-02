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
				msg : '请选应用',
				bg : '#AE81FF',
				time : 3
			});
			$("#appId").focus();
			return false;
		}
		if ($("#priceName").val() == "") {

			$("#priceName").tips({
				side : 3,
				msg : '请输入计费点名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#priceName").focus();
			return false;
		}
		
		if ($("#priceBriefing").val() == "") {
			$("#priceBriefing").tips({
				side : 3,
				msg : '请输入计费点简介',
				bg : '#AE81FF',
				time : 3
			});
			$("#priceBriefing").focus();
			return false;
		}
		//计费点类型
		var priceType = $("input[name='priceType']:checked").val();
		if(priceType == ""){
			$("#input:radio[name='priceType']").tips({
				side : 3,
				msg : '请选择计费类型',
				bg : '#AE81FF',
				time : 3
			});
			$("#input:radio[name='priceType']").focus();
			return false;
		}else if (priceType ==1){
			//固定
			if($("#priceService").val() == ""){
				$("#priceService").tips({
					side : 3,
					msg : '请输入全球价格',
					bg : '#AE81FF',
					time : 3
				});
				$("#priceService").focus();
				return false;
			}
			if($("#country").val() == ""){
				$("#country").tips({
					side : 3,
					msg : '请选择国家',
					bg : '#AE81FF',
					time : 3
				});
				$("#country").focus();
				return false;
			}
			if($("#operator").val() == ""){
				$("#operator").tips({
					side : 3,
					msg : '请选择运营商',
					bg : '#AE81FF',
					time : 3
				});
				$("#operator").focus();
				return false;
			}
			if($("#qcId").val() == ""){
				$("#qcId").tips({
					side : 3,
					msg : '请选择当地价格',
					bg : '#AE81FF',
					time : 3
				});
				$("#qcId").focus();
				return false;
			}
		}else{
			//自适应
			if($("#globalPrice").val() == ""){
				$("#globalPrice").tips({
					side : 3,
					msg : '请输入全球价格',
					bg : '#AE81FF',
					time : 3
				});
				$("#globalPrice").focus();
				return false;
			}
			//必须有额外参数
			if($("input[name='isParam']:checked").val() != 1){
					$("#tr_isParam").tips({
						side : 3,
						msg : '额外参数必须有，请选择【是】',
						bg : '#AE81FF',
						time : 3
					});
					$("#tr_isParam").focus();
					return false;
			}
			//额外参数必须填写
			if($("#params").val() == ""){
				$("#params").tips({
					side : 3,
					msg : '请选择额外参数',
					bg : '#AE81FF',
					time : 3
				});
				$("#params").focus();
				return false;
			}
		}
		if($("input[name='isParam']:checked").val() == 1){
			if($("#params").val() == ""){
				$("#params").tips({
					side : 3,
					msg : '请选择额外参数',
					bg : '#AE81FF',
					time : 3
				});
				$("#params").focus();
				return false;
			}
		}
		
		$("#usertypeaddForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="conf/doBpointAdd" name="usertypeaddForm"
		id="usertypeaddForm" method="post">
		<div id="zhongxin">
			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<tr>
					<th>应用名称：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="appId" id="appId" data-placeholder="应用名称"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
							<c:forEach items="${appnames}" var="name">
								<option value="${name.appId }">${name.appName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>计费点名称：</th>
					<td><input type="text" name="priceName" id="priceName"
						autocomplete="off" value="" maxlength="128"
						placeholder="请在这里计费点名称" title="计费点名称" /></td>
				</tr>
				<tr>
					<th>计费点功能简介：</th>
					<td><textarea class="form-control limited" id="form-field-9"
							name="priceBriefing" maxlength="128" placeholder="请在这里计费点功能简介"
							title="计费点功能简介"></textarea></td>
				</tr>
				<tr id="tr_priceType">
					<th>计费点类型：</th>
					<td>
					<input name="priceType" type="radio" class="ace" checked="checked"
					value="1"/> 
					<span class="lbl">固定</span> 
				    <input name="priceType" type="radio" class="ace" 
				    value="2" /> 
				    <span class="lbl">自适应</span></td>
				</tr>
				<tr id="tr_priceService">
					<th>计费服务提供商：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="priceService" id="priceService" data-placeholder="计费服务提供商"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
							<c:forEach items="${priceservices}" var="priceservice">
								<option value="${priceservice.code }">${priceservice.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr id="tr_country">
					<th>国家：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="country" id="country" data-placeholder="国家"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
					</select></td>
				</tr>
				<tr id="tr_operator">
					<th>运营商：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="operator" id="operator" data-placeholder="运营商"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
					</select></td>
				</tr>
				<tr id="tr_localPrice">
					<th>当地价格：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="qcId" id="qcId" data-placeholder="当地价格"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
					</select></td>
				</tr>
				<tr id="tr_globalPrice">
					<th>全球价格：</th>
					<td style="vertical-align: top;"><input type="text"
						name="globalPrice" id="globalPrice" autocomplete="off" value=""
						maxlength="128" placeholder="请在这里输入全球价格" title="全球价格" /></td>
				</tr>
				<tr>
					<th>是否显示提示框：</th>
					<td><input name="isTip" type="radio" class="ace" value="1"
						checked="checked" /> <span class="lbl">是</span> <input
						name="isTip" type="radio" class="ace" value="2" /> <span
						class="lbl">否</span></td>
				</tr>
				<tr id="tr_isParam">
					<th>是否有额外参数：</th>
					<td><input name="isParam" type="radio" class="ace" value="1" />
						<span class="lbl">是</span> <input name="isParam" type="radio"
						class="ace" value="2" checked="checked" /> <span class="lbl">否</span></td>
				</tr>
				<tr id="tr_param">
					<th>额外参数：</th>
					<td style="vertical-align: top;"><select class="chzn-select"
						name="params" id="params" data-placeholder="应用名称"
						style="vertical-align: top; width: 120px;">
							<option value="">-请选择-</option>
							<option value="1">向上原则</option>
							<option value="2">向下原则</option>
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
		//额外参数默认不显示
		$("#tr_param").hide();
		//全球价格不显示
		$("#tr_globalPrice").hide();
		//计费类型change 事件
		$("input:radio[name='priceType']").change(function() {
			var priceType = $("input[name='priceType']:checked").val();
			if (priceType == 2) {
				//自适应
				$("#tr_priceService").hide();//计费服务商
				$("#tr_country").hide();//国家
				$("#tr_operator").hide();//运营商
				$("#tr_localPrice").hide();//当地价格
				$("#tr_globalPrice").show();//
			} else {
				//固定
				$("#tr_priceService").show();//计费服务商
				$("#tr_country").show();//国家
				$("#tr_operator").show();//运营商
				$("#tr_localPrice").show();//当地价格
				$("#tr_globalPrice").hide();//
			}
		});

		//额外参数change 事件
		$("input:radio[name='isParam']").change(function() {
			var priceType = $("input[name='isParam']:checked").val();
			if (priceType == 2) {
				//无额外参数
				$("#tr_param").hide();//
			} else {
				//有额外参数
				$("#tr_param").show();//
			}
		});

		/*
		 * 计费选择联动事件
		 */
		// 计费服务商===> 决定国家
		$("#priceService").change(function() {
			$("#country").html("");
			var priceService = $('#priceService').attr("value");
            var url ="<%=basePath%>conf/getCountry?priceService=" + priceService;
            $.get(url, function(data) {
            	var jsonObj =  eval('(' + data + ')');
            	$("#country").append("<option value=''>-请选择-</option>");
            	for(var p in jsonObj){
            		var code = (jsonObj[p].code).replace(" ", "_");
            		$("#country").append("<option value=" + code + ">" + jsonObj[p].name + "</option>");
            	}
            	$("#country").trigger("liszt:updated");
            	$("#country").chosen(); 
			});
		});
		//计费服务商+国家-决定运营商
		$("#country").change(function() {
			$("#operator").html("");
            var priceService = $('#priceService').attr("value");
            var country = $('#country').attr("value");
            var url ="<%=basePath%>conf/getOperator?priceService=" + priceService+"&country="+country;
            $.get(url, function(data) {
            	var jsonObj =  eval('(' + data + ')');
            	$("#operator").append("<option value='' >-请选择-</option>");
            	for(var p in jsonObj){
            		var code = (jsonObj[p].code).replace(" ", "_");
            		$("#operator").append("<option value=" + code + ">" + jsonObj[p].name + "</option>");
            	}
            	$("#operator").trigger("liszt:updated");
            	$("#operator").chosen(); 
			});
		});
		
		//计费服务商+国家+运营商====> 决定价格
		$("#operator").change(function() {
			$("#qcId").html("");
            var priceService = $('#priceService').attr("value");
            var country = $('#country').attr("value");
            var operator = $('#operator').attr("value");
            var url ="<%=basePath%>conf/getLocalPrice?priceService="
							+ priceService + "&country=" + country
							+ "&operator=" + operator;
					$.get(url, function(data) {
						var jsonObj = eval('(' + data + ')');
						$("#qcId").append(
								"<option value='' >-请选择-</option>");
						for ( var p in jsonObj) {
							var code = (jsonObj[p].code);
							$("#localPrice").append(
									"<option value=" + code + ">"
											+ jsonObj[p].name + "</option>");
						}
						$("#qcId").trigger("liszt:updated");
						$("#qcId").chosen();
					});
				});
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