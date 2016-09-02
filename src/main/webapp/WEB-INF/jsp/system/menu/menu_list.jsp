<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<%@ include file="../admin/top.jsp"%>
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />

<script type="text/javascript">
	$(top.hangge());	
	
	//新增
	function addmenu(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增一级菜单";
		 diag.URL = '<%=basePath%>system/tofirstLevel';
		 /* diag.Width = 320;
		 diag.Height = 480; */
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	
	//创建子菜单
	function addChildren(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="创建子菜单";
		 diag.URL ='<%=basePath%>system/toChildrenLevel?levelPid='+menuId;
		/*  diag.Width = 320;
		 diag.Height = 480; */
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	

	//修改
	function editmenu(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑菜单";
		 diag.URL = '<%=basePath%>system/toEditMenu?menuId='+menuId;
		 /* diag.Width = 320;
		 diag.Height = 480; */
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	function delmenu(menuId,isParent){
		var flag = false;
		if(isParent){
			if(confirm("确定要删除该菜单吗？其下子菜单将一并删除！")){
				flag = true;
			}
		}else{
			if(confirm("确定要删除该菜单吗？")){
				flag = true;
			}
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>system/delMenu?menuId=" + menuId + "&guid="+ new Date().getTime();
			$.get(url, function(data) {
				top.jzts();
				document.location.reload();
			});
		}
	}
</script>
</head>

<body>
	<div class="page_and_btn">
		<shiro:hasPermission name="system:rources:addf">
		<div style="vertical-align: top; text-align: right;">
			&nbsp;&nbsp;<a class="btn btn-small btn-success" onclick="addmenu();">创建一级菜单</a>
		</div>
		</shiro:hasPermission>
	</div>
	<table id="table_report"
		class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="center" style="width: 50px;">序号</th>
				<th class='center'>名称</th>
				<th class='center'>标识</th>
				<th class='center'>资源路径</th>
				<th class='center'>排序</th>
				<th class='center'>描述</th>
				<shiro:hasAnyPermission name="system:rources:addc,system:rources:edit,system:rources:del">
				<th class='center'>操作</th>
				</shiro:hasAnyPermission>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty menuList}">
				<c:set var="index" value="0" scope="request" />
				<!-- 自增序号，注意scope-->
				<c:set var="level" value="0" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:set var="str" value="|--" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:import url="__r.jsp" />
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="100">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>