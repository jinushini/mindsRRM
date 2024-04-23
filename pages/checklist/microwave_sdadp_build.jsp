<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		
		//合并单元格
		var z = 0;
		for(i=0;i<jn(".tbody tr").length;i++){
			var $referCol = jn(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jn(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
		}
		
		//动态添加relUser表格内人员输入框的name
		var k = 0;
		for(var i=0;i<jn("#relUser tr").length;i++){
			for(var j=0;j<jn("#relUser tr").eq(i).find("[type='text']").length;j++){
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).prev().attr("name","relUserList["+k+"].user.id");
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).attr("name","relUserList["+k+"].user.name");
				k = k+1;
			}
		}
	})
	
	
	//提交时判断第四行第三个单选按钮是否被选中，如果被选中则根据文本框输入内容组合单选按钮的val值，文本框没内容时提示填写
	/* jn("#submitBtn").click(function(){
		var $merges = jn(".merge");
		for(var i=0;i<$merges.length;i++){
			var $thisMerge = $merges.eq(i);
			$thisAbnormal = $thisMerge.parent().find("[name='abnormal']");
			if($thisMerge.is(":checked")){
				$thisAbnormal.addClass("required");
			}else{
				$thisAbnormal.removeClass("required");
			}
		}
	}) */
	
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklist!checklistBuildSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="checklist.checklistType" value="<s:property value='checklistType'/>"/>
	<input type="hidden" name="checklist.version" value="<s:property value='version'/>"/>
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="version"/>版</div></td>
				</tr>
				<tr>
					<td align="center" colspan="6">
						<div style="width:100%;padding:3px 20px;">
							<label>型号代号</label><input type="text" name="checklist.modelCode" value="<s:property value="checklist.modelCode"/>" style="width:140px;">
							<label>产品名称</label><input type="text" name="checklist.productName" value="<s:property value="checklist.productName"/>" style="width:140px;">
							<label>产品代号</label><input type="text" name="checklist.productCode" value="<s:property value="checklist.productCode"/>" style="width:140px;">
							<label>所属分系统</label><input type="text" name="checklist.subSystem" style="width:140px;">
						</div>
						<div style="width:100%;padding:3px 20px;float:left;">
							<label>阶段标志</label><input type="text" name="checklist.stage" style="width:140px;">
							<label>产品编号</label><input type="text" name="checklist.productNum" style="width:140px;">
							<label>审查文件名称</label><input type="text" name="checklist.docName" style="width:140px;">
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="checkRoleList" status="st">      
				  	<s:if test="#st.index>0">  
					  	<s:if test="#st.even||#st.first">      
	             	 		<tr>          
	         			</s:if>      
	         			<td align="center" width="20%"><s:property value='roleName'/></td>
	        			<td colspan="1">
							<input type="hidden" class="required" id="relUserId">
							<input type="text" class="required" id="relUserName" readonly="readonly" onclick="$(this).next().click()">
							<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
	        			<s:if test="#st.odd||#st.last">      
	            			</tr>          
	        			</s:if>
        			</s:if>
        		</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>