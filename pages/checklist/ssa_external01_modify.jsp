<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		//如果还没进行过审核且当前不在审核环节，审核结果列不显示
		/* if(jn("#relUser tr").eq(1).find("td").eq(0).find("#date").text()== "" && jn("#taskName").val() != "审核"){
			jn(".audit").hide();
		} */
		
		//显示审批意见
		if(jn("#relUser tr").eq(1).find("td").eq(1).find("#date").text() == ""){
			jn("#approveComment").hide();
		}
		if(jn("#taskName").val()=="修改"){
			jn("#nomo").remove();
		}else{
			jn("#edit").remove();
		}
		//不同流程节点时页面结果与审批的不同展示
		var thisClass = "";
		if(jn("#taskName").val()=="修改"){
			thisClass = "modify";
			jn(".remark").remove();
		}
		else if(jn("#taskName").val()=="校对"){
			thisClass = "proof";
		}
		else if(jn("#taskName").val()=="审核"){
			thisClass = "audit";
		}
		else if(jn("#taskName").val()=="批准"){
			thisClass = "approve";
			jn(".remark").remove();
		}else{
			jn("#approve").remove();
		}
		
		for(var i=0;i<jn(".tbody tr").length;i++){
			
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
		<fieldset id="nomo">
		<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px ">微波所外协任务申请单</div></td>
				</tr>
				<tr>
					<td align="center" colspan="6">
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">项目代号<s:property value="checklist.modelCode"/></label>
							<label style="width: 25%;">项目名称<s:property value="checklist.productName"/></label>
							<label style="width: 25%;">研制阶段<s:property value="checklist.stage"/></label>
						</div>
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">产品代号<s:property value="checklist.productCode"/></label>
							<label style="width: 25%;">产品名称<s:property value="checklist.singleBoardName"/></label>
							<label style="width: 25%;">外协数量<s:property value="checklist.drawingCode"/></label>
						</div>
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">外协内容<s:property value="checklist.inheritDrawingCode"/></label>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:50%">
						<div style="width:110%;padding-left:5%;">
						    <label style="width: 40%;">外协项目：<s:property value="checklist.productGrade" /></label>
						    <label style="width: 40%;">产品外协：<s:property value="checklist.subClassName" /></label>
            			</div>
					</td>
            		<td align="center">
            			<div style="width:100%;padding:3px 80px;">
						    <label style="width: 40%;">申请原因及技术要求：<s:property value="checklist.changeContent" /></label>
						</div>
            			<div style="width:100%;padding:3px 80px;">
						    <label style="width: 40%;">意向外协单位：<s:property value="checklist.changeReason" /></label>
						</div>
						<div style="width:100%;padding:3px 80px;">
						    <label style="width: 40%;">是否待料外协：<s:property value="checklist.isOnFile" /></label>
						</div>
						<div style="width:100%;padding:3px 80px;">
						    <label style="width: 40%;">是否有《外协任务供方选择调研报告》：<s:property value="checklist.isClosedLoop" /></label>
						</div>
						<div style="width:100%;padding:3px 80px;">
						    <label style="width: 40%;">是否有《专用产保要求》：<s:property value="checklist.changeSection" /></label>
						</div>
            		</td>
				</tr>
				<tr>
					<td><label style="width: 40%;">申请时间：<s:property value="checklist.conclusion" /></label></td>
					<td><label style="width: 40%;">需求完成时间：<s:property value="checklist.comments" /></label></td>
				</tr>	
				<tr>
					<td style="text-align: left;" colspan="4">
						<label style="width: 40%;">备注：<s:property value="checklist.title" /></label>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;" colspan="4">上传文档</td>
				</tr>
				<tr class="file">
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="file" name="filesource"/></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr class="file">
					<td>相关文档：</td>				
					<td colspan="3">
					<s:iterator value="fileList" status="st">
						<div style="float:left;margin:0 5px;clear:both;">
							<a href="<s:property value='filePath'/>" download="<s:property value='taskFileName' />" style="color:green"><s:property value="taskFileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
						</div><br/>
					</s:iterator>
					</td>
				</tr>	
			</table>
		</fieldset>
		<fieldset id="edit">
			<table width="98%" class="list_table edit_table" style="margin:5px auto" id="itemList"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px ">微波所外协任务申请单</div></td>
				</tr>
				<tr>
					<td align="center" colspan="6">
						<div style="width:100%;padding:3px 80px;">
							<label>项目代号</label><input type="text" name="checklist.modelCode" value="<s:property value="checklist.modelCode"/>" style="width:150px;">
							<label>项目名称</label><input type="text" name="checklist.productName" value="<s:property value="checklist.productName"/>" style="width:150px;">
							<label>研制阶段</label><input type="text" name="checklist.stage" style="width:150px;">
						</div>
						<div style="width:100%;padding:3px 80px;float:left;">
							<label>产品代号</label><input type="text" name="checklist.productCode" value="<s:property value="checklist.productCode"/>" style="width:150px;">
							<label>产品名称</label><input type="text" name="checklist.singleBoardName" style="width:150px;">
							<label>外协数量</label><input type="text" name="checklist.drawingCode" style="width:150px;">
						</div>
						<div style="width:100%;padding:3px 80px;float:left;">
							<label>外协内容</label><input type="text" name="checklist.inheritDrawingCode" style="width:550px;">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:50%"><div style="font-size:13px;margin:10px ">外协项目</div>
						<div style="width:50%;padding:3px 30px;float:left;">
            				<input type="radio" value="生产外协" name="checklist.productGrade" style="margin-left:-140px" id="newChecked" checked >生产外协
            			</div>
						<div>
						<label>产品外协</label>
            				<input type="radio" value="整机" name="checklist.subClassName" style="margin-left:-100px" >整机
            				<input type="radio" value="部组件" name="checklist.subClassName" style="margin-left:-100px" >部组件
            				<input type="radio" value="无" name="checklist.subClassName" style="margin-left:-100px" >无
            			</div>
						<div style="width:50%;padding:3px 30px;float:left;">
            				<input type="radio" value="地检外协" name="checklist.productGrade" style="margin-left:-140px" >地检外协
            			</div>
						<div style="width:50%;padding:3px 30px;float:left;">
            				<input type="radio" value="技术外协" name="checklist.productGrade" style="margin-left:-140px" >技术外协
            			</div>
						<div style="width:50%;padding:3px 30px;float:left;">
            				<input type="radio" value="星上设备" name="checklist.productGrade" style="margin-left:-140px" >星上设备
            			</div>
						<div style="width:50%;padding:3px 30px;float:left;">
							<input type="radio" value="其他" name="checklist.productGrade" style="margin-left:-165px" >其他
            			</div>
						<div>
							<label>外协内容</label>
							<input type="text" name="checklist.drawingCode" style="width:150px;">
            			</div>
					</td>
            		<td align="center">
            			<div>
							<label style="width:40%;margin-left:40px;">申请原因及技术要求</label>
            				<input type="text" style="width:80%;" name="checklist.changeContent">
						</div>
            			<div>
							<label style="width:40%;margin-left:40px;">意向外协单位</label>
            				<input type="text" style="width:80%;" name="checklist.changeReason">
						</div>
						<div>
							<label style="width:70%;margin-left:40px;">是否待料外协</label>
							<input type="radio" value="是" name="checklist.isOnFile" id="isOnFileChecked"/>是
							<input type="radio" value="否" name="checklist.isOnFile"/>否
						</div>
						<div>
							<label style="width:70%;margin-left:40px;">是否有《外协任务供方选择调研报告》</label>
							<input type="radio" value="是" name="checklist.isClosedLoop" id="isClosedChecked"/>是
							<input type="radio" value="否" name="checklist.isClosedLoop"/>否
						</div>
						<div>
							<label style="width:70%;margin-left:40px;">是否有《专用产保要求》</label>
							<input type="radio" value="是" name="checklist.changeSection" id="changeuChecked"/>是
							<input type="radio" value="否" name="checklist.changeSection"/>否
						</div>
            		</td>
				</tr>	
				<tr>
					<td><label>申请时间：</label><input name="checklist.conclusion" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
					<td><label>需求完成时间：</label><input name="checklist.comments" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				</tr>	
				<tr>
					<td style="text-align: left;" colspan="4">
						<label>备注</label><input type="text" style="width:100%;" name="checklist.title"/>
					</td>
					<tr>
					<td style="text-align: left;" colspan="4">上传文档</td>
				</tr>
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="file" name="filesource"/></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>	
				<tr class="file">
					<td>相关文档：</td>				
					<td colspan="3">
					<s:iterator value="fileList" status="st">
						<div style="float:left;margin:0 5px;clear:both;">
							<a href="<s:property value='filePath'/>" download="<s:property value='taskFileName' />" style="color:green"><s:property value="taskFileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
						</div><br/>
					</s:iterator>
					</td>
				</tr>
				</tr>
			</table>
		</fieldset>
		<fieldset id="approveComment" >
			<legend>审批意见</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">
				<s:iterator value="relUserList" status="st">
					<tr>
						<td align="center" width="15%"><s:property value='checkRole.roleName'/>意见：</td>
						<td><div style="color:red;font-size:15px;white-space:normal;word-break:break-all;word-wrap:break-word;"><s:property value="approve.comments"/></div></td>
					</tr>
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