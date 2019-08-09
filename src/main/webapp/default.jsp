<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<title>网络传真-default</title>

<style type="text/css">
	body {
		font-family: arial;
		font-size: 9pt;
	}
	tr {
		font-family: "Verdana", "Arial", "Helvetica", "sans-serif", "";
		font-size: 9pt;
	}
	a {
		text-decoration: none;
		line-height: 1.5;
		color:#000000;
		font-family: "宋体";
		font-size: 9pt;
	}
</style>
</head>
<body text="#000000" topmargin="0" bgcolor="#ffffff">

<div id="ttt">
	<table width="100%" align="center" border="0" cellSpacing="0" cellPadding="1">
		<c:forEach items="${articleExtList }" var="articleExt">
			<tr>
				<td width="8" height="20" vAlign="top"><img src="${pageContext.request.contextPath}/static/images/jt03.png" valign="top"/></td>
				<td height="25"  background="${pageContext.request.contextPath}/static/images/listbg01.gif" style="padding-top:4px;background-repeat: repeat-x;background-position-x: left;background-position-y: bottom;">
					<a title="${articleExt.title }" href="${pageContext.request.contextPath}/article/viewDetail/${articleExt.id}.html" target="_blank">
						<c:if test="${fn:length(articleExt.title)>14}">${fn:substring(articleExt.title,0,14)}...</c:if>
						<c:if test="${fn:length(articleExt.title)<=14}">${articleExt.title}</c:if>
					</a>
				</td>
				<td align="right" background="${pageContext.request.contextPath}/static/images/listbg01.gif" style="padding-top:4px;background-repeat: repeat-x;background-position-x: left;background-position-y: bottom;">
					<nobr>
						<c:choose>
							<c:when test="${articleExt.diff <= 2 &&  articleExt.diff>= 0}">
								<img height="14" src="${pageContext.request.contextPath}/static/images/new.gif" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${articleExt.pubTime}" pattern="M-d" type="date" dateStyle="short" /> 
							</c:otherwise>
						</c:choose>
					</nobr>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>