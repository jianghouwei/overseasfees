<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
</head>

<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
</script>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<form action="tics/userprice" method="post" name="operatorForm"
						id="operatorForm">
						<shiro:hasPermission name="tics:userprice:export">
						<table style="width: 100%;">
							<tr>
								<td style="vertical-align: top; text-align: right;"><a
									id="exprot" onclick="exprot();" class="btn btn-small btn-success">导出</a>
							</tr>
						</table>
						</shiro:hasPermission>
						<!-- 检索  -->
						<shiro:hasPermission name="tics:userprice:query">
							<table>
								<tr>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="country" id="country"
										data-placeholder="国家"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">-国家-</option>
											<c:forEach items="${countrys}" var="country">
												<option value="${country.code }">${country.name}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="appId" id="appId"
										data-placeholder="应用名称"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">-应用名称-</option>
											<c:forEach items="${appnames}" var="app">
												<option value="${app.appId}">${app.appName}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="channelId" id="channelId"
										data-placeholder="-渠道名称-"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">渠道名称</option>
											<c:forEach items="${channels}" var="channel">
												<option value="${channel.code }">${channel.name}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="priceNo" id="priceNo"
										data-placeholder="-计费名称-"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">渠道名称</option>
											<c:forEach items="${pricesinfo}" var="prices">
												<option value="${prices.code }">${prices.name}</option>
											</c:forEach>
									</select></td>
									<td><input class="date-picker" name="dateStart"
										id="dateStart" type="text" data-date-format="yyyy-mm-dd"
										placeholder="开始日期" /></td>
									<td><input class="date-picker" name="dateEnd"
										name="dateEnd" type="text" data-date-format="yyyy-mm-dd"
										placeholder="结束日期" /></td>
									<td><span class="input-icon"> <input
											autocomplete="off" id="nav-search-input" type="text"
											name="imei" id="imei" placeholder="这里输入关键词imei" /> <i
											id="nav-search-icon" class="icon-search"></i>
									</span></td>
									<td style="vertical-align: top;"><button
											class="btn btn-mini btn-light" onclick="search();" title="检索">
											<i id="nav-search-icon" class="icon-search"></i>
										</button></td>
								</tr>
							</table>
						</shiro:hasPermission>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th>
									<th>序号</th>
									<th><i class="icon-time"></i>创建时间</th>
									<th>应用名称</th>
									<th>应用ID</th>
									<th>IMEI</th>
									<th>IMSI</th>
									<th>渠道名称</th>
									<th>渠道号</th>
									<th>计费点名称</th>
									<th>计费ID</th>
									<th>上行短信序号</th>
									<th>当地价格</th>
									<th>计费UID</th>
									<th>计费交易时间</th>
									<th>运营商</th>
									<th>网络类型</th>
									<th>终端号码</th>
									<th>计费指令</th>
									<th>计费短号</th>
									<th>计费国家码</th>
									<th>服务名称</th>
									<th>计费状态</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty priceList}">
										<c:forEach items="${priceList}" var="prices" varStatus="vs">
											<tr>
												<td class="center" style="width: 30px;"><label><input
														type='checkbox' name='ids' value="${prices.id }" /> <span
														class="lbl"></span></label></td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td><fmt:formatDate value="${prices.createTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>${prices.appName}</td>
												<td>${prices.appId}</td>
												<td>${prices.imei}</td>
												<td>${prices.imsi}</td>
												<td>${prices.channelName}</td>
												<td>${prices.channelId}</td>
												<td>${prices.priceName}</td>
												<td>${prices.priceNo}</td>
												<td>${prices.moNo}</td>
												<td>${prices.localPrice}</td>
												<td>${prices.uid}</td>
												<td><fmt:formatDate value="${prices.date}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>${prices.operator}</td>
												<td>${prices.network}</td>
												<td>${prices.msn}</td>
												<td>${prices.msgF}</td>
												<td>${prices.shortCode}</td>
												<td>${prices.mcc}</td>
												<td>${prices.service}</td>
												<td>
													<c:if test="${prices.status == 0}">等待支付</c:if>
													<c:if test="${prices.status == 3}">发起支付</c:if>
													<c:if test="${prices.status == 4}">支付失效</c:if>
													<c:if test="${prices.status == -1}">支付失败</c:if>
													<c:if test="${prices.status == 1}">支付中</c:if>
													<c:if test="${prices.status == 2}">支付成功</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="10" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;">
										<div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">
											${page.pageStr}</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->
		</div>
	</div>
	<!--/#page-content-->
	<!--/.fluid-container#main-container-->
	<!--[if !IE]> -->
	<!-- <![endif]-->
	<!--[if IE]>
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<![endif]-->
	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document.write("<script src='assets/js/jquery.min.js'>"
						+ "<"+"/script>");
	</script>
	<!-- <![endif]-->

	<!--[if IE]>
	<script type="text/javascript">
	 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.jqGrid.min.js"></script>
	<!--jqGrid-->
	<script type="text/javascript">
		$(top.hangge());
		//检索
		function search() {
			top.jzts();
			var dateStart = $("dateStart").val().replace("-", "");
			var dateEnd = $("dateEnd").val().replace("-", "");
			alert(dateStart);
			alert(dateStart + dateStart);
			if (dateStart != "" && dateEnd != "") {
				if (dateStart > dateEnd.replace("-", "")) {
					$("#dateEnd").tips({
						side : 3,
						msg : '开始时间不能大于结束时间',
						bg : '#AE81FF',
						time : 3
					});
					$("#dateEnd").focus();
					return false;
				}
			}
			$("#operatorForm").submit();
		}

		//状态变更
		function exprot() {
			window.location.href = "tics/userprice/download?country="+$("#country").val()+
					"&appId="+$("#appId").val()+
					"&channelId="+$("#channelId").val()+
					"&priceNo="+$("#priceNo").val()+
					"&dateStart="+$("#dateStart").val()+
					"&dateEnd="+$("#dateEnd").val();
			
			return false;
		}
	</script>
	<script type="text/javascript">
		$(function() {

			//日期框
			$('.date-picker').datepicker();
			// 日期时间选择器

			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//复选框
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

