<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
<!--
	/* 
	//ajax 去后台执行一个方法，然后返回来将页面某些部分进行局部刷新
	$.ajax({
		global : false,
		type : 'post',
		dataType : "json",
		url : "../inform/message!reply.action",
		data : {
			"msgId" : $("#msgId").val()
		},
		success : function(data, statusText) {
			if(jn("table").find(".selected").next().length==0){
				jn("table").find(".selected").remove(".selected");
				alertMsg.warn("已移动到最后一行");
				return;
			}
			jn("table").find(".selected").next().addClass("selected").prev().remove(".selected");
			//navTab.reload();
			var dialog=$.pdialog.getCurrent();
			var id=jn(".selected").attr("rel");
			var flag=<s:property value="flag"/>;
			$.pdialog.reload("../inform/message!displayMsg.action?msgId="+id+"&flag="+flag);
		}
	}); */
	
	jd("#next").click(function(){
		var flag = <s:property value="flag"/>;
		if(jn("table").find(".selected").next().length==0){
			alertMsg.warn("已移动到最后一行");
			return;
		}
		if(flag == 2){
			jn("table").find(".selected").find("#replyStatus").empty().append("已读").css("color","green");
			jn("table").find(".selected").removeClass("selected").next().addClass("selected");
			var dialog = $.pdialog.getCurrent();
			var id = jn(".selected").attr("rel");
			$.pdialog.reload("../inform/message!displayMsg.action?msgId="+id+"&flag="+flag);
		}else{
			jn("table").find(".selected").next().addClass("selected").prev().remove(".selected");
			//navTab.reload();
			var dialog=$.pdialog.getCurrent();
			var id=jn(".selected").attr("rel");
			$.pdialog.reload("../inform/message!displayMsg.action?msgId="+id+"&flag="+flag);
		}	
	})
	jd("#prev").click(function(){
		var flag = <s:property value="flag"/>;
		if(jn("table").find(".selected").prev().length==0){
			alertMsg.warn("已移动到第一行");
			return;
		}
		if(flag == 2){
			jn("table").find(".selected").find("#replyStatus").empty().append("已读").css("color","green");
			jn("table").find(".selected").removeClass("selected").prev().addClass("selected");
			var dialog = $.pdialog.getCurrent();
			var id = jn(".selected").attr("rel");
			$.pdialog.reload("../inform/message!displayMsg.action?msgId="+id+"&flag="+flag);
		}else{
			jn("table").find(".selected").prev().addClass("selected").next().remove(".selected");
			//navTab.reload();
			var dialog=$.pdialog.getCurrent();
			var id=jn(".selected").attr("rel");
			$.pdialog.reload("../inform/message!displayMsg.action?msgId="+id+"&flag="+flag);
		}	
	})
	jd("#cancelBtn,.close").click(function(){
		/* navTab.reload(); */
	})
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	
//-->
</script>
<div class="pageHeader">
	<div class="searchBar">
		<tr>
			<td><div class="buttonActive"><div class="buttonContent"><button id="prev" type="submit">上一条</button></div></div></td>
			<td><div class="buttonActive"><div class="buttonContent"><button id="next" type="submit">下一条</button></div></div></td>
		</tr>	
	</div>
</div>
<div class="pageContent">
	<form action="../inform/message!reply.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
		<input type="hidden" id="msgId" name="msgId" value="<s:property value="message.id"/>" />
		<div layoutH="75" style="margin:30px 30px -25px; font-size:15px" >		
			发件人：<s:property value="message.sendUser.name"/><hr/>
			发件时间：<s:date name="message.createDate" format="yyyy-MM-dd HH:mm"/><hr/>
			标题：<s:property value="message.title"/><hr/>
			<span style="float:left;font-size:15px"">内容：</span><!-- <div style="float:right;margin:-10px 50px;clear:both;"> -->
			<div layoutH="300" style="font-size:15px; margin:5px 30px 20px 45px;padding:7px;clear:both;line-height:20px;border:solid #6495ED 1px;width: 85%;"><s:property value="message.contentStr" escape="false"/></div>
		</div>	
		<div class="formBar">
			<ul>
				<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>