<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
		
	//控制流程不同界面中item表不同显示列数和审批意见
	if(jd("#relUser tr").eq(1).find("td").eq(0).find("#date").text() == ""){
		jd(".audit").hide();
	}
	if(jd("#relUser tr").eq(0).find("td").eq(1).find("#date").text() == ""){
		jd(".proof").hide();
	}
	
	//显示审批意见
	if(jd("#relUser tr").eq(1).find("td").eq(1).find("#date").text() != ""){
		jd("#approveComment").show();
		jd("#approveComment tr:eq(3)").show();
	}
		
	//合并单元格
	var j = 0;		
	for(var i=1;i<jd("#item tr").length+1;i++){
		var $referCol = jd("#item tr").eq(i-j).find("td:eq(0)");
		var $itemCol = jd("#item tr").eq(i+1).find("td:eq(0)");
		if($itemCol.text() == $referCol.text() ){
			$itemCol.hide();
			j = j+1;
		}else{
			$referCol.attr("rowspan",j+1);
			j = 0;
		}
	}
		
	if(jd("#changeSection").val()=="电性星无变化"||jd("#changeSection").val()=="鉴定件无变化"||jd("#changeSection").val()=="正样无变化"){
		jd("[name='Y']").hide();
		jd("#singleBoardCharacter").attr("rowspan","1")
	}
		
		//检查结果在单元格内的输出格式
		for(var i=1;i<jd("#item tr").length;i++){
			var $span = jd("#item tr").eq(i).find("span");
			for(j=0;j<$span.length;j++){
				var text = "";
				var arr = $span.eq(j).text().split('㊣');
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
				$span.eq(j).empty().append(text);
			}
		}
		
		//切换完整版本与最终版本
		jd("#switchShow").change(function(){
			$.pdialog.reload("../checklist/checklistAppr!showChecklist.action?flag="+jd("#switchShow").val()+"&checklistId="+jd("[name='checklistId']").val());
			
		})
		//完整版本与最终版本下拉框默认选中
		if(jd("#flag").val()!=""){
			jd("#switchShow").val(jd("#flag").val());
		}
		
		jd("#fullScrBtn").click(function(){
			jd(".maximize").click();
		})

</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!drawingCheckSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
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
				<tr>
					<td align="center" colspan="6" style="padding:20px">
						<span style="font-size:23px;width:80%"><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</span>
						<input type="hidden" id="flag" value="<s:property value='flag' />"/>
						<select id="switchShow" style="width:100px;float:right;margin-left:-100px;">
							<option value="final">最终版本</option>
							<option value="whole">完整版本</option>
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
					<td width="20%" name="proof">校对检查结果</td>
					<td width="20%" name="audit">审核检查结果</td>
				</tr>
				<s:iterator value="checkResultList" status="st" >
					<tr>
						<td align="center" rowspan=""><s:property value='checkItem.item'/></td>
						<td style="padding:10px 20px;"><s:property value='checkItem.num'/>.&nbsp;<s:property value='checkItem.demand'/></td>
						<td style="padding:5px 15px;font-size:15px;">
							<span <s:if test="conclusion == '不通过'"> style='color:red;' </s:if>><s:property value='firstCheck'/></span>
						</td>
						<td style="padding:5px 15px;font-size:15px;" name="proof">
							<span><s:property value='secondCheck'/></span>
						</td>
						<td style="padding:5px 15px;font-size:15px;" name="audit">
							<span><s:property value='thirdCheck'/>
						</td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
		<fieldset id="approveComment" style="display: none;">
			<legend>审批意见</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<s:iterator value="relUserList" status="st">
					<tr>
						<td align="center" width="15%"><s:property value='checkRole.roleName'/>意见：</td>
						<td><div style="width: 90%; color:red;"><s:property value="comments"/></div></td>
					</tr>
				</s:iterator>
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
			<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>