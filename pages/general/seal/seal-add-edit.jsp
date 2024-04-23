<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
//添加一行按钮
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
	//alert(jd(".fileTd").find("td").length);
	if(jd(".fileTd").find("td").length>1){
		$(this).parent().parent().remove();
	}else{
		$(this).parent().parent().find("input").val("");
	}
});
//删除文件按钮
jd("[name=del]").click(function(){
	var fileId = $(this).parent().parent().find("input").val();
	//获取当前行
	var $tr = $(this).parent().parent();
	alertMsg.confirm("确认删除", {
		 okCall: function(){				
				$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../general/timed_DispatchPlan_deleteFile.action",
				data:{
					id:fileId
				}, 
				success : function(data, statusText) {
					alertMsg.correct(data.message);					
					}
				});  
				//删除当前行
				$tr.remove();
		 },
		 cancelCall : function() {}
		});			
});	
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action="../general/seal_Seal_addOrEdit.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="op" value="<s:property value="op"/>"/>
	<input type="hidden" name="seal.id" value="<s:property value="seal.id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="op == 1 ? '新增' : '编辑'"/>公章</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">公章名称：</td>
				<td><input name="seal.title" value='<s:property value="seal.title"/>' size="60%"/></td>
			</tr>
			<tr <s:if test="op == 0">style="display:none;"</s:if>>
				<td align="center" width="30%" style="font-weight: bold;">公章类型：</td>
				<td><input name="seal.type" value='<s:property value="seal.type"/>' size="60%"/></td>
			</tr>
			
			<tr <s:if test="op == 0">style="display:none;"</s:if>>
			<td style="text-align: center; width:20%;">
				公章：<br/><br/>
				<div style="color:red;">
					(上传新公章前请先删除旧公章)
				</div>
			</td>
			<td>
				<div class="upload-wrap">
					<input type="file" name="fileSource" accept="" class="valid" style="left: 0px;">
					<div class="thumbnail">
						<img src="<s:property value="seal.path"/>" style="max-width: 80px; max-height: 80px">
						<a class="del-icon" href="ajaxDone.html"></a>
					</div>
				</div>
			</td>
		</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>