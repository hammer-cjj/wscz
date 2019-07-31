<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章详情</title>
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
		font-size:18px;
		background-color: #999999;
	}
</style>
<script type="text/javascript">

</script>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
	<table width="700px" align="center" bgcolor="#ffffff">
		<tr>
			<c:if test="${article.signFlag == 1 }">
				<td align="left"><a href="${pageContext.request.contextPath }/signDetail/list/${article.id }.html" target="_blank">文章签收</a></td>
			</c:if>
			<c:if test="${article.signFlag == 0 }">
				<td height="10px"></td>
			</c:if>
		</tr>
	</table>
</div>
<div align="center">
	<table width="700px" height="100%" align="center" bgcolor="#ffffff">
		<tr><td height="10px"></td></tr>
		<tr>
			<td valign="top">
				<table width="600px" align="center" bordercolor="#000000" bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<!-- title start -->
							<table width="660px" align="center" border="0">
								<tr>
									<td align="center"><img src="${pageContext.request.contextPath}/static/images/title.gif" /></td>
								</tr>
							</table>
							
							<p>
								<table width="600px" align="center" border="0" cellpadding="0" cellspacing="0">
									<tr valign="top">
										<td width="50%" align="left"><font size="4">舟公网传${article.gwh }</font></td>
										<td width="50%">
											<div align="right">
												<font size="4">签发人:</font>
												<font face="宋体" size="4">${article.signFaPerson }</font>
											</div>
										</td>
									</tr>
									<tr><td colspan="2"><hr width="600px" size="2" align="center" color="#000000" noshade=""/></td></tr>
									<tr valign="top">
										<td align="left"><font face="宋体" size="4">等级:</font><font face="宋体" size="4">
											<c:if test="${article.djFlag == 0 }">平急</c:if>
											<c:if test="${article.djFlag == 1 }">加急</c:if>
											<c:if test="${article.djFlag == 2 }">特急</c:if>
											<c:if test="${article.djFlag == 3 }">特提</c:if>
										</font></td>
										<td align="right"><font face="宋体" size="4">发送时间:</font><font face="宋体" size="4" id="pubTime"><fmt:formatDate value="${article.pubTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /></font></td>
									</tr>
									<tr><td colspan="2"><hr width="600px" size="2" align="center" color="#000000" noshade=""/></td></tr>
									<tr><td colspan="2" align="left"><font face="宋体" size="4">抄送:</font><font face="宋体" size="4">${chaoSongDept }</font></td></tr>
									<tr><td colspan="2"><hr width="600px" size="2" align="center" color="#000000" noshade=""/></td></tr>
									<%-- <tr>
										<td height="1" colspan="2">
											<br/>
											<p align="center"><font face="黑体" size="5">${article.title }</font></p>
										</td>
									</tr> --%>
								</table>
								<!-- title end -->
								
								<!-- content start -->
								<table width="600px" align="center" border="0">
									<tr>
										<td>
											${article.content }
										</td>
									</tr>
								</table>
								<!-- content end -->
							</p>
							
						</td>
					</tr>
				</table>
			
				<!-- foot -->
				<table width="600px" align="center" border="0">
					<tr><td colspan="3"><hr width="600px" size="2" align="center" color="#000000"  noshade=""/></td></tr>
					<tr>
						<td width="34%" align="left"><font face="宋体" size="4">承办单位:</font><font face="宋体" size="4">${article.chengBanDept }</font></td>
						<td width="33%"></td>
						<td width="33%" align="right"><font face="宋体" size="4">发布者:</font><font face="宋体" size="4">${article.author }</font></td>
					</tr>
					<tr>
						<td align="right" colspan="6">总共阅读: ${article.hit } 次</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>