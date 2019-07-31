<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签收列表</title>
<!-- Bootstrap -->
<%-- <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" > --%>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7/js/bootstrap.min.js"></script> --%>
<style type="text/css">
	body {
		font-family:"宋体";
		font-size:18px;
	}
</style>
<script type="text/javascript">
	function checksubmit() {
		var signDeptName = $('input:radio[name="signDeptName"]:checked').val();
		var signShouPerson = document.getElementById("signShouPerson").value;
		if (signDeptName == null) {
			alert("请选择部门!");
			return false;
		}
		if (signShouPerson == null || signShouPerson == '') {
			alert("请输入签收人!");
			return false;
		}
		return true;
	}
</script>
</head>

<body>
<div align="center">
	<h5>【${article.title}】的签收情况</h5>
	<br/>
	<table width="100%" align="center">
		<form method="post" name="form1" onsubmit="return checksubmit()" action="${pageContext.request.contextPath}/signDetail/sign">
			<tr>
				<td>
					<table width="85%" align="center" borderColor="#000000" style="border-collapse: collapse;" border="1" cellpadding="0" cellspacing="0">
						<tr height="20px">
							<td ><strong>签收单位</strong></td>
							<td ><strong>签收状态</strong></td>
							<td ><strong>签收单位</strong></td>
							<td ><strong>签收状态</strong></td>
						</tr>
						<tr height="20px">
							<c:forEach items="${signDetailList }" var="signDetail" varStatus="status">
								<c:if test="${status.count % 2 != 0 }">
									<td align="left">
										<input type="radio" value="${signDetail.signDeptName }" name="signDeptName" />${signDetail.signDeptName }</td>
									<td>
										<div align="center">
											<c:if test="${signDetail.signFlag == 0 }"><font color="#ff0000">未签收</font></c:if>
											<c:if test="${signDetail.signFlag == 1 }"><font color="#0000ff">已签收</font></c:if>
										</div>
									</td>
									<c:if test="${status.last }">
										<td></td>
										<td></td>
									</c:if>
								</c:if>
								<c:if test="${status.count % 2 == 0 }">
									<td align="left"><input type="radio" value="${signDetail.signDeptName }" name="signDeptName" />${signDetail.signDeptName }</td>
									<td>
										<div align="center">
											<c:if test="${signDetail.signFlag == 0 }"><font color="#ff0000">未签收</font></c:if>
											<c:if test="${signDetail.signFlag == 1 }"><font color="#0000ff">已签收</font></c:if>
										</div>
									</td>
									</tr>
									<tr height="10px">
								</c:if>	
							</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td height="20px"><input type="hidden" value="${article.id }" name="articleId" /></td></tr>
			<tr>
				<td>
					<table width="85%" align="center" bordercolor="#000000" style="border-collapse: collapse;" border="1" cellpadding="0" cellspacing="0">
						<td width="33%" height="30px">
							<div align="center" >签收人<input name="signShouPerson" id="signShouPerson" type="text" size="20" /><font color="red">*</font></div>
						</td>
						<td width="34%" height="30px">
							<div align="center"><input type="submit" name="Submit" value="确认签收" /></div>
						</td>
						<td width="34%" height="30px">
							<div align="center"><a href="${pageContext.request.contextPath}/signDetail/detail/${article.id}.html" target="_blank">详细签收信息</a></div>
						</td>
					</table>
				</td>
			</tr>
		</form>
	</table>
</div>
</body>
</html>