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
				if(jn("#switchShow").val() == "whole"){
					text = $thisDiv.text().split("㊣").pop().slice(0,-19);
				}else{
					text=$thisDiv.text();
				}
				
				//不同流程节点时页面结果与审批的不同展示
				
				if(jn("#taskName").val() == "修改"){
					//先根据后台数据展示结果中可修改的部分
					if($thisDiv.parent().find("input").attr("type")=="radio"){
						$thisDiv.parent().find("input[value='"+text+"']").prop("checked","checked");
					}else{
						$thisDiv.parent().find("textarea").val(text);
					}
					//再根据“完整版”和“最终版”决定div是“加白色背景”还是“隐藏掉”   //div加上背景色后用户容易将div和输入框看混，所以不加背景色
					if(jn("#switchShow").val() == "whole" && $thisDiv.text() != ""){
						$("<br/>").insertAfter($thisDiv);
						/* $thisDiv.attr("style","background-color:#FFFFFF;width:98%;font-size:15px;margin:4px 0 -13px 4px;padding:5px;"); */
					}else{
						$thisDiv.hide();
					}
					jn("#approve").remove();
					/* if(j==1){
						$thisDiv.parent().find("input").attr("name","checkResultList["+ i +"].secondCheck");
					} */
				}else{
					//审批页面因为td中还存在单选框和文本框，所有先把td内容清空再写入检查结果
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
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!alterInformCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId'/>"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto;"> 
				<tr>
					<tr >
					<td align="center" colspan="6" style="padding:20px"  style="font-size:13px;">
						单机（组件）环境试验条件<div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</div>
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
							<label style="width: 20%;">所属型号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 20%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 20%;">产品代号：<s:property value="checklist.productCode"/></label>
						</div>
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">单机编号：<s:property value="checklist.productNum"/></label>
							<label style="width: 20%;">检查单编号：<s:property value="checklist.checklistNum"/></label>
							<label style="width: 20%;">研制阶段：<s:property value="checklist.stage"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>内容</legend>
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<tr>
							<td align="center" class="item" width="30%"><s:property value='checkItem.item'/></td>
							<td width="70%">
								<div style="padding:5px;font-size:15px;"><s:property value='firstCheck'/></div>
								<s:if test="#st.index+1==1">
									<input type="radio" name="checkResultList[0].firstCheck" value="电性件" checked />电性件<br/>
									<input type="radio" name="checkResultList[0].firstCheck" value="鉴定级" />鉴定级<br/>
									<input type="radio" name="checkResultList[0].firstCheck" value="准鉴定级" />准鉴定级<br/>
									<input type="radio" name="checkResultList[0].firstCheck" value="验收级" />验收级
								</s:if>
								<s:if test="#st.index+1==2">
									<input type="radio" name="checkResultList[1].firstCheck" value="试验条件变更" checked />试验条件变更<br/>
									<input type="radio" name="checkResultList[1].firstCheck" value="试验流程调整" />试验流程调整<br/>
									<input type="radio" name="checkResultList[1].firstCheck" value="再试验申请" />再试验申请
								</s:if>
								<s:if test="#st.index+1==3">
									<textarea rows="2" name="checkResultList[2].firstCheck" style="border:0;width:98%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></textarea>
								</s:if>
								<s:if test="#st.index+1==4">
									<textarea rows="6" name="checkResultList[3].firstCheck" style="border:0;width:98%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></textarea>
								</s:if>
								<s:if test="#st.index+1==5">
									<textarea rows="2" name="checkResultList[4].firstCheck" style="border:0;width:98%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></textarea>
								</s:if>
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