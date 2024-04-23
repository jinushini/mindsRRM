<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		
		//显示审批意见
		if(jd("#relUser tr").eq(1).find("td").eq(1).find("#date").text()!=""){
			jd("#approveComment").show();
			jd("#approveComment tr:eq(3)").show();
		}
		
	//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name='delBtn']").click(function(){
			if(jn(".edit_table").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	})
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px ">微波所外协任务申请单</div></td>
				</tr>
				<tr>
					<td colspan="6">
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
					<td align="center" rowspan="">相关文档：</td>				
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
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-decoration: underline ;text-align: center;font-size: 16px;">
			1.本申请单将作为微波所外协管理人员计划申请和投产的依据<br/>
			2.外协单位需在现有分院合格供方名录中选择<br/>
			3.工序外协需提供签署完整的图纸和加工信息表（M样产品提供电子版即可）<br/>
			4.外协技术要求需签署完整，外协任务需提供厂家选择调研报告（工序外协除外），产品外协需提供《专用产保要求》并归档<br/>
			5.校对请选微波所：郭晋<br/>
		</div>
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
			<li><a class="button" id="fullScrBtn"><span>全屏查看</span></a></li>
			<li><a class="button" id="print" href="../checklist/print!printChecklist.action?checklistId=<s:property value='checklist.id'/>"><span>生成Word</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
</div>