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
	
	//新增单板与继承单板的不同页面显示
	jn(".inherit input[type='radio']:checked").attr("checked",false);
	jn("[name='checklist.isInherit']").change(function(){
		switch(jn(this).val()){
			case '新增单板':
				
				//隐藏的时候先清空数据，再按情况看是否为新显示添加数据
				jn(".Y input").val("");
				jn("#singleBoardCharacter").attr("rowspan","3");
				jn(".Y").hide();
				
				jn(".inherit input[type='text']").val("");
				jn(".inherit input[type='radio']:checked").attr("checked",false);
				jn(".inherit").hide();
				
				jn("#newChecked").prop("checked", "checked");
				jn(".new").show();
				
				jn(".tbody tr:eq(1) .item").attr("rowspan","3");
				jn(".tbody tr:gt(2)").show();
				break;
				
			case '继承单板':
				jn(".new input:checked").attr("checked",false);
				jn(".new").hide();
				
				jn(".inherit").show();
				
				jn("#singleBoardCharacter").attr("rowspan","5");
				jn(".Y").show();
				
				/*  jn("[name='checklist.changeSection']").change(function(){
					if((jn(this).val()=="有")){
						jn("#singleBoardCharacter").attr("rowspan","5");
						jn(".Y").show();
						jn(".tbody tr:eq(1) .item").attr("rowspan","3");
						jn(".tbody tr:gt(2)").show();
					}else{
						jn(".Y input").val("");
						jn("#singleBoardCharacter").attr("rowspan","3");
						jn(".Y").hide();
						
						jn(".tbody tr:gt(2) input").val("");
						jn(".tbody tr:eq(1) .item").attr("rowspan","2");
						jn(".tbody tr:gt(2)").hide();
					}
				})  */
				break;
			default:
				alert("error");	
				break;
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
							<label>单板名称</label><input type="text" name="checklist.singleBoardName" style="width:150px;">
							<label>图纸代号</label><input type="text" name="checklist.drawingCode" style="width:150px;">
							<label>研制阶段</label><input type="text" name="checklist.stage" style="width:150px;">
						</div>
					</td>
				</tr>
				
				<tr>
					<td align="center" style="width:20%">
						<select name="checklist.isInherit" style="width:120px;margin-left:15px">
							<option value="新增单板" >新增单板</option>
							<option value="继承单板" >继承单板</option>
						</select>
					</td>
            		<td align="center">
            			<div class="new" >
            				<div style="width:100%;padding:3px 30px;float:left;">
            					<input type="radio" value="已经按照此电路板加工，并验证其性能" name="checklist.newSingleBoardNote" style="margin-left:-240px" id="newChecked" checked >已经按照此电路板加工，并验证其性能
            					<input type="radio" value="没有按照此电路板加工，但已经验证了其性能" name="checklist.newSingleBoardNote" style="margin-left:63px">没有按照此电路板加工，但已经验证了其性能
            				</div>
            				<div style="width:100%;padding:3px 30px;float:left;">
            					<input type="radio" value="完全没有验证，且无仿真结果提供" name="checklist.newSingleBoardNote" style="margin-left:-300px">完全没有验证，且无仿真结果提供
            					<input type="radio" value="完全没有验证，但有仿真结果提供" name="checklist.newSingleBoardNote" style="margin-left:86px">完全没有验证，但有仿真结果提供
            				</div>
            			</div>
            			<div class="inherit" style="display:none;">
            				<div style="width:100%;padding:3px 100px;">
            					<label>继承分机名称</label>
            					<input type="text" name="checklist.inheritExtensionName"style="width:150px;" >
            					<label>继承单板名称</label>
            					<input type="text" name="checklist.inheritSingleBoardName" style="width:150px;">
            				</div>
            				<div style="width:100%;padding:3px 100px;float:left;">
            					<label>继承图纸代号</label>
            					<input type="text" name="checklist.inheritDrawingCode" style="width:150px;" >
            					<label>继承研制阶段</label>
            					<input type="text" name="checklist.inheritStage" style="width:150px;" >
            				</div>
            			</div>
            		</td>
				</tr>	
				<tr style="display:none;" class="inherit">
					<td align="center" rowspan="5" id="singleBoardCharacter">
						单板特性
					</td>
					<td>
						<label style="width:20%;margin-left:40px;">相对于同型号前阶段设计：</label>
            				<select name="checklist.changeSection" style="width:20%;margin-left:40px;">
            					<option value="电性星有变化" >电性星有变化</option>
            					<option value="鉴定件有变化" >鉴定件有变化</option>
            					<option value="正样有变化" >正样有变化</option>
            				</select>
					</td>
				</tr>
				<tr style="display:none;" class="Y">
					<td>
						<label style="width:10%;margin-left:40px;">变化内容</label>
            			<input type="text" style="width:80%;" name="checklist.changeContent">
					</td>
				</tr>
				<tr style="display:none;" class="Y">
					<td>
						<label style="width:10%;margin-left:40px;">变化原因</label>
            			<input type="text" style="width:80%;" name="checklist.changeReason">
					</td>
				</tr>
				<tr style="display:none;" class="Y">
					<td>
						<label style="width:10%;margin-left:40px;">特殊问题处理落实情况</label>
            			<input type="text" style="width:80%;" name="checklist.specialProblem">
					</td>
				</tr>
			</table>
		</fieldset>
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-decoration: underline ;text-align: center;font-size: 16px;">
			填写说明：设计、校对、审核需要对表内所有项目进行检查；填表时不能用符号代替“正确/错误”或“是/否”
		</div>
		<fieldset>
			<legend>检查内容</legend>		
			<table width="98%" class="list_table list" style="margin:5px auto" >
				<thead>
					<tr align="center">
						<th width="11%">检查项目</th>
						<th width="40%">项目要求</th>
						<th width="26%">设计检查结果</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkItemList" status="st">
						<tr>
							<td align="center" class="item"><s:property value='item'/></td>
							<td><s:property value='num'/>.&nbsp;<s:property value='demand'/></td>
							<td align="center" class="firstCheck"><input type="text" style="border:0;width:95%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></td>
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