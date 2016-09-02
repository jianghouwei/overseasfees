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
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<form action="conf/bpoint" method="post" name="bpointForm"
						id="userTypeForm">
						<shiro:hasPermission name="conf:bpointinfo:add">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top; text-align: right;"><a
										class="btn btn-small btn-success" onclick="add();">创建</a></td>
								</tr>
							</table>
						</shiro:hasPermission>
						<!-- 检索  -->
						<shiro:hasPermission name="conf:bpointinfo:query">
							<table>
								<tr>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="appId" id="appId"
										data-placeholder="应用名称"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<c:forEach items="${appnames}" var="name">
												<option value="${name.appId }">${name.appName}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="priceService" id="priceService"
										data-placeholder="计费服务提供商"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<c:forEach items="${priceservices}" var="priceservice">
												<option value="${priceservice.code }">${priceservice.name}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="country" id="country"
										data-placeholder="国家"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<c:forEach items="${countrys}" var="country">
												<option value="${country.code }">${country.name}</option>
											</c:forEach>
									</select></td>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="operator" id="operator"
										data-placeholder="运营商"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<c:forEach items="${operators}" var="operator">
												<option value="${operator.code }">${operator.name}</option>
											</c:forEach>
									</select></td>
									<td><span class="input-icon"> <input
											autocomplete="off" id="nav-search-input" type="text"
											name="typeName" value="" placeholder="这里输入关键词" /> <i
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
									<th class="center">序号</th>
									<th class="center">计费点名称</th>
									<th class="center">计费点ID</th>
									<th class="center">计费点类型</th>
									<th class="center">应用名称</th>
									<th class="center">计费服务提供商</th>
									<th class="center">国家</th>
									<th class="center">运营商</th>
									<th class="center">当地价格</th>
									<th class="center">是否提示</th>
									<shiro:hasAnyPermission name="conf:bpointinfo:status">
										<th class="center">状态</th>
									</shiro:hasAnyPermission>
									<th class="center"><i class="icon-time"></i>创建时间</th>
									<th class="center"><i class="icon-time"></i>更新时间</th>
									<shiro:hasAnyPermission
										name="conf:bpointinfo:view,conf:bpointinfo:del,conf:bpointinfo:edit">
										<th class="center">操作</th>
									</shiro:hasAnyPermission>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty priceList}">
										<c:forEach items="${priceList}" var="price" varStatus="vs">
											<tr>
												<td class="center" style="width: 30px;"><label><input
														type='checkbox' name='ids' value="${price.id }" /><span
														class="lbl"></span></label></td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td>${price.priceName}</td>
												<td>${price.priceId}</td>
												<th class="center">
												<c:if test="${price.priceType == 1}">固定</c:if>
												<c:if test="${price.priceType == 2}">自适应</c:if>
												</th>
												<td class="center">${price.appName}</td>
												<td class="center">${price.priceService}</td>
												<td class="center">${price.country}</td>
												<td class="center">${price.operator}</td>
												<td class="center">
												<c:if test="${price.priceType == 1}">${price.localPrice}</c:if>
												<c:if test="${price.priceType == 2}">${price.globalPrice}</c:if>
												</td>
												<td class="center"><c:if test="${price.isTip == 1}">是</c:if>
													<c:if test="${price.isTip == 2}">否</c:if></td>
												<shiro:hasAnyPermission name="conf:bpointinfo:status">
													<td class="center"><label> <input
															id="status_${price.id }" name="switch-field-1"
															class="ace-switch ace-switch-7"
															onchange="chStatus(${price.id });" type="checkbox"
															<c:if test="${price.status == 1}">checked="checked"</c:if> />
															<span class="lbl"></span>
													</label></td>
												</shiro:hasAnyPermission>
												<td class="center"><fmt:formatDate
														value="${price.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td class="center"><fmt:formatDate
														value="${price.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<shiro:hasAnyPermission
													name="conf:bpointinfo:view,conf:bpointinfo:del,conf:bpointinfo:edit">
													<td style="width: 60px;">
														<div class='hidden-phone visible-desktop btn-group'>
															<shiro:hasPermission name="conf:bpointinfo:edit">
																<a class='btn btn-mini btn-info' title="编辑"
																	onclick="editUserType(${price.id });"><i
																	class='icon-edit'>编辑</i></a>
															</shiro:hasPermission>
															<shiro:hasPermission name="conf:bpointinfo:del">
																<a class='btn btn-mini btn-danger' title="删除"
																	onclick="delUserType(${price.id}, '${price.priceName}');"><i
																	class='icon-trash'>删除</i></a>
															</shiro:hasPermission>
														</div>
													</td>
												</shiro:hasAnyPermission>
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
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
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
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.jqGrid.min.js"></script>
	<!--jqGrid-->
	<script type="text/javascript">
		$(top.hangge());
		//检索
		function search(){
			top.jzts();
			$("#bpointForm").submit();
		}
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="创建计费点";
			 diag.URL = '<%=basePath%>conf/toBpointAdd';
			/*diag.Width = 480;
			 diag.Height = 240; */
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUserType(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="创建计费点";
			 diag.URL = '<%=basePath%>conf/toBpointEdit?id='+id;
			/*  diag.Width = 480;
			 diag.Height = 240; */
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage('${page.currentPage }');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUserType(id , msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>conf/doBpointDel?id=" + id
							+ "&tm=" + new Date().getTime();
					$.get(url, function(data) {
						nextPage('${page.currentPage }');
					});
				}
			});
		}
		//状态变更
		function chStatus(id){
			top.jzts();
			var status =   2;
			if($('#status_'+id).is(':checked')) {
				status = 1;
			}else{
				status = 2;
			}
		   var url = "<%=basePath%>conf/changeStatus?id=" + id+"&status="+status +"&tm=" + new Date().getTime();
			    $.get(url, function(data) {
					nextPage('${page.currentPage }');
			}); 
		}
		
	</script>

	<script type="text/javascript">
		$(function() {
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

