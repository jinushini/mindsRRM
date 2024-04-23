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
	//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name='delBtn']").click(function(){
			if(jn(".edit_table").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	});
		
	//添加文档按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn(".list_table");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delBtn]").click(function(){
			if(jn(".edit_table").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});	
		
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklist!checklistBuildSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="checklist.checklistType" value="<s:property value='checklistType'/>"/>
	<input type="hidden" name="checklist.version" value="<s:property value='version'/>"/>
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
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
						<!-- <div style="width:100%;padding:3px 80px;float:left;">
							<label>外协内容</label>
						</div> -->
					</td>
				</tr>
				<tr>
				<tr>
				</tr>
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
            		<td>
            			<div style="width:50%;padding:3px 30px;float:left;">
            				<label>申请原因及技术要求</label><input type="text" style="width:50%;" name="checklist.changeContent"><br/>
						</div>
            			<div style="width:50%;padding:3px 30px;float:left;">
							<label>意向外协单位</label><input type="text" style="width:50%;" name="checklist.changeReason">
						</div>
						<div style="width:50%;">
							<label style="width:70%;margin-left:40px;">是否待料外协</label><input type="radio" value="是" name="checklist.isOnFile" id="isOnFileChecked"/>是<input type="radio" value="否" name="checklist.isOnFile"/>否
						</div>
						<div style="width:50%;">
							<label style="width:70%;margin-left:40px;">是否有《外协任务供方选择调研报告》</label><input type="radio" value="是" name="checklist.isClosedLoop" id="isClosedChecked"/>是<input type="radio" value="否" name="checklist.isClosedLoop"/>否
						</div>
						<div style="width:50%;">
							<label style="width:70%;margin-left:40px;">是否有《专用产保要求》</label><input type="radio" value="是" name="checklist.changeSection" id="changeuChecked"/>是<input type="radio" value="否" name="checklist.changeSection"/>否
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
				</tr>
				<tr>
					<td style="text-align: left;" colspan="4">上传文档<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
				</tr>
				<tr class="file">
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="file" name="filesource"/></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>	
			</table>
		</fieldset>
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-align: center;font-size: 16px;">
			1.本申请单将作为微波所外协管理人员计划申请和投产的依据<br/>
			2.外协单位需在现有分院合格供方名录中选择<br/>
			3.工序外协需提供签署完整的图纸和加工信息表（M样产品提供电子版即可）<br/>
			4.外协技术要求需签署完整，外协任务需提供厂家选择调研报告（工序外协除外），产品外协需提供《专用产保要求》并归档<br/>
			5.校对请选微波所：郭晋<br/>
		</div>
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