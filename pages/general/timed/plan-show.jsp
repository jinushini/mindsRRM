<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	var s=jd("#planContentDiv").html();
	
	jd("#planContentIframe")[0].contentWindow.document.write(s);
	
	var a=jd("#actContentDiv").html();
	
	jd("#actContentIframe")[0].contentWindow.document.write(a);
	
</script>
<div class="pageContent">
  <form method="post" action=""  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56" width="80%">
		<br/>
	<fieldset>
		<legend><s:property value='dispatchPlan.item.name'/>（<s:date name="dispatchPlan.deadline" format="MM-dd"/>）完成情况</legend>
		<table border="0" width="95%" class="edit_table" align="center">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">事项名称：</td>
				<td><s:property value='dispatchPlan.item.name'/></td>
				<td align="center" style="font-weight: bold;">事项要求：</td>
				<td <s:if test="dispatchPlan.businessStatus == 1">style="color:red;"</s:if><s:elseif test="dispatchPlan.businessStatus == 3">style="color:green;"</s:elseif><s:elseif test="dispatchPlan.businessStatus == 2">style="color:orange;"</s:elseif><s:else>style="color:red;"</s:else>><s:property value="dispatchPlan.businessStatus == 1 ? '未提醒' : dispatchPlan.businessStatus == 2 ? '已提醒' : dispatchPlan.businessStatus == 3 ? '已完成' : 'bug'"/></td>
				<%-- <td><s:property value="dispatchPlan.businessStatus == 1 ? '未提醒' : dispatchPlan.businessStatus == 2 ? '待处理' : dispatchPlan.businessStatus == 3 ? '已完成' : 'bug'"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">提醒时间：</td>
				<td>
					<s:date name='dispatchPlan.remindTime' format="yyyy-MM-dd"/>
				</td>
				<td align="center" style="font-weight: bold;">截止时间：</td>
				<td>
					<s:date name='dispatchPlan.deadline' format="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">事项来源：</td>
				<td>
					<s:property value='dispatchPlan.item.source'/>
				</td>
				<td align="center" style="font-weight: bold;">责任人：</td>
				<td>
					<s:property value='dispatchPlan.item.receiverNames'/>
				</td>
			</tr>
			<tr>
				<td align="center" rowspan="">相关文档：</td>				
				<td colspan="3">
				<s:iterator value="fileList" status="st">
					<div style="float:left;margin:0 5px;clear:both;">
						<a href="<s:property value="filePath"/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
					</div><br/>
				</s:iterator>
				</td>				
			</tr>
			
			<tr>
				<td style="font-weight: bold;" colspan="4">计划完成情况：</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 400px;">
					<iframe frameborder="0" id="planContentIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					</iframe>
					<div id="planContentDiv" style="display:none;"><s:property value="dispatchPlan.planContentStr" escape="false"/></div>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;" colspan="4">实际完成情况：</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 400px;">
					<iframe frameborder="0" id="actContentIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					</iframe>
					<div id="actContentDiv" style="display:none;"><s:property value="dispatchPlan.actualContentStr" escape="false"/></div>
				</td>
			</tr>
		</table>
	</fieldset>
	
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="modifyBtn" type="submit">修改</button></div></div></li> -->
			<s:if test="dispatchPlan.item.creater.id == currentUser.id"><li><a class="button" href="../general/timed_DispatchPlan_enterAddOrModify_plan-edit.action?op=1&num=1&id=<s:property value="id"/>&itemId=<s:property value='dispatchPlan.item.id'/>" target="dialog" width='900' height='800'><span>修改实际完成情况</span></a></li></s:if>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>