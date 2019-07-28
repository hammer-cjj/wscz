<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/kindeditor/themes/simple/simple.css" />
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript">
	//标题格式化显示
	function formatTitle(val,row){
		return "<a href='${pageContext.request.contextPath}/article/viewDetail/"+row.id+".html' target='_blank'>"+val+"</a>";
	}
	
	//等级格式化显示
	function formatDj(val) {
		if (val == 0) {
			return "一般";
		} else if (val == 1) {
			return "加急";
		} else if (val == 2) {
			return "特急";
		}
	}
	
	//新增文章
	/* 
	function newArticle() {
		window.parent.openTab('发布文章','writeArticle','icon-writeblog');
	}
	 */
	 
	//打开修改文章页面
	function openArticleModifyTab() {
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一个要修改的文章！");
			 return;
		 }
		 var row=selectedRows[0];
		 //window.parent.openTab('修改文章','modifyBlog.jsp?id='+row.id,'icon-writeblog');
		/*  $.ajax({
			 url:"${pageContext.request.contextPath}/article/findById",
			 data:{id:row.id},
			 dataType:'json',
			 success:function(result) {
				 if (result.success) {
				 }
			 }
		 }); */
		 location.href = "${pageContext.request.contextPath}/article/findById?id="+row.id;
	}
	
	//搜索
	function searchArticle(){
		$("#dg").datagrid('load',{
			"title":$("#s_title").val(),
		});
	}

	//删除文章
	function deleteArticle(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].id);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${pageContext.request.contextPath}/article/del",{ids:ids},function(result){
						if(result.success){
							 $.messager.alert("系统提示","数据已成功删除！");
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}

	//对 Date.prototype 的扩展来实现的
	Date.prototype.format = function(format) {
	    var o = {
	        "M+": this.getMonth() + 1, //month 
	        "d+": this.getDate(), //day 
	        "h+": this.getHours(), //hour 
	        "m+": this.getMinutes(), //minute 
	        "s+": this.getSeconds(), //second 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
	        "S": this.getMilliseconds() //millisecond 
	    };

	    if (/(y+)/i.test(format)) {
	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    }

	    for (var k in o) {
	        if (new RegExp("(" + k + ")").test(format)) {
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
	        }
	    }
	    return format;
	};
	
	//任务发布日期的格式化
	function formatPubtime(val) {
		var d = new Date(val);
		return d.format("yyyy-MM-dd hh:mm:ss");
	}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="任务文章" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"  scrollbarSize="0"
   url="${pageContext.request.contextPath}/article/listAll" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="id" width="50" align="center">编号</th>
   		<th field="title" width="200" align="center" formatter="formatTitle">标题</th>
   		<th field="djFlag" width="50" align="center" formatter="formatDj">等级</th>
   		<th field="chengBanDept" width="50" align="center">承办单位</th>
   		<th field="pubTime" width="50" align="center" formatter="formatPubtime">发布日期</th>
   	</tr>
   </thead>
</table>
 <div id="tb">
 	<div>
 		<!-- <a href="javascript:newArticle()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a> -->
 		<a href="javascript:openArticleModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	 	<a href="javascript:deleteArticle()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
	<div>
 		&nbsp;标题：&nbsp;<input type="text" id="s_title" size="30" onkeydown="if(event.keyCode==13) searchArticle()"/>
 		<a href="javascript:searchArticle()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>	
 </div>
 

</body>
</html>