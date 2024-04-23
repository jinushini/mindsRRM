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
			
			jn(".tbody tr").eq(i).find(".firstCheck input").attr("name","checkResultList["+ i +"].firstCheck");
			jn(".tbody tr").eq(i).find(".secondCheck input").attr("name","checkResultList["+ i +"].secondCheck");
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
						<div style="width:100%;padding:3px 80px;">
							<label>型号代号</label><input type="text" name="checklist.modelCode" value="<s:property value="checklist.modelCode"/>" style="width:150px;">
							<label>产品名称</label><input type="text" name="checklist.productName" value="<s:property value="checklist.productName"/>" style="width:150px;">
							<label>产品代号</label><input type="text" name="checklist.productCode" value="<s:property value="checklist.productCode"/>" style="width:150px;">
						</div>
						<div style="width:100%;padding:3px 80px;float:left;">
							<label>阶段标志</label><input type="text" name="checklist.stage" style="width:150px;">
							<label>检查单编号</label><input type="text" name="checklist.checklistNum" style="width:150px;">
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>检查内容</legend>
			<table width="98%" class="list_table list" style="margin:5px auto">
				<thead>
					<tr align="center">
						<th width="15%">检查项目</th>
						<th width="25%">注意事项 </th>
						<th width="20%">检查结果</th>
						<th width="30%">备注</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkItemList" status="st">
						<tr>
							<td align="center" class="item"><s:property value='item'/></td>
							<td style="padding:5px 15px;"><s:property value='num'/>.&nbsp;<s:property value='demand'/></td>
							<td style="padding:5px 15px;" align="left" class="firstCheck">
							<s:if test="(#st.index+1==1)||(#st.index+1==2)||(#st.index+1==7)||(#st.index+1==9)||(#st.index+1==16)">
								<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;"/>
							</s:if>
							<s:else>
								<input type="radio" value="是" checked/>是
								<input type="radio" value="否" />否
							</s:else>
							</td>
							<td align="center" class="secondCheck">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;"/>
							</td>
						</tr>
					</s:iterator>
				</tbody>
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