<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//添加按钮
	jd("[name=addBtn]").click(function(){
		var $itemList=jd("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find(".file:last").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jd("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		})
		$newItem.initUI();
		$newItem.find("[type=file]").val("");
		
		//增加一行
		$itemList.append($newItem);
	});
	//删除按钮
	jd("[name=delBtn]").click(function(){
		if(jd(".fileTd").find("td").length>1){
			$(this).parent().parent().remove();
		}else{
			$(this).parent().parent().find("input").val("");
			/* alertMsg.error("操作失败！"); */
		}
	});
	//带回按钮
	jd(".btnSelect").click(function(){
		var taskDefinition = jd("#taskDefinition").val();
		var file = jd("[type=file]").val();
		var href = "javascript:$.bringBack({taskModelNum:'基本版',taskDefinition:'" + taskDefinition + "',filesource:'" + file + "'})";
		//alert(href);
		/* var href = "javascript:$.bringBack({id:'1', modelName:'基本版', modeNum:'1001'})"; */
		jd(this).attr("href",href);
	});
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>任务处理----填写任务详情</legend>			
			<table border="0" width="98%" class="edit_table" align="center" id="itemList">
				<!-- <tr>
					<td><a class="btnSelect" href="" title="查找带回">选择</a></td>
				</tr> -->
				<tr>
					<td colspan="2"><textarea name="dispatch.taskDefinition" id="taskDefinition" class="editor" rows="15" style="width: 100%;" upImgUrl="../dispatch/dispatchAppr!upload.action" upImgExt="jpg,jpeg,gif,png,doc"><s:property value="dispatch.taskDefinition" escape="false" /> </textarea></td>
				</tr>
				<!-- <tr>
					<td style="text-align: left;" colspan="2">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
				</tr>
				<tr class="file">
					<td><input type="file" name="filesource"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr> --> 
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<%-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">填写反馈单</button></div></div></li>
			 --%>
			<li><a class="btnSelect" href="" title="查找带回">选择</a></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>