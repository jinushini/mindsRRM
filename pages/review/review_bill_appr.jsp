<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
</script>
<div class="pageContent">
	<form action="../review/reviewAppr!handleReviewAppove.action" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >	
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>"/>
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>"/>
		<div class="pageFormContent" layoutH="56"><br/>
			<fieldset>
				<legend>审批</legend>
				<table width="98%" class="edit_table" align="center">
					<tr>
						<td align="center" width="20%">复查名称：</td>
						<td width="30%"><s:property value="reviewBill.reviewBillName"/></td>
						<td align="center" width="20%">截止日期：</td>
					<td width="30%"><s:date name="reviewBill.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
				</tr>
					<tr>
						<td align="center" width="20%">型号代号：</td>
						<td width="30%"><s:property value="reviewProduct.modelCode"/></td>
						<td align="center" width="20%">分系统：</td>
					<td width="30%"><s:property value="reviewProduct.modelName"/></td>
				</tr>
				<tr>
					<td align="center">产品代号：</td>
					<td><s:property value="reviewProduct.productCode"/></td>
					<td align="center">产品名称：</td>
					<td><s:property value="reviewProduct.productName"/></td>
				</tr>
				
				<tr>
					<td align="center">产品种类：</td>
					<td><s:property value="reviewProduct.type"/></td>
					<td align="center">单机主管：</td>
					<td>
						<s:property value="reviewProduct.singleHead.name"/>
					</td>
				</tr>
				<tr>
					<td align="center" rowspan="">相关文档</td>
					<td colspan="3">
						<div style="color:gray;">复查下发文档：</div><br/>
						<s:iterator value="fileList" status="st">															
							<div style="float:left;margin:0 5px;clear:both;">								
								<a href="<s:property value="filePath"/>" download="<s:property value='reviewFileName' />" style="color:green"><s:property value="reviewFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
							</div>								
							<br />
						</s:iterator>															
						<br/>
						<div style="color:gray;">反馈上传文档：</div><br/>
						<s:iterator value="feedbackfileList" status="st">								
							<div style="float:left;margin:0 5px;clear:both;">							
								<a href="<s:property value="filePath"/>" download="<s:property value='reviewFileName' />" style="color:green"><s:property value="reviewFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
							</div>
							<br />
						</s:iterator>							
					</td>
				</tr>
				<s:iterator value="reviewProduct.reviewRequests" status="st">
					<tr>
						<td width="30%" colspan="4" style="font-size: 18px;"><s:property value="num+1"/>、<s:property value="item"/></td>
					</tr>
					<tr>
						<td colspan="4"><s:property value="resultStr" escape="false"/></td>
					</tr>
					<tr><td colspan="4"></td></tr>
				</s:iterator>	
				</table>
			</fieldset> 
			<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td  width="30%" align="center">审批结论：</td>
				<td width="70%">
					<span class="required">
						<input type="radio" name="approve.resultCn" value="通过">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过"/>不通过
					</span>
				</td>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="approve.comments" style="width: 90%;" rows="10" cols=""></textarea></td>
			</tr>
		</table>
	</fieldset>
		</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			<%-- <li><a class="button" href="../review/review!showReviewProductList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
		</ul>			
	</div>
   </form>
</div>