<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

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
	var ue = UE.getEditor('editor_id');
	//发布文章
	function submitData () {
		//标题
		//var title = $('#title').val();
		//等级
		//var djFlag = $('#djFlag').combobox('getValue');
		//公文号
		//var gwh = $('#gwh').val();
		//签发人
		//var signFaPerson = $('#signFaPerson').val();
		//承办单位
		//var chengBanDept = $('#chengBanDept').combobox('getText');
		//是否签收
		var signFlag = $('input[name="signFlag"]:checked').val();
		//签收单位
		var signDept = $('#signDept').combobox('getValues');
		if (signFlag == 1) { //签收
			if (signDept == null || signDept == '') {
				alert("请选择签收单位");
				return;
			} 
		} 
		//内容
		var content = ue.getContentTxt();
		//抄送单位
		//var chaoSongDept = $('#chaoSongDept').combobox('getValues');
		
		if (content == null || content == '') {
			alert("请输入内容!");
			return;
		} else {
			$("#ff").form("submit",{
				url:"${pageContext.request.contextPath}/article/save",
				success:function(result){
					var result = eval('('+result+')');
					if (result.success){
						$.messager.alert("系统提示","修改成功！");
						setTimeout("window.parent.$('#tabs').tabs('close','文章管理')",1000);
					} else {
						$.messager.alert("系统提示","修改失败！");
					}
				}
			});
		}
	}
	
</script>
</head>
<body style="margin: 1px">
<div border="false"  class="easyui-panel" title="发布文章" style="padding: 10px">
<form id="ff" method="post">
 	<table cellspacing="20px">
   		<tr>
   			<td width="80px" valign="top">标题：</td>
   			<td valign="top">
   				<input class="easyui-textbox" id="title" required="true" value="${article.title }" name="title" style="height:25px;width:675px;"/>
   				&nbsp;&nbsp;等级:	&nbsp;&nbsp;<select id="djFlag" name="djFlag" style="height:25px;width:70px;"  name="djFlag">
					    <option value="0">平急</option>
					    <option value="1">加急</option>
					    <option value="2">特急</option>
					    <option value="3">特提</option>
					</select>
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">
   				舟公网传
   			</td>
   			<td valign="top">
   				<input class="easyui-textbox" value="${article.gwh }" id="gwh" required="true" name="gwh" style="height:25px;width:200px;"/>
   				<span style="margin-left: 25px;">
   				签发人&nbsp;&nbsp;&nbsp;&nbsp;
   				<input class="easyui-textbox" required="true" value="${article.signFaPerson }" id="signFaPerson" name="signFaPerson" style="height:25px;width:200px;"/>
   				</span>
   				<span style="margin-left: 26px;">
   				承办单位&nbsp;&nbsp;&nbsp;&nbsp;
   				<input id="chengBanDept" name="chengBanDept"  style="width:200px;"  />
   				</span>
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">是否签收</td>
   			<td valign="top">
			 	 是<span style="margin: 0px 20px;"><input <c:if test="${article.signFlag==1 }">checked="checked"</c:if> value="1" class="easyui-radiobutton" name="signFlag" /></span>
			 	 否<span style="margin: 0px 20px;"><input <c:if test="${article.signFlag==0 }">checked="checked"</c:if> value="0" class="easyui-radiobutton" name="signFlag" /></span>
   				<span>
   				发布时间&nbsp;&nbsp;&nbsp;&nbsp;
   					<input id="pubTime" type="text" class="easyui-datetimebox" name="pubTime"
    					data-options="required:true" value=""  style="width:150px">
   				</span>
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">签收单位</td>
   			<td valign="top">
				 <input id="signDept" name="signDept" style="width: 800px; height: 70px;"  />
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">内容：</td>
   			<td valign="top">
				<textarea id="editor_id" name="content">${article.content }</textarea>
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">抄送单位</td>
   			<td valign="top">
   				<input id="chaoSongDept" name="chaoSongDept" style="width: 800px; height: 70px;"  />
   			</td>
   		</tr>
   		<tr>
   			<td><input type="hidden" name="id" value="${article.id }" /></td>
   			<td>
   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">提交</a>
   			</td>
   		</tr>
   	</table>
</form>
</div>

<script type="text/javascript">
//加载等级
$("#djFlag").combobox({
	panelHeight:'auto',
	onLoadSuccess:function() {
		$(this).combobox('select','${article.djFlag}');
	}
});

//加载承办单位
$("#chengBanDept").combobox({
	url:'${pageContext.request.contextPath}/dept/list',
	valueField:'deptName',
	textField:'deptName',
	editable:false,
	panelHeight:'auto',
	required:true,
	panelMaxHeight : 300,
	onLoadSuccess:function() {
		$(this).combobox('select','${article.chengBanDept}');
	}
});

//加载签收单位
$("#signDept").combobox({
	url:'${pageContext.request.contextPath}/dept/list',
	valueField:'id',
	textField:'deptName',
	multiple:true,
	multiline:true,
	panelHeight:'auto',
	panelMaxHeight : 300,
	editable : false,
	onLoadSuccess:function() {
		//$(this).combobox('select','${article.signDept}');
		var dataArray = new Array();
		dataArray = ('${article.signDept}').split(",");
		if (dataArray.length == 33) { //全选
			$(this).combobox('select', -1);
		} else if (dataArray.length > 0 && dataArray != '' && dataArray != null){
			for (x in dataArray) {
				$(this).combobox('select', dataArray[x]);
			}
		}
	},
	loadFilter:function(data){
		return [{'deptName':'全选','id':-1}].concat(data);
	}
});

//加载抄送单位
$("#chaoSongDept").combobox({
	url:'${pageContext.request.contextPath}/dept/list',
	valueField:'id',
	textField:'deptName',
	multiple:true,
	multiline:true,
	panelHeight:'auto',
	panelMaxHeight : 300,
	editable : false,
	onLoadSuccess:function() {
		var dataArray = new Array();
		dataArray = ('${article.chaoSongDept}').split(",");
		if (dataArray.length == 33) { //全选
			$(this).combobox('select', -1);
		} else if (dataArray.length > 0 && dataArray != '' && dataArray != null){
			for (x in dataArray) {
				$(this).combobox('select', dataArray[x]);
			}
		}
	},
	loadFilter:function(data){
		return [{'deptName':'全选','id':-1}].concat(data);
	}
});

//加载发布时间
//$("#pubTime").datetimebox('setValue','${article.pubTime}');


//获取文章修改时间
$(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/article/findPubTime",
		data:{id:'${article.id}'},
		dataType:'json',
		success:function(result) {
			if (result.success) {
				$("#pubTime").datetimebox('setValue',result.article.pubTime);
			}
		}
	});
}) 
</script>
</body>
</html>