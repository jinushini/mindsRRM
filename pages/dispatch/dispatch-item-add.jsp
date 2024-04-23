<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//添加按钮
	jd("[name=addBtn]").click(function(){
		var $itemList=jd("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find("tr:eq(0)").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jd("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		})
		$newItem.initUI();
		$newItem.find("input").val("");
		//增加一行
		$itemList.append($newItem);
	})

	jd("[type=submit]").click(function(){
		var name = jd(this).attr("name");
		if(name == "saveBtn"){
			jd("input[name='isStart']").val(false);
		}else if(name = "startBtn"){
			jd("input[name='isStart']").val(true);
		}else{
			return false;
		}
		//替换index
		replaceIndex();
		
		var id = jd("input[name='id']").val();
		$.ajax({
			global:false,
			async : false,
			type:'POST',
			dataType : 'json',
			url : '../dispatch/DispatchItem_transferDispatch.action',
			data : jd('#form').serialize(),
			success : function(data, statusText){
				jd("#cancelBtn").click();
				alertMsg.correct(data.message);
			}
		})
	})
	
	//替换index
	function replaceIndex(){
		var $itemTr=jd("#itemList").find("tr");
		for(var i=0;i<$itemTr.length;i++){
			var $input=$itemTr.eq(i).find("input");
			for(var j=0;j<$input.length;j++){
				$input.eq(j).attr("name",$input.eq(j).attr("name").replace("#index",i));
			}
			
			//有待办事项
			if($input.eq(0).val()!=""&&$input.eq(2).val()=="") {
				alertMsg.error("请选择责任人");
				return false;
			}
			//有待办事项
			if($input.eq(0).val()!=""&&$input.eq(4).val()=="") {
				alertMsg.error("请选择截止日期");
				return false;
			}
		}
	}
	
	//删除按钮
	jd("[name=delBtn]").click(function(){
		if(jd("#itemList").find("tr").length>1){
			$(this).parent().parent().remove();
		}else{
			alertMsg.error("操作失败！");
		}
	});
	
</script>
<div class="pageContent">
	<form id="form" method="post" class="pageForm required-validate">
		<div class="pageFormContent" layoutH="56">
	  		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
			<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
			<input type="hidden" name="id" value="<s:property value="id"/>">
			<input type="hidden" name="isNew" value="<s:property value="isNew"/>">
			<input type="hidden" name="isStart" value="<s:property value="isStart"/>">
			<br/>
			<fieldset>
			<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
				<table class="list_table edit_table" width="98%">
					<thead>
						<tr>
							<th width="40%">事项描述</th>
							<th width="15%">责任人</th>
							<th width="10%">完成形式</th>
							<th width="10%">截止日期</th>
							<th width="5%">操作</th>
						</tr>
					</thead>
					<tbody id="itemList">
						<%-- <tr>
							<td style="font-weight: bold;"><s:property value="dispatch.taskDefinitionStr"/></td>
							<td align="center" style="font-weight: bold;"><s:property value="dispatch.receiveUser.name"/></td>
							<td align="center"><s:property value="dispatch.completeForm"/></td>
							<td align="center"><s:date name="dispatch.scheduleDate.planEndDate" format="yyyy-MM-dd" /></td>
							<td></td>
						</tr> --%>
						<tr>
							<td><input name="meetingDispatchs[#index].itemContent" value="<s:property value="dispatch.taskDefinitionStr"/>" style="width: 98%;"></td>
							<td>
								<input name="meetingDispatchs[#index].responsibleId" type="hidden" value="<s:property value="dispatch.receiveUser.id"/>">
								<input name="meetingDispatchs[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly" value="<s:property value="dispatch.receiveUser.name"/>">
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="true">
								</a>
							</td>
							<td><input name="meetingDispatchs[#index].completeForm" value="<s:property value="dispatch.completeForm"/>" style="width: 98%;"></td>
							<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" value="<s:date name="dispatch.scheduleDate.planEndDate" format="yyyy-MM-dd" />" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
							<td><a name="delBtn" href="###" style="color : red;">删除</a></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button name="saveBtn" type="submit">保存</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button name="startBtn" type="submit">保存并启动</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>