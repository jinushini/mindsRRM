<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//添加按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find("tr:eq(0)").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jn("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		});
		$newItem.initUI();
		$newItem.find("input").not("input:first").val("");
		
		//增加一行
		$itemList.append($newItem);
		addIndex();

	});
	 
	//区别模板详情的行号
 	function addIndex(){
		var $itemTr = jn("#itemList").find("tr");
		for (var i = 0; i < $itemTr.length; i++) { 
			var $input = $itemTr.eq(i).find("input");
			for(var j = 0; j< $input.length; j++){				
				var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
				$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+i+"]"));		
				if(j == $input.length-1){
					var $a = $itemTr.eq(i).find(".model");
					var lookupGroup = $input.eq(j).attr("lookupGroup").substring($input.eq(j).attr("lookupGroup").indexOf("["));	
					$input.eq(j).attr("lookupGroup",$input.eq(j).attr("lookupGroup").replace(lookupGroup, "["+i+"]"));
					$a.attr("lookupGroup",$a.attr("lookupGroup").replace(lookupGroup, "["+i+"]"));
				}				
			}
		} 
	}
	
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn("#itemList").find("tr").length>1){
			$(this).parent().parent().remove();
		}else{
			alertMsg.error("操作失败！");
		}
	});

	/* //提交按钮
	jn("[type=submit]").click(function() {
		var $itemTr = jn("#itemList").find("tr");
		for (var i = 0; i < $itemTr.length; i++) {
			var $input = $itemTr.eq(i).find("input");
			//有待办事项
			if ($input.eq(2).val() == "") {
				alertMsg.error("请选择处理人");
				return false;
			//如果只有一行
			}else if($itemTr.length == 1){
				for(var j = 0; j< $input.length; j++){				
					var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
					$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ 0 +"]"));
					
					if(j == $input.length-1){
						var $a = $itemTr.eq(i).find(".model");
						var lookupGroup = $input.eq(j).attr("lookupGroup").substring($input.eq(j).attr("lookupGroup").indexOf("["));	
						$input.eq(j).attr("lookupGroup",$input.eq(j).attr("lookupGroup").replace(lookupGroup, "["+ 0 +"]"));
						$a.attr("lookupGroup",$a.attr("lookupGroup").replace(lookupGroup, "["+ 0 +"]"));
					}				
				}
			}
		}
	}); */ 
</script>
<div class="pageContent">
  <form action="../dispatch/dispatch!fillForm.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<br/>
	<fieldset>
		<legend>任务处理<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a> --></legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="20%">任务名称</th>
						<th width="20%">子任务</th>
						<th width="20%">处理人</th>
						<!-- <th width="12%">任务模板</th> -->
						<th width="8%">模板详情</th>
						<th width="8%">截止日期</th>
						<!-- <th width="5%">操作</th> -->
					</tr>
				</thead>
				<tbody id="itemList">
					<tr>
						<td align="center"><input name="dispatch.taskType" value="<s:property value="dispatch.taskType"/>" size="30%"/></td>
						<td align="center"><input name="dispatch.taskName" value="<s:property value="dispatch.taskName"/>" size="30%"></td>
						<td align="center">
							<input name="dispatch.receiveUserId" value="<s:property value="dispatch.receiveUserId"/>" type="hidden" class="required" readonly="readonly" />
							<input name="dispatch.receiveUserName" value="<s:property value="dispatch.receiveUserName"/>" type="text" class="required" readonly="readonly" onclick="$(this).next().click()" size="50%"/>
							<a title="人员选择" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
						<%-- <td>
							<select name="dispatchList[#index].taskModel">
								<option value="">----基本版----</option>
								<s:iterator value="list" status="st">
									<option value="<s:property value="key"/>" ><s:property value="value"/></option>
								</s:iterator>
							</select>
						</td> --%>
						<td>
							<input name="dispatchList[#index].taskDefinition" value="" readonly="readonly" type="hidden"/>
							<input name="dispatchList[#index].taskModelNum" style="width:70%;" type="text" suggestFields="taskModelNum,taskDefinition,filesource" suggestUrl="" lookupGroup="dispatchList[#index]" lookupPk="taskModelNum" readonly="readonly" onclick="$(this).next().click()"/>
							<a href="../dispatch/dispatch!inputTaskModel.action" lookupGroup="dispatchList[#index]" lookupPk="taskModelNum"></a>
						</td>
						<td><input name="dispatch.limdat" value="<s:property value="dispatch.limdat"/>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<!-- <td align="center">					
							<a name="" href="###" >详情</a>|
							<a name="delBtn" href="###" style="color : red;">删除</a>
						</td> -->
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>