<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("#saveBtn").click(function(){
		//处理index
		replaceIndex();
	});
	//处理index
	function replaceIndex(){
		var $tr = jn(".fluwRunConfig").find("tr")
		var $trlen = $tr.length;
		for(var i = 1 ; i < $trlen ; i ++){
			var $input = $tr.eq(i).find("input");
			var $inputlen = $input.length;
			for(var j = 0 ; j < $inputlen ; j ++){
				$name = $input.eq(j).attr("name");
				//flowModelNodesDataList[#index].nodesName
				var $tname = $name.substring($name.indexOf("["),$name.indexOf("."));
				$input.eq(j).attr("name",$name.replace($tname, "["+i+"]"));	
			}
		}
	}
</script>
<div class="pageContent">
  <form id="formdata" method="post" enctype="multipart/form-data" action='../fextends/FlowTemplate_configFlowTemplate.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" id="id" name="flowTemplateId" value='<s:property value="flowTemplate.id"/>'/>
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>配置参数--<s:property value="flowTemplate.flowTemplateName"/></legend>
			<table bproduct="0" width="98%" class="edit_table fluwRunConfig" align="center">
				<tr>
					<td align="center" width="3%">层级</td>
					<td align="center" width="25%">名称</td>
					<td align="center" width="15%">标准工时（天）</td>
				</tr>
				<s:iterator value="flowTemplate.nodes" var="a">
					<tr class="node" level="1">
						<td align="center">1<input name="flowModelNodesDataList[#index].level" type="hidden" value="1"></td>
						<td style="color: green;"><s:property value="#attr.a.flowDefName"/><input name="flowModelNodesDataList[#index].subFlowId" type="hidden" value='<s:property value="#attr.a.id"/>'></td>
						<td align="center"><input type="text" name="flowModelNodesDataList[#index].standardHours" value='<s:property value="standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
					</tr>
					<s:iterator value="#attr.a.flowTemplateNodesDatas" var="b">
						<tr class="customflow" level="2">
							<td align="center">2<input name="flowModelNodesDataList[#index].level" type="hidden" value="2"></td>
							<td style="color: blue;"><span style="color: blue;">|——|</span><s:property value="#attr.b.flowName"/><input name="flowModelNodesDataList[#index].subFlowId" type="hidden" value='<s:property value="#attr.b.id"/>'></td>
							<td align="center"><input type="text" name="flowModelNodesDataList[#index].standardHours" value='<s:property value="standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
						</tr>
						<s:iterator value="#attr.b.template.nodes" var="c">
							<tr class="customnode" level="3">
								<td align="center">3<input name="flowModelNodesDataList[#index].level" type="hidden" value="3"></td>
								<td style="color: red;"><span style="color: red;">|————|</span><s:property value="#attr.c.flowDefName"/><input name="flowModelNodesDataList[#index].subFlowId" type="hidden" value='<s:property value="#attr.c.id"/>'></td>
								<td align="center"><input type="text" name="flowModelNodesDataList[#index].standardHours" value='<s:property value="standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							</tr>
							<s:iterator value="#attr.c.flowTemplateNodesDatas" var="d">
								<tr class="actflow" level="4">
									<td align="center">4<input name="flowModelNodesDataList[#index].level" type="hidden" value="4"></td>
									<td style="color: orange;"><span style="color: red;">|———————|</span><s:property value="#attr.d.flowName"/><input name="flowModelNodesDataList[#index].subFlowId" type="hidden" value='<s:property value="#attr.d.id"/>'></td>
									<td align="center"><input type="text" name="flowModelNodesDataList[#index].standardHours" value='<s:property value="standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								</tr>
							</s:iterator>
						</s:iterator>
					</s:iterator>
				</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="submit">保存</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>