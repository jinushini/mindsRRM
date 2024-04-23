<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
	/* jd("#submitBtn").click(function(){
		var flowTemplateName = jd("input[required='required']").val();
		if(flowTemplateName==""){
			alertMsg.error("请输入模板名称！");
			return false;
		}
	}); */
</script>

<div class="pageContent">
  <form action="../fextends/flowTemplate!createFlowTemplate.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新增模板</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="20%">流程模型</th>
						<td>
							<select name="deploymentId" class="required">
								<option value="">----请选择模型----</option>
								<s:iterator value="list" status="st">
									<option value="<s:property value="deploymentId"/>"><s:property value="flowDefName"/></option>
								</s:iterator>
							</select>
						</td>
						

					</tr>
				</thead>
				<tbody id="itemList">
					<tr class="addTr">
						<th width="20%">模板名称</th>
						<td ><input type="text" name="flowTemplate.flowTemplateName" value="" class="required"></td>						
					</tr>
					<tr>
						<th width="20%" align="center">模板描述</th>
						<td ><input type="text" name="flowTemplate.description"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>

