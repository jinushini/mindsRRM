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
		var text="";
		
		for(var j=0;j<$thisRow.find("div").length;j++){
			var $thisDiv = $thisRow.find("div").eq(j);
			if(jn("#switchShow").val() == "whole" && $thisDiv.text() != ""){
				text = $thisDiv.text().split("㊣").pop().slice(0,-19);
			}else{
				text=$thisDiv.text();
			}
			
			//不同流程节点时页面结果与审批的不同展示，以及动态加上input输入框的name
			
			if(jn("#taskName").val() == "修改"){
				//先根据后台数据展示结果中可修改的部分
				if($thisDiv.parent().find("input").attr("type")=="radio"){
					$thisDiv.parent().find("input[value='"+text+"']").prop("checked","checked");
				}else{
					$thisDiv.parent().find("input").val(text);
				}
				//再根据“完整版”和“最终版”决定div是否“隐藏掉”
				if(jn("#switchShow").val() == "whole" && $thisDiv.text() != ""){
					$("<br/>").insertAfter($thisDiv);
				}else{
					$thisDiv.hide();
				}
				
				jn("#approve").remove();
				
				if(j==1){
					$thisDiv.parent().find("input").attr("name","checkResultList["+ i +"].secondCheck");
				}
			}else{
				//审批页面因为td中还存在单选框和文本框，所有先把td内容清空再写入检查结果，即只留下不可改的div
				$thisDiv.parent().text("").append($thisDiv);
			}
			
			//将检查结果从㊣字符处切开，规整成“原：”“改”的形式
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
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!pdaseCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId'/>"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="100%" class="edit_table" style="margin:5px auto;"> 
				<tr>
					<tr >
					<td align="center" colspan="6" style="padding:20px"  style="font-size:13px;">
						<div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</div>（参照QW-Q-20-27-2013/航天器产品验收管理规定拟制，有裁剪）
						<input type="hidden" id="flag" value="<s:property value='flag' />"/>
						<select id="switchShow" style="width:100px;float:right;margin:-35px 0 0 -100px;">
							<option value="final">最终版本</option>
							<option value="whole">完整版本</option>
						</select>
					</td>
				</tr>
				</tr>
				<tr>
					<td align="left">
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">型号代号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 20%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 20%;">产品代号：<s:property value="checklist.productCode"/></label>
							<label style="width: 20%;">所属分系统：<s:property value="checklist.subSystem"/></label>
						</div>
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">阶段标志：<s:property value="checklist.stage"/></label>
							<label style="width: 20%;">产品编号：<s:property value="checklist.productNum"/></label>
							<label style="width: 20%;">产品类别：<s:property value="checklist.productType"/></label>
							<label style="width: 20%;">数量：<s:property value="checklist.productSum"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>自查内容</legend>
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center">
						<th width="10%">交验自查项目</th>
						<th width="20%">自查结果</th>
						<th width="30%">备注</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<tr>
							<td class="item" align="center"><s:property value='checkItem.item'/></td>
							<td>
								<div style="padding:5px;font-size:15px;"><s:property value='firstCheck'/></div>
								<s:if test="#st.index+1==1">
									<input type="radio" value="齐全" name="checkResultList[0].firstCheck" />齐全<br/>
									<input type="radio" value="未齐全" name="checkResultList[0].firstCheck" />未齐全
								</s:if>
								<s:if test="#st.index+1==2">
									<input type="radio" value="齐备" name="checkResultList[1].firstCheck" />齐备<br/>
									<input type="radio" value="未齐备" name="checkResultList[1].firstCheck" />未齐备
								</s:if>
								<s:if test="#st.index+1==3">
									<input type="radio" value="齐备" name="checkResultList[2].firstCheck" />齐备<br/>
									<input type="radio" value="未齐备" name="checkResultList[2].firstCheck" />未齐备
								</s:if>
								<s:if test="#st.index+1==4">
									<input type="radio" value="有，已完成关键检验点项目检查" name="checkResultList[3].firstCheck" />有，已完成关键检验点项目检查<br/>
									<input type="radio" value="有，未完成关键检验点项目检查" name="checkResultList[3].firstCheck" />有，未完成关键检验点项目检查<br/>
									<input type="radio" value="无" name="checkResultList[3].firstCheck" />无
								</s:if>
								<s:if test="#st.index+1==5">
									<input type="radio" value="有，已完成强制检验点项目检查" name="checkResultList[4].firstCheck" />有，已完成强制检验点项目检查<br/>
									<input type="radio" value="有，未完成强制检验点项目检查" name="checkResultList[4].firstCheck" />有，未完成强制检验点项目检查<br/>
									<input type="radio" value="无" name="checkResultList[4].firstCheck" />无
								</s:if>
								<s:if test="#st.index+1==6">
									<input type="radio" value="无设计偏离" name="checkResultList[5].firstCheck" />无设计偏离<br/>
									<input type="radio" value="无生产超差" name="checkResultList[5].firstCheck" />无生产超差<br/>
									<input type="radio" value="偏离超差项已办理申请，并获得批准" name="checkResultList[5].firstCheck" />偏离超差项已办理申请，并获得批准<br/>
									<input type="radio" value="偏离超差项已办理申请，正在分系统总体审批中" name="checkResultList[5].firstCheck" />偏离超差项已办理申请，正在分系统总体审批中<br/>
									<input type="radio" value="未检查" name="checkResultList[5].firstCheck" />未检查
								</s:if>
								<s:if test="#st.index+1==7">
									<input type="radio" value="无技术状态更改" name="checkResultList[6].firstCheck" />无技术状态更改<br/>
									<input type="radio" value="技术状态更改已落实，并有检查表" name="checkResultList[6].firstCheck" />技术状态更改已落实，并有检查表<br/>
									<input type="radio" value="技术状态更改已落实，未有检查表" name="checkResultList[6].firstCheck" />技术状态更改已落实，未有检查表<br/>
									<input type="radio" value="有技术状态更改，落实有误" name="checkResultList[6].firstCheck" />有技术状态更改，落实有误<br/>
									<input type="radio" value="未检查" name="checkResultList[6].firstCheck" />未检查
								</s:if>
								<s:if test="#st.index+1==8">
									<input type="radio" value="无质量问题" name="checkResultList[7].firstCheck" />无质量问题<br/>
									<input type="radio" value="有质量问题，已归零" name="checkResultList[7].firstCheck" />有质量问题，已归零<br/>
									<input type="radio" value="有质量问题，未归零" name="checkResultList[7].firstCheck" />有质量问题，未归零<br/>
									<input type="radio" value="未检查" name="checkResultList[7].firstCheck" />未检查
								</s:if>
								<s:if test="#st.index+1==9">
									<input type="text" name="checkResultList[8].firstCheck" style="border:0;width:95%;text-align:center;font-size:15px;margin:4px 0 4px 4px;padding:5px;" >
								</s:if>
							</td>
							<td>
								<div style="padding:5px;font-size:15px;"><s:property value='secondCheck'/></div>
								<input type="text" style="border:0;width:97%;text-align:center;font-size:15px;margin:4px 0 4px 4px;padding:5px;"" >
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		
		<fieldset id="approve">
			<legend>任务处理</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过" id="pass">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过">不通过
						</span>
					</td>
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
							<span style="font-size:14px">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
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