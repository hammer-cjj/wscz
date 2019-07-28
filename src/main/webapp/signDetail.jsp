<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签收详情</title>
<!-- Bootstrap -->
<%-- <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" > --%>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<%-- <script src="${pageContext.request.contextPath}/static/jquery-3.4.1/jquery-3.4.1.min.js"></script> --%>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7/js/bootstrap.min.js"></script> --%>
<style type="text/css">
	body {
		font-family:"宋体";
	}
	td {
		font-size: 14px;
		word-break:keep-all;
		padding:5px;
	}
</style>
</head>

<body>
<h5 align="center">【${article.title}】的签收情况</h5>
<div align="center">
	<table width="746px" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border-collapse: collapse;">
		<tr>
			<td><div align="center"><strong>签收单位</strong></div></td>
			<td><div align="center"><strong>签收人</strong></div></td>
			<td><div align="center"><strong>签收时间</strong></div></td>
			<td><div align="center"><strong>签收人IP</strong></div></td>
		</tr>
		<c:forEach items="${signDetailList }" var="signDetail" varStatus="status">
			<c:if test="${status.count % 2 != 0}">
				<tr>
					<td><div align="center">${signDetail.signDeptName }</div></td>
					<td><div align="center">${signDetail.signShouPerson }</div></td>
					<td><div align="center"><fmt:formatDate value="${signDetail.signDate}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /></div></td>
					<td><div align="center">${signDetail.signIp }</div></td>
				</tr>
			</c:if>
			<c:if test="${status.count % 2 == 0 }">
				<tr bgcolor="#f5faff">
					<td><div align="center">${signDetail.signDeptName }</div></td>
					<td><div align="center">${signDetail.signShouPerson }</div></td>
					<td><div align="center"><fmt:formatDate value="${signDetail.signDate}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /></div></td>
					<td><div align="center">${signDetail.signIp }</div></td>
				</tr>
			</c:if>			
		</c:forEach>
	</table>
</div>
	
</body>
</html>