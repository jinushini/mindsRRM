<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){  
		//动态添加input输入框的name
		for(var i=1;i<jn("#item tr").length;i++){
			if(jn("#taskName").val() == "修改"){
				jn("#item tr").eq(i).find("td input:eq(0)").attr("name","checkResultList["+(i-1)+"].designResult");
				jn("[name='conclusion']").hide();
				jn("#approve").remove();
			}
			if(jn("#taskName").val() == "校对"){
				jn("#item tr").eq(i).find("td input:eq(0)").attr("name","checkResultList["+(i-1)+"].proofResult");
				jn("#approve").remove();
			}
			if(jn("#taskName").val() == "审核"){
				jn("#item tr").eq(i).find("td input:eq(0)").attr("name","checkResultList["+(i-1)+"].auditResult");
				jn("[name='audit']").show();
				jn("#approve").remove();
			}
			if(jn("#taskName").val() == "批准"){
				jn("[name='conclusion']").hide();
			}
			jn("#item tr").eq(i).find("td select").attr("name","checkResultList["+(i-1)+"].conclusion");
		}
		
		
		if(jn("#relUser tr").eq(1).find("td").eq(0).find("#date").text()!= ""){
			jn("[name='audit']").show();
		}
		
		
		//显示审批意见
		if(jn("#relUser tr").eq(1).find("td").eq(1).find("#date").text()!=""){
			jn("#approveComment").show();
			jn("#approveComment tr:eq(0)").hide();
			jn("#approveComment tr:eq(1)").hide();
			jn("#approveComment tr:eq(2)").hide();
		}
		
		
		//合并单元格
		var j = 0;		
		for(var i=1;i<jn("#item tr").length+1;i++){
			var $referCol = jn("#item tr").eq(i-j).find("td:eq(0)");
			var $itemCol = jn("#item tr").eq(i+1).find("td:eq(0)");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				j = j+1;
			}else{
				$referCol.attr("rowspan",j+1);
				j = 0;
			}
		}
		
		if(jn("#changeSection").val()=="电性星无变化"||jn("#changeSection").val()=="鉴定件无变化"||jn("#changeSection").val()=="正样无变化"){
		jn("[name='Y']").hide();
		jn("#singleBoardCharacter").attr("rowspan","1")
	}
		
		//检查结果在单元格内的输出格式
		for(var i=1;i<jn("#item tr").length;i++){
			var $span = jn("#item tr").eq(i).find("span");
			for(j=0;j<$span.length;j++){
				var text = "";
				var arr = $span.eq(j).text().split('㊣');
				if(arr.length==1){
					text = arr[0];
				}else{
					for(var k=0;k<arr.length;k++){
						if(k==0){
							text = "原："+arr[k]+"<br/><br/>";
						}else if(k==arr.length-1){
							text = text+"改："+arr[k]
						}else{
							text = text+"改："+arr[k]+"<br/><br/>";
						}
					}
				}
				$span.eq(j).empty().append(text);
			}
		}
		
		//切换完整版本与最终版本
		jn("#switchShow").change(function(){
			navTab.reload("../checklist/checklistAppr!checklistModifyInput.action?flag="+jn("#switchShow").val()+"&taskId="+jn("[name='taskId']").val()+"&processInstId="+jn("[name='processInstId']").val());
		})
		//完整版本与最终版本下拉框默认选中
		if(jn("#flag").val()!=""){
			jn("#switchShow").val(jn("#flag").val());
		}
	})
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!drawingCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId' />"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId' />"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	<input type="hidden"  name=approve.id value="<s:property value='approve.id' />"/>
	<input type="hidden" value="<s:property value='checklist.id' />" name="checklistId" />
	<input type="hidden" value="<s:property value='checklist.comments'/>" id="comments"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr >
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
							<label style="width: 25%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 25%;">产品代号：<s:property value="checklist.productCode"/></label>
						</div>
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">单板名称：<s:property value="checklist.singleBoardName"/></label>
							<label style="width: 25%;">图纸代号：<s:property value="checklist.drawingCode"/></label>
							<label style="width: 25%;">研制阶段：<s:property value="checklist.stage"/></label>
						</div>
					</td>
				</tr>
				
				
				<tr>
					<td align="center" width="20%"><s:property value="checklist.isInherit" /></td>
					<s:if test="checklist.isInherit == '新增单板'">
						<td style="padding-left:5%;"><s:property value="checklist.newSingleBoardNote" /></td>
					</tr>
					</s:if>
					<s:else>
						<td>
							<div style="width:110%;padding-left:5%;">
            					<label style="width: 40%;">继承分机名称：<s:property value="checklist.inheritExtensionName" /></label>
            					<label style="width: 40%;">继承单板名称：<s:property value="checklist.inheritSingleBoardName" /></label>
            				</div>
            				<div style="width:110%;padding-left:5%;">
            					<label style="width: 40%;">继承图纸代号：<s:property value="checklist.inheritDrawingCode" /></label>
            					<label style="width: 40%;">继承研制阶段：<s:property value="checklist.inheritStage" /></label>
            				</div>
						</td>
					</tr>
					<tr>
						<td align="center" width="20%" rowspan="4" id="singleBoardCharacter">单板特性</td>
						<td style="padding-left:5%;">
							相对于继承单板：<s:property value="checklist.changeSection" />
							<input type="hidden" value="<s:property value='checklist.changeSection' />" id="changeSection" />
						</td>
					</tr>
					<tr name="Y">
						<td style="padding-left:5%;">变化内容：<s:property value="checklist.changeContent" /></td>
					</tr>
					<tr name="Y">
						<td style="padding-left:5%;">变化原因：<s:property value="checklist.changeReason" /></td>
					</tr>
					<tr name="Y">
						<td style="padding-left:5%;">特殊问题处理单落实情况：<s:property value="checklist.specialProblem" /></td>
					</tr>
					</s:else>
			</table>
		</fieldset>
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-decoration: underline ;text-align: center;font-size: 16px;">
			填写说明：设计、校对、审核需要对表内所有项目进行检查；填表时不能用符号代替“正确/错误”或“是/否”
		</div>
		<fieldset>
			<legend>检查内容</legend>
			<table width="98%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word" id="item">
				<tr align="center">
					<td width="8%">检查项目</td>
					<td width="18%">项目要求</td>
					<td width="20%">设计检查结果</td>
					<td width="20%">校对检查结果</td>
					<td width="20%" name="audit" style="display:none;">审核检查结果</td>
					<td width="9%" name="conclusion">结论</td>
				</tr>
				<s:iterator value="resultList" status="st" >
					<tr>
						<td align="center" rowspan=""><s:property value='checkItem.item'/></td>
						<td style="padding:10px 20px;"><s:property value='checkItem.num'/>.&nbsp;<s:property value='checkItem.demand'/></td>
						<td style="padding:5px 15px">
							<span <s:if test="conclusion == '不通过'">style='color:red;'</s:if>><s:property value='designResult'/></span><br/><br/>
							<s:if test="taskName == '修改' ">
								<input type="text" name="" value="">
							</s:if>
						</td>
						<td style="padding:5px 15px" name="proof">
							<span><s:property value='proofResult'/></span><br/><br/>
							<s:if test="taskName == '校对' ">
								<input type="text" name="" value="">
							</s:if>
						</td>
						<td style="padding:5px 15px;display:none;" name="audit">
							<span><s:property value='auditResult'/></span><br/><br/>
							<s:if test="taskName == '审核' ">
								<input type="text" name="" value="">
							</s:if>
						</td>
						<td style="padding:5px 17px 1px;" name="conclusion">
							<select name="" style="width:70px">
								<option value="通过">通过</option>
								<option value="不通过">不通过</option>
							</select>
						</td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
		<fieldset id="approveComment" style="display: none;" >
			<legend>审批意见</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<s:iterator value="userList" status="st">
					<tr>
						<td align="center" width="15%"><s:property value='checkRole.roleName'/>意见：</td>
						<td><div style="width: 90%; color:red;"><s:property value="comments"/></div></td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
		<fieldset id="approve">
			<legend>任务处理</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<tr>
					<td  width="30%" align="center">审批结论：</td>
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
				<s:iterator value="userList" status="st">      
				  	<s:if test="#st.odd||#st.first">      
             	 		<tr>          
         			</s:if>      
        			<td width="50%">
						<span id="roleName" style="font-size:15px"><s:property value='checkRole.roleName'/></span>：
						<s:property value='user.name'/>
						<s:if test="submitDate != null ">
							&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="date" style="font-size:14px">提交日期:<s:date name="submitDate" format="yyyy-MM-dd HH:mm"/></span>
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
			<%-- <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>