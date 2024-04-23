<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	/* jd("#cancelBtn,.close").click(function(){
		navTab.closeCurrentTab(this);
	}) */
	
	//不再提示
	jd("[type=checkbox]").change(function(){
		var state = 0;
		var deploymentId = jd("#deploymentId").val();
		if(jd("[type=checkbox]").get(0).checked){
			state = 1;
		}
		
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../review/review!changeNotice.action",
			data:{
				state:state,
				deploymentId:deploymentId
			}, 
			success : function(data, statusText) {
				alertMsg.correct(data.success);
			}
		});  
	});
	
	//全屏查看
	jd("#fullScrBtn").click(function(){
		jd("#flowImg").attr("style","");
		jd(".maximize").click();
		
	})
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
	<input type="hidden" id="deploymentId" value="<s:property value='deploymentId'/>"/>
	<input type="hidden" id="state" value="<s:property value='userSetting.state'/>"/>
		<img id="flowImg" style="width: 800px;" src="../fextends/flowDefined!viewImage.action?deploymentId=<s:property value='deploymentId'/>">
	</div>
	<div class="formBar">
			<ul>
				<li ><input type="checkbox" name="notice" <s:if test="userSetting.state == 1">checked="checked"</s:if>/>不再提示</li>
				<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
</div>
