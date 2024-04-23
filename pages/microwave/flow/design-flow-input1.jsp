<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("#selectTemplate").change(function(){
		jn("#showNodes").empty();
		var flowTemplateId = jn("#selectTemplate").val();
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../microwave_product/ProductDesignProAppr_showNodes.action",
			data:{
				flowTemplateId:flowTemplateId
			}, 
			success : function(data, statusText) {
				if(data != "nothing"){
					//解析json字符串
					var obj = eval('(' + data + ')');
					jn("#showNodes").append(
							"<tr>"
							+ "<td align='center'>阶段 </td>"
							+ "<td align='center'>开始时间</td>"
							+ "<td align='center'>结束时间</td>"
							+ "</tr>");
					for(var i in obj){
						jn("#showNodes").append(
								"<tr>"
								+ "<td align='center'>" + obj[i].nodesName + "<input name='flowRunNodeVoList[" + i +"].nodesName' type='hidden' value='"+ obj[i].nodesName +"'><input name='flowRunNodeVoList[" + i +"].nodesId' type='hidden' value='"+ obj[i].nodesId +"'></td>"
								+ "<td align='center'><input name='flowRunNodeVoList[" + i +"].scheduleDate.planBeginDate' readonly='readonly' onclick='WdatePicker();' type='text'></td>"							
								+ "<td align='center'><input name='flowRunNodeVoList[" + i +"].scheduleDate.planEndDate' readonly='readonly' onclick='WdatePicker();' type='text'></td>"
								+ "</tr>");
					}
					
					jn("#showNodes").show();
					
				}
			}
		});
	}); 
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../microwave_product/ProductDesignProAppr_createProject.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>填写项目数据</legend>
		<table bproduct="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="30%">产品代号：</td>
				<td hidden="hidden"><input type="hidden" name="id" value="" class="required" readonly="readonly"></td>
				<td>
					<input name="code" style="width:90%;" type="text" class="required" readonly="readonly" value="" suggestFields="code,name,id" suggestUrl="" lookupGroup="productDesign" lookupPk="code" onclick="$(this).next().attr('href','../microwave_product/ProductDesign_showList_design-list-dialog.action');$(this).next().click()"/>
					<a title="选择产品" class="model" href="###" lookupGroup="" lookupPk="code" target="dialog" width="1080" height="600" ></a>
				</td>
				<td align="center">产品名称：</td>
				<td>
					<input name="name" style="width:90%;" type="text"  class="required" readonly="readonly" value="" suggestFields="code,name,id" suggestUrl="" lookupGroup="productDesign" lookupPk="code" onclick="$(this).next().attr('href','../microwave_product/ProductDesign_showList_design-list-dialog.action');$(this).next().click()"/>
					<a title="选择产品" class="model" href="###" lookupGroup="" lookupPk="code" target="dialog" width="1080" height="600"></a>
				</td>
			</tr>
			<tr>
				<td align="center">管理人员：</td>
				<td colspan="3">
					<input name="user.id" type="hidden" class="required"/>
					<input name="user.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()"/>
					<a title="人员选择" class="btnLook" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
					</a>
				</td>
			</tr>			
			<tr>
				<td align="center">选择模板：</td>
				<td colspan="3">
					<select name="flowTemplateId" class="required" id="selectTemplate">
						<option value="">----流程模板----</option>
						<s:iterator value="list" status="st">
							<option value="<s:property value="id"/>"><s:property value="flowTemplateName"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>			
		</table>
		<table width="98%" class="edit_table" align="center" id="showNodes" style="display: none;">
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<%-- <li><a class="button" href="../ssaps/ssaps!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>