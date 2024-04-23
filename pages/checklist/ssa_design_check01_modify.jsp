<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		
		//切换完整版本与最终版本
		jn("#switchShow").change(function(){
			navTab.reload("../checklist/checklistAppr!checklistModifyInput.action?flag="+jn("#switchShow").val()+"&taskId="+jn("[name='taskId']").val()+"&processInstId="+jn("[name='processInstId']").val());
		})
		
		//完整版本与最终版本下拉框默认选中
		if(jn("#flag").val()!=""){
			jn("#switchShow").val(jn("#flag").val());
		}
		
		//如果还没进行过审核且当前不在审核环节，审核结果列不显示
		if(jn("#relUser tr").eq(1).find("td").eq(0).find("#date").text()== "" && jn("#taskName").val() != "审核"){
			jn(".audit").hide();
		}
		
		//显示审批意见
		if(jn("#relUser tr").eq(1).find("td").eq(1).find("#date").text() == ""){
			jn("#approveComment").hide();
		}

		//不同流程节点时页面结果与审批的不同展示
		var thisClass = "";
		if(jn("#taskName").val()=="修改"){
			thisClass = "modify";
			jn(".remark").remove();
		}
		if(jn("#taskName").val()=="校对"){
			thisClass = "proof";
		}
		if(jn("#taskName").val()=="审核"){
			thisClass = "audit";
		}
		if(jn("#taskName").val()=="批准"){
			thisClass = "approve";
			jn(".remark").remove();
		}else{
			jn("#approve").remove();
		}
		
		var z = 0;
		for(var i=0;i<jn(".tbody tr").length;i++){
			
			//合并单元格
			var $referCol = jn(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jn(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
			
			//检查结果在单元格内的输出格式
			var $thisRow = jn(".tbody tr").eq(i);
			
			if(jn("#taskName").val() == "修改"){
				$thisRow.find(".modify input").show();
				$thisRow.find(".modify input").attr("name","checkResultList["+ i +"].firstCheck");
			}
			if(jn("#taskName").val() == "校对"){
				$thisRow.find(".proof input").show();
				$thisRow.find(".proof input").attr("name","checkResultList["+ i +"].secondCheck");
			}
			if(jn("#taskName").val() == "审核"){
				$thisRow.find(".audit input").show();
				$thisRow.find(".audit input").attr("name","checkResultList["+ i +"].thirdCheck");
			}
			$thisRow.find(".remark select").attr("name","checkResultList["+ i +"].remark");
			
			for(var j=0;j<$thisRow.find("div").length;j++){
				var text="";
				var $thisDiv = $thisRow.find("div").eq(j);
				if(jn("#switchShow").val() == "whole"){
					text = $thisDiv.text().split("㊣").pop().slice(0,-19);
				}else{
					text=$thisDiv.text();
				}
				if($thisDiv.parent().attr("class")==thisClass){
					$thisDiv.parent().find("input").val(text);
					//再根据“完整版”和“最终版”决定div是“加白色背景”还是“隐藏掉”   //div加上背景色后用户容易将div和输入框看混，所以不加背景色
					if(jn("#switchShow").val() == "whole" && $thisDiv.text() != ""){
						$("<br/>").insertAfter($thisDiv);
					}else{
						$thisDiv.hide();
					}
				}else{
					//因为td中还存在文本框，所有先把td内容清空再写入检查结果
					$thisDiv.parent().text("").append($thisDiv);
				}
				
				//将检查结果从㊣字符处切开，规整成“原：”“改:”的形式
				var arr = $thisDiv.text().split('㊣');
				if(arr.length==1){
					text = arr[0];
				}else{
					for(var k=0;k<arr.length;k++){
						if(k==0){
							text = "<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
						}else if(k==arr.length-1){
							text = text+"<span style='color:#3DAB0B;font-size:15px;'>改：</span>"+arr[k];
						}else{
							text = text+"<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
						}
					}
				}
				$thisDiv.empty().append(text);
			}
		}
	})
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!drawingCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId' />"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId' />"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" style="padding:20px">
							<span style="font-size:23px;"><s:property value="headline"/> ·V<s:property value="version"/>版</span>
							<input type="hidden" id="flag" value="<s:property value='flag' />"/>
							<select id="switchShow" style="width:100px;float:right;margin-left:-100px;">
								<option value="whole">完整版本</option>
								<option value="final">最终版本</option>
							</select>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">型号代号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 25%;">单机名称：<s:property value="checklist.productName"/></label>
							<label style="width: 25%;">图纸代号：<s:property value="checklist.drawingCode"/></label>
						</div>
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">研制阶段：<s:property value="checklist.stage"/></label>
						</div>
					</td>
				</tr>
				
				<tr>
					<td align="center" width="20%" id="isInherit"><s:property value="checklist.isInherit"/></td>
					<td>
						<div style="width:110%;padding-left:5%;">
            				<label style="width: 40%;">借用分机名称：<s:property value="checklist.inheritExtensionName" /></label>
            				<label style="width: 40%;">单板名称：<s:property value="checklist.inheritSingleBoardName" /></label>
            			</div>
            			<div style="width:110%;padding-left:5%;">
            				<label style="width: 40%;">图纸代号：<s:property value="checklist.inheritDrawingCode" /></label>
            				<label style="width: 40%;">研制阶段：<s:property value="checklist.inheritStage" /></label>
            			</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-decoration: underline ;text-align: center;font-size: 16px;">
			填写说明：设计、校对、审核需要对表内所有项目进行检查；填表时不能用符号代替“正确/错误”或“是/否”
		</div>
		<fieldset>
			<legend>检查内容</legend>			
			<table width="98%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word" id="item">
				<thead>
					<tr align="center">
						<th width="8%">检查项目</th>
						<th width="15%">项目要求</th>
						<th width="20%" class="modify">设计检查结果</th>
						<th width="20%" class="proof">校对检查结果</th>
						<th width="20%" class="audit">审核检查结果</th>
						<th width="6%" class="remark">结论</th>
					</tr>
				</thead>
				<tbody class="tbody">
				<s:iterator value="checkResultList" status="st" >
						<tr>
							<td align="center" class="item"><s:property value='checkItem.item'/></td>
							<td style="padding:10px 20px;"><s:property value='checkItem.num'/>.&nbsp;<s:property value='checkItem.demand'/></td>
							<td class="modify">
								<div style="padding:5px;font-size:15px; <s:if test="remark == '不通过'">color:red;</s:if>"><s:property value='firstCheck'/></div>
								<input type="text" style="display:none;border:0;width:94%;font-size:15px;margin:4px 0 4px 4px;padding:5px;<s:if test="remark == '不通过'">color:red;</s:if>">
							</td>
							<td class="proof">
								<div style="padding:5px;font-size:15px; "><s:property value='secondCheck'/></div>
								<input type="text" style="display:none;border:0;width:94%;font-size:15px;margin:4px 0 4px 4px;padding:5px;">
							</td>
							<td class="audit">
								<div style="padding:5px;font-size:15px; "><s:property value='thirdCheck'/></div>
								<input type="text" style="display:none;border:0;width:94%;font-size:15px;margin:4px 0 4px 4px;padding:5px;">
							</td>
							<td style="padding:5px 10px 1px;" class="remark">
								<select style="width:70px">
									<option value="通过">通过</option>
									<option value="不通过">不通过</option>
								</select>
							</td>
						</tr>
						</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset id="approveComment" style="display: none;" >
			<legend>审批意见</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<s:iterator value="userList" status="st">
					<s:if test="#st.index+1==4">
						<tr>
							<td align="center" width="15%"><s:property value='checkRole.roleName'/>意见：</td>
							<td><div style="width: 90%; color:red;"><s:property value="approve.comments"/></div></td>
						</tr>
					</s:if>
				</s:iterator>
			</table>
		</fieldset>
		<fieldset id="approve">
			<legend>任务处理</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过">不通过
						</span>
					</td>
				</tr>
				<tr>
					<td align="center">审批意见：</td>
					<td><textarea name="approve.comments" style="width: 90%;" rows="10" cols=""></textarea></td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>		
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="relUserList" status="st">      
				  	<s:if test="#st.odd||#st.first">      
             	 		<tr>          
         			</s:if>      
        			<td width="50%">
						<span style="font-size:15px"><s:property value='checkRole.roleName'/></span>：
						<s:property value='user.name'/>
						<s:if test="approve != null ">
							&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="date" style="font-size:14px">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
						</s:if>
					</td> 
        			<s:if test="#st.even||#st.last">      
            			</tr>          
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