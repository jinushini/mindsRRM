<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//添加按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find(".file:last").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jn("#itemList").find("tr").length>1){
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
	jn("[name=delBtn]").click(function(){
		//alert(jn(".fileTd").find("td").length);
		if(jn(".fileTd").find("td").length>1){
			$(this).parent().parent().remove();
		}else{
			$(this).parent().parent().find("input").val("");
		}
	});
	//删除文件按钮
	jn("[name=del]").click(function(){
		var fileId = $(this).parent().parent().find("input").val();
		//获取当前行
		var $tr = $(this).parent().parent();
		alertMsg.confirm("确认删除", {
			 okCall: function(){				
					$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : "../dispatch/dispatchAppr!delFileById.action",
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
<form method="post" enctype="multipart/form-data" action='../dispatch/dispatchAppr!modifyFeedback.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	
	<%-- <input type="hidden" name="dispatch.id" value="<s:property value="dispatch.id"/>"> --%>
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="dispatch.processInstId" type="hidden" value="<s:property value="dispatch.processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
			<fieldset>
				<legend>任务详情</legend>
				<table border="0" width="98%" class="edit_table" align="center">
					<tr>
						<td align="center" width="15%">任务名称：</td>
						<td width="35%"><s:property value="dispatch.taskName" /></td>
						<td align="center" width="15%">任务归属：</td>
						<td>
							<s:if test='dispatch.referenceLink != null'>
								<a href="<s:property value='dispatch.referenceLink'/>" height="450" width="850" target="dialog" title="<s:property value='dispatch.taskType' />" style="color:green;"><s:property value="dispatch.taskType" /></a>
							</s:if>
							<s:else>
								<s:property value="dispatch.taskType" />
							</s:else>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="1">任务描述：</td>
						<td colspan="4">
							<div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatch.taskDefinitionStr" escape="false"/></div>
						</td>
					</tr>
					<tr>
						<td align="center" width="15%">派&nbsp;工&nbsp;人：</td>
						<td ><s:property value="dispatch.dispatchManager.name" /></td>
						<td align="center" width="15%">截止日期：</td>
						<td><s:date name="dispatch.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>	
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档：</td>				
						<td >
						<s:iterator value="fileList" status="st">
							<div style="float:left;margin:0 5px;clear:both;">
								<a href="<s:property value="filePath"/>" style="color:green"><s:property value="taskFileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
							</div><br/>
						</s:iterator>
						</td>				
					</tr>
					<tr>
						<td align="center" rowspan="">审&nbsp;批&nbsp;人：</td>	
						<td colspan="3"><s:property value="approve.userName"/></td>
					</tr>
					<tr>
						<td align="center" rowspan="">审批意见：</td>	
						<td colspan="3"><s:property value="approve.comments"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>任务处理</legend>
				<table border="0" width="98%" class="edit_table" align="center" id="itemList">
					<tr>
						<td colspan="4">
							<textarea name="dispatch.feedbackInfo" id="feedbackInfo" class="editor required" rows="10" style="width: 100%;" upImgUrl="../dispatch/dispatchAppr!upload.action" upImgExt="jpg,jpeg,gif,png">
									<s:property value="dispatch.feedbackInfoStr" escape="false" /> 
							</textarea>
						</td>
					</tr>
					<tr>
						<td width="30%" align="center">是否完成：</td>
						<td width="70%" colspan="2"><span class="required" > <input type="radio" name="dispatch.feedbackState" value="1">已完成&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="dispatch.feedbackState" value="0">未完成
						</span></td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="2">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
					</tr>
					<s:iterator value="fileList" status="st">
					<tr>
						<td>
							<input type="hidden" value="<s:property value="id"/>"/>
							<div style="float:left;margin:0 5px;clear:both;">
								<s:property value="taskFileName"/>
							</div>
						</td>
						<td><a name="del" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
					</s:iterator>
					<tr class="file" colspan="2">
						<td><input type="file" name="filesource"/>
						</td>
						<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
					
				</table>
			</fieldset>
		</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<%-- <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>