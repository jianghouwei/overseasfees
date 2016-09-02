<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:forEach var="cur" items="${menuList}" varStatus="vs">
	<c:set var="index" value="${index + 1}" scope="request" />
	<!-- 每一次循环，index+1 -->
	<tr>
		<td align="center" nowrap="nowrap">${index}</td>
		<td align="center" nowrap="nowrap">${str} ${cur.name}</td>
		<td align="center" nowrap="nowrap">${cur.code}</td>
		<td align="center" nowrap="nowrap">${cur.url}</td>
		<td align="center" nowrap="nowrap">${cur.leveSort}</td>
		<td align="center" nowrap="nowrap">${cur.msg}</td>
		<shiro:hasAnyPermission name="system:rources:addc,system:rources:edit,system:rources:del">
		<td align="center" nowrap="nowrap">
		<shiro:hasPermission name="system:rources:addc">
			<a class='btn btn-mini btn-purple' title="创建子菜单" onclick="addChildren('${cur.id }')" ><i class='icon-ok'>创建子菜单</i></a>
		</shiro:hasPermission>
		<shiro:hasPermission name="system:rources:edit">
			<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${cur.id }')" ><i class='icon-edit'>编辑</i></a>
		</shiro:hasPermission>
		<shiro:hasPermission name="system:rources:del">
			<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${cur.id }',true)"><i class='icon-trash'>删除</i></a>
		</shiro:hasPermission>
		</td>
		</shiro:hasAnyPermission>
	</tr>
	<!-- 如果有childen -->
	<c:if test="${fn:length(cur.subMenu) > 0}">
		<!-- 循环一次子列表，level+1 -->
		<c:set var="level" value="${level + 1}" scope="request" />
		<c:set var="str" scope="request">${str}---</c:set>
		<!-- 注意此处，子列表覆盖treeList，在request作用域 -->
		<c:set var="menuList" value="${cur.subMenu}" scope="request" />
		<c:import url="__r.jsp" />
	</c:if>
</c:forEach>
<c:set var="level" value="${level - 1}" scope="request" />
<c:set var="str" value="|--" scope="request" />
<!-- 退出时，level-1 -->
