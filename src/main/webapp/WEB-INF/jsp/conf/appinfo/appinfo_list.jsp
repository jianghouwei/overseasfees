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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<form action="conf/apply" method="post" name="applyInfoForm"
						id="applyInfoForm">
						<shiro:hasPermission name="conf:applyinfo:add">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top; text-align: right;"><a
										class="btn btn-small btn-success" onclick="add();">创建</a></td>
								</tr>
							</table>
						</shiro:hasPermission>
						<!-- 检索  -->
						<shiro:hasPermission name="conf:applyinfo:query">
							<table>
								<tr>
									<td style="vertical-align: top;"><select
										class="chzn-select" name="appId" id="appId"
										data-placeholder="应用名称"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">全部</option>
											<c:forEach items="${appnames}" var="name">
												<option value="${name.appId }">${name.appName}</option>
											</c:forEach>
									</select></td>

									<td style="vertical-align: top;"><select
										class="chzn-select" name="appUser" id="appUser"
										data-placeholder="应用所有者"
										style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">全部</option>
											<c:forEach items="${users}" var="user">
												<option value="${user.id }">${user.name}</option>
											</c:forEach>
									</select>
									</td>
									<td><span class="input-icon"> <input
											autocomplete="off" id="nav-search-input" type="text"
											name="typeName" value="" placeholder="这里输入关键词 " /> <i
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
									<th>应用名称</th>
									<th>应用ID</th>
									<th>应用所有者</th>
									<th>应用推广渠道名称</th>
									<th><i class="icon-time"></i>创建时间</th>
									<th><i class="icon-time"></i>更新时间</th>
									<shiro:hasAnyPermission
										name="conf:applyinfo:edit,conf:applyinfo:del,conf:applyinfo:view">
										<th class="center">操作</th>
									</shiro:hasAnyPermission>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty appList}">
										<c:forEach items="${appList}" var="apply" varStatus="vs">
											<tr>
												<td class="center" style="width: 30px;"><label><input
														type='checkbox' name='ids' value="${apply.id }" /><span
														class="lbl"></span></label></td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td>${apply.appName}</td>
												<td>${apply.appId}</td>
												<td>${apply.name}</td>
												<td>${apply.channelName}</td>
												<td><fmt:formatDate value="${apply.createTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${apply.updateTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<shiro:hasAnyPermission
													name="conf:applyinfo:edit,conf:applyinfo:del,conf:applyinfo:view">
													<td style="width: 60px;">
														<div class='hidden-phone visible-desktop btn-group'>
															<shiro:hasPermission name="conf:applyinfo:edit">
																<a class='btn btn-mini btn-info' title="编辑"
																	onclick="editUserType(${apply.id });"><i
																	class='icon-edit'>编辑</i></a>
															</shiro:hasPermission>
															<shiro:hasPermission name="conf:applyinfo:del">
																<a class='btn btn-mini btn-danger' title="删除"
																	onclick="delUserType(${apply.id}, '${apply.appName}');"><i
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
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript" src="static/js/date.js"></script>
		<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
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
			$("#applyInfoForm").submit();
		}
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="创建用户类型";
			 diag.URL = '<%=basePath%>conf/toApplyAdd';
			 diag.Width = 480;
			 diag.Height = 240;
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
			 diag.Title ="用户修改";
			 diag.URL = '<%=basePath%>conf/toApplyEdit?id='+id;
			 diag.Width = 480;
			 diag.Height = 240;
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
					var url = "<%=basePath%>conf/doApplyDel?id=" + id
							+ "&tm=" + new Date().getTime();
					$.get(url, function(data) {
						nextPage('${page.currentPage }');
					});
				}
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

