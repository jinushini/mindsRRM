<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

//提交按钮
jd("[type=submit]").click(function() {
	//修改Tr行数据
	var $modifyTr = jd("#itemList").find(".modifyTr");
	for(var i = 0; i < $modifyTr.length; i++){
		var $input = $modifyTr.eq(i).find("input[type='text']").val();
		var $select = $modifyTr.eq(i).find(".preFlow").find("option:selected").val();
		if($input == $select){
			alertMsg.error("关联关系设置有误，不允许设置自身");
			return false;
		}
	}
	for(var i = 0; i < $modifyTr.length; i++){
		var $input = $modifyTr.eq(i).find("input[type='text']");
		var $select = $modifyTr.eq(i).find("select");
		var name = $select.attr("name").substring($select.attr("name").indexOf("["),$select.attr("name").indexOf("."));
		$select.attr("name",$select.attr("name").replace(name, "["+ i +"]"));
		for(var j = 0; j< $input.length; j++){				
			var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
			$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ i +"]"));		
		}
	}
}); 
	
</script>

<div class="pageContent">
  <form action="../fextends/flowTemplate!modifyFlowModelNodeRelation.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  		<input type="hidden" name="flowTemplatelNodeId" value="<s:property value="flowTemplatelNodeId"/>">
		<br/>
	<fieldset>
		<legend><s:property value="flowTemplate.flowDefName"/></legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="50%">流程名称</th>
						<th width="50%">前置流程</th>

					</tr>
				</thead>
				<tbody id="itemList">
					<s:iterator value="list" status="st" var="a">
						<tr class="modifyTr">
							<td align="center" hidden="hidden"><input type="text" name="nodesDataList[#index].subFlowId" value="<s:property value="id"/>"></td>
							<td align="center"><input type="text" name="nodesDataList[#index].flowName" value="<s:property value="flowName"/>" style="border:0;text-align:center;font-size:14px;" /></td>
							<td align="center">
								<select name="nodesDataList[#index].preFlowId" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="list" status="st">
										<option value="<s:property value='id'/>" <s:if test="#attr.a.preFlowId == id">selected="selected"</s:if>><s:property value="flowName"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
   </form>
</div>

