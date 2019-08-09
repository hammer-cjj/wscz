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
<title>网络传真-搜索</title>

<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" >
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	//获取当前时间
	function getCurrentTime() {
		var week = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth() + 1;
		var day = myDate.getDate();
		
		var h = myDate.getHours();
		var m = myDate.getMinutes();
		if (m < '10') {
			m = '0' + m;
		}
		var s = myDate.getSeconds();
		if (s < "10") {
			s = "0" + s;
		}
		sj = h + ":" + m + ":" +s;
		var rq = year + "年" + month + "月" + day + "日" + week[myDate.getDay()] + " " + sj;
		$("#currentTime").html(rq);
	}
	
	setInterval("getCurrentTime()", 1000);
	
	//点击按钮，用户登陆
	function login() {
		var userName = $('#userName').val();
		var password = $('#password').val()
		if (null == userName || userName == '') {
			alert("请输入用户名!");
		} else if (null == password || password == '') {
			alert("请输入密码!");
		} else {
			$("#loginForm").submit();
		}
	}
	
	//搜索
	function search() {
		var keyword = $('#keyword').val();
		if (keyword == null || keyword == "") {
			window.loaction.href="${pageContext.request.contextPath}";
			return false;
		}
		return true;
	}
	
	/* $(document).keydown(function (e) {
		if (e.keyCode === 13) {
			login();
		}
	}); */
</script>
</head>
<body style="background-color:rgb(243,243,243);">
<div style="width: 1200px;margin: 0px auto;">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
	 <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	 <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	 <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
		    <img src="${pageContext.request.contextPath}/static/images/header01.jpg" />
		</div>
		<div class="item">
			<img src="${pageContext.request.contextPath}/static/images/header02.jpg" />
		</div>
		<div class="item">
		    <img src="${pageContext.request.contextPath}/static/images/header03.jpg" />
		</div>
	</div>
</div>
<div class="header_tab">
	<div>
		<a href="${pageContext.request.contextPath}">首页</a>
		<a href="http://10.123.128.11">市局首页</a>
		<a id="currentTime"></a>
	</div>
</div>
</div>
<div id="main" style="height: auto;overflow: hidden;padding-bottom: 20px;width: 1200px;margin: 0px auto;">
	<div style="height:30px;"></div>
	<div style="background-color:#fff;height:750px;">
		<div  style="float: left;width: 280px;">
			 <div id="login">
			 	<div class="top_nav">
			 		用户登陆:
			 	</div>
			 	<form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post">
			 	<div class="name-pwd">
			 			用户名
			 			<input id="userName" name="userName" type="text" style="width:150px;height:40px;margin-left: 15px;" />
			 	</div>
			 	<div class="name-pwd">
			 			密码
			 			<input id="password" name="password" type="password" style="width:150px;height:40px;margin-left: 31px;" />
			 	</div>
			 	<div style="margin: 15px 25px;text-align:center;">
			 		<button type="button" onclick="login()" style="width:100px;font-size:16px;" class="btn btn-primary btn-md">登&nbsp;&nbsp;陆</button>
			 	</div>
			 	<c:if test="${errMsg != null }">
			 		<div style="color:red;text-align:center;font-size:14px;">${errMsg }</div>
			 	</c:if>
			 	
			 	</form>
			 </div>
		</div>
		<div style="float: right;width: 910px;">
			<div class="right-content">
				<div class="r_top_nav">
					<a class="r_top_nav_name" href="#">网络传真</a>
					<form id="searchForm" action="${pageContext.request.contextPath}/article/search" method="post" onsubmit="return search()">
						<div class="search_text" style="float:right;">
							<input id="keyword" name="keyword" value="${keyword }" type="text" style="height:40px;font-size:18px;float:left;" />
							<select name="tiaojian"  style="font-size:16px;width:60px;height:40px;float:left;">
								<option value="0" <c:if test="${tiaojian == 0 }" >checked="checked"</c:if> >全文</option>
								<option value="1" <c:if test="${tiaojian == 1 }" >checked="checked"</c:if> >标题</option>
								<option value="2" <c:if test="${tiaojian == 2 }" >checked="checked"</c:if> >内容</option>
							</select>
							<button  style="float:left;height:40px;font-size:16px;" class="btn btn-primary" type="submit" >搜索</button>
						</div>
					</form>
				</div>
				<ul id="bs" style="padding-top: 15px;padding-left: 15px;">
					<c:forEach items="${pageInfo.list }" var="article">
						<li>
							<a href="${pageContext.request.contextPath}/article/viewDetail/${article.id }.html" title="${article.title }" target="_blank">
								<c:if test="${fn:length(article.title)>38}">${fn:substring(article.title,0,38)}...</c:if>
								<c:if test="${fn:length(article.title)<=38}">${article.title}</c:if>
							</a>
							<span>[<fmt:formatDate value="${article.pubTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /> ${article.chengBanDept }]</span>
							<span>浏览${article.hit }次</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div style="text-align: center;">
					<nav aria-label="Page navigation">
						<ul class="pagination">
						  <li><a href="${pageContext.request.contextPath}/article/search?pn=1">首页</a></li>
						  <c:if test="${pageInfo.hasPreviousPage}">
						  	<li>
						      <a href="${pageContext.request.contextPath}/article/search?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
						        <span aria-hidden="true">上一页</span>
						      </a>
						    </li>
						  </c:if>
					      <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
					    	<c:if test="${page_Num == pageInfo.pageNum}">
						    	<li class="active"><a href="#">${page_Num}</a></li>
					    	</c:if>
					    	<c:if test="${page_Num != pageInfo.pageNum}">
						    	<li><a href="${pageContext.request.contextPath}/article/search?pn=${page_Num}">${page_Num}</a></li>
					    	</c:if>
					      </c:forEach>
					      <c:if test="${pageInfo.hasNextPage}">
						    <li>
						      <a href="${pageContext.request.contextPath}/article/search?pn=${pageInfo.pageNum + 1}" aria-label="Next">
						        <span aria-hidden="true">下一页</span>
						      </a>
						    </li>
					      </c:if>
						    <li><a href="${pageContext.request.contextPath}/article/search?pn=${pageInfo.pages}">尾页</a></li>
						  </ul>
					</nav>
				</div>
				<div style="text-align: center;font-size:16px;">
					当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，总共${pageInfo.total}条记录
				</div>
		</div>
	</div>
	
	<div  style="text-align: center;font-size:16px;margin-top: 20px;">
		<p>
			<img src="${pageContext.request.contextPath}/static/images/beian.png" />
			舟山公安网络传真 由办公室主管
			&nbsp;&nbsp;&nbsp;&nbsp;技术支持: 舟山市公安局 科技信息化处
		</p>
		<p>CopyRight &copy; 2019 舟山市公安局 版权所有</p>
	</div>
</div>



</body>
</html>