<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
//添加按钮
$("[name=addBtn]").click(function(){
	var $itemList=$("#itemList");
	
	//新一行(新加一行)
	var $newItem=$itemList.find(".addTr").eq("0").clone();
	$newItem.find("td:last").find("a").click(function(){
		 if($("#itemList").find(".addTr").length>1){
			$(this).parent().parent().remove();
		}else{
			alertMsg.error("操作失败！");
		} 
	});
	$newItem.initUI();
	$newItem.find("input").val("");
	
	//增加一行
	$itemList.append($newItem);
});
 
//输入行删除按钮
$("[name=delBtn]").click(function(){
	if($("#itemList").find(".addTr").length>1){
		$(this).parent().parent().remove();
	}else{
		alertMsg.error("操作失败！");
	}
});

//显示行删除按钮
$("[name=delshowBtn]").click(function(){	
	var $tr = $(this).parent().parent();
	var subFlowId = $(this).parent().find("input[type='hidden']").val();
	alertMsg.confirm("确认删除", {
		 okCall: function(){				 
				$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../ssaps/ssapsConfig!deleteSubprocess.action",
				data:{
					subFlowId:subFlowId
				}, 
				success : function(data, statusText) {
					alertMsg.correct(data.message);	
					navTab.reload();
					//删除当前行数据
					$tr.remove();
					}
				});  
		 },
		 cancelCall : function() {}
	});
	
});

//提交按钮
$("[type=submit]").click(function() {
	//新增Tr行数据
	var $itemTr = $("#itemList").find(".addTr");
	for (var i = 0; i < $itemTr.length; i++) {
		var $input = $itemTr.eq(i).find("input");
		var $select = $itemTr.eq(i).find("select");
		//input加行号
		for(var j = 0; j< $input.length; j++){	
			var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
			$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ i +"]"));		
		}
		//select加行号
		for(var j = 0; j< $select.length; j++){	
			var name = $select.eq(j).attr("name").substring($select.eq(j).attr("name").indexOf("["),$select.eq(j).attr("name").indexOf("."));
			$select.eq(j).attr("name",$select.eq(j).attr("name").replace(name, "["+ i +"]"));	
		}
	}
	//修改Tr行数据
	
	var $modifyTr = $("#itemList").find(".modifyTr");
	for(var i = 0; i < $modifyTr.length; i++){
		var $input = $modifyTr.eq(i).find(".modify");
		var $select = $modifyTr.eq(i).find("select");
		//select加行号
		var name = $select.attr("name").substring($select.attr("name").indexOf("["),$select.attr("name").indexOf("."));
		$select.attr("name",$select.attr("name").replace(name, "["+ i +"]"));
		//input加行号
		for(var j = 0; j< $input.length; j++){				
			var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
			$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ i +"]"));		
		}
	}
}); 


$(function() {
	for (var i=0; i < $(".option").length; i++) {
		if($(".option").eq(i).text()=="图纸检查单"){
			var val = $(".option").eq(i).val();
			$(".option").eq(i).replaceWith("<option value='"+val+";checklistType=ssa_pcb' class='option'>PCB图纸检查单</option>"
					+"<option value='"+val+";checklistType=ssa_transit_plate' class='option'>MIC（过渡片）图纸检查单</option>"
					+"<option value='"+val+";checklistType=ssa_mic' class='option'>MIC图纸检查单</option>"
					+"<option value='"+val+";checklistType=ssa_wmd_borrow' class='option'>固放整机图纸检查单</option>"); 
		}
		if(jd(".option").eq(i).text()=="评审检查单"){
			var val = jd(".option").eq(i).val();
			jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=ssa_review' class='option'>固放设计评审检查单</option>"
					+ "<option value='"+val+";checklistType=ssa_design_input' class='option'>固放设计输入检查单</option>");

		}
		if(jd(".option").eq(i).text()=="微波所产品交验自查表"){
			var val = jd(".option").eq(i).val();
			jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=microwave_pdase' class='option'>微波所产品交验自查表</option>");
		}
		if(jd(".option").eq(i).text()=="微波所单机交付数据包审查记录表"){
			var val = jd(".option").eq(i).val();
			jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=microwave_sdadp' class='option'>微波所单机交付数据包审查记录表</option>");
		}
	}
});
	
	$(function(){
		var $input = $(".autoStart");
		for(var i = 0 ; i < $input.length ; i ++){
			var $inputeq = $input.eq(i);
			var autoStart = $inputeq.val();
			$inputeq.parent().find("select option[value='"+autoStart+"']").attr("selected","selected");
		}
	});
	//修改开始时间
	jd(".startDate").blur(function(){
		var startDate = jd(this).val();
		var endDate = jd(this).parent().parent().find(".endDate").val();
		if(endDate != null){
			//比较时间
			var msg = compareDate(startDate,endDate);
			if(msg == "warn"){
				jd(this).css("color","red");
			}else{
				jd(this).css("color","");
			}
			startDate = Date.parse(startDate);
			endDate = Date.parse(endDate);
			var dates = (Math.abs(endDate - startDate))/1000/60/60/24+1;
			jd(this).parent().parent().find(".dates").val(dates);
		}
	});
	//修改结束时间
	jd(".endDate").blur(function(){
		var endDate = jd(this).val();
		var startDate = jd(this).parent().parent().find(".startDate").val();
		if(startDate != null){
			//比较时间
			var msg = compareDate(startDate,endDate);
			if(msg == "warn"){
				jd(this).css("color","red");
			}else{
				jd(this).css("color","");
			}
			startDate = Date.parse(startDate);
			endDate = Date.parse(endDate);
			var dates = (Math.abs(endDate - startDate))/1000/60/60/24+1;
			jd(this).parent().parent().find(".dates").val(dates);
		}
	});
	
	//比较时间
	function compareDate(startDate,endDate){
		var arrStart = startDate.split("-");
		  var startTime = new Date(arrStart[0], arrStart[1], arrStart[2]);
		  var startTimes = startTime.getTime();
		  var arrEnd = endDate.split("-");
		  var endTime = new Date(arrEnd[0], arrEnd[1], arrEnd[2]);
		  var endTimes = endTime.getTime();
		  if (endTimes<startTimes) {
		    alertMsg.warn("结束时间不能小于开始时间");
		    return "warn";
		  }
		    return "success";
	}
	
	//修改工时
	jd(".dates").blur(function(){
		var dates = jd(this).val();
		var startDate = jd(this).parent().parent().find(".startDate").val();
		var endDate = jd(this).parent().parent().find(".endDate").val();
		if(startDate != null){
			startDate = Date.parse(startDate);
			dates = (Math.abs(dates - 1))*24*60*60*1000;
			endDate = Math.abs(startDate + dates);
			endDate = new Date(endDate)
			var year = endDate.getFullYear();
			var month = endDate.getMonth()+1;
			var date = endDate.getDate();
			if(month < 10 && date < 10){				
				endDate = year + "-0" + month + "-0" + date; 		
			}else if(month < 10 && date > 10){
				endDate = year + "-0" + month + "-" + date; 						
			}else if(month > 10 && date < 10){
				endDate = year + "-" + month + "-0" + date; 										
			}else if(month > 10 && date > 10){
				endDate = year + "-" + month + "-" + date; 										
			}
			jd(this).parent().parent().find(".endDate").val(endDate)
		}
	});
	
</script>

<div class="pageContent">
  <form action="../ssaps/ssapsConfig!modifySuperFlowNodeConfig.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  		<input type="hidden" name=parentNodeId value="<s:property value="parentNodeId"/>">
  		<input type="hidden" name="mark" value="<s:property value="mark"/>">
		<br/>
	<fieldset>
		<legend><s:property value="ssapsNode.nodesName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="10%">流程模板</th>
						<th width="20%">流程命名</th>
						<th width="5%">自启动</th>
						<th width="3%">顺序</th>
						<th width="10%">责任人</th>
						<th width="10%">开始时间</th>
						<th width="5%">工时/天</th>						
						<th width="10%">结束时间</th>
						<th width="3%">操作</th>

					</tr>
				</thead>
				<tbody id="itemList">
					<s:iterator value="list" status="st">
						<tr class="modifyTr">
							<td align="center" style="display: none;"><input type="text" class="modify" name="nodesDataList[#index].subFlowId" value="<s:property value="id"/>"></td>
							<td align="center"><s:property value="flowDefName"/></td>
							<td align="center"><input type="text" class="modify" name="nodesDataList[#index].flowName" value="<s:property value="flowName"/>" style="border:0;text-align:center;font-size:14px;" /></td>
							<td align="center">
								<input type="hidden" class="autoStart" value="<s:property value="autoStart"/>"/>
								<select name="nodesDataList[#index].autoStart" >
									<option value="是">是</option>
									<option value="否">否</option>							
								</select>
							</td>
							<td align="center"><input type="text" class="modify" name="nodesDataList[#index].num" value="<s:property value="num"/>" style="border:0;text-align:center;font-size:14px;" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
							<td>
								<input name="nodesDataList[#index].responsibleId" class="modify" type="hidden" value="<s:property value="responsibleId"/>">
								<input name="nodesDataList[#index].responsibleName" class="modify" type="text" class="" onclick="$(this).next().click()" readonly="readonly" value="<s:property value="responsibleName"/>" style="border:0;text-align:center;font-size:14px;">
								<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td><input type="text" class="modify startDate" name="nodesDataList[#index].beginDate" value="<s:date name="beginDate" format="yyyy-MM-dd"/>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" style="border:0;text-align:center;font-size:14px;"/></td>
							<td align="center"><input type="text" class="modify dates" name="nodesDataList[#index].manHours" value="<s:property value="manHours"/>" style="border:0;text-align:center;font-size:14px;" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
							<td><input type="text" class="modify endDate" name="nodesDataList[#index].endDate" value="<s:date name="endDate" format="yyyy-MM-dd"/>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" style="border:0;text-align:center;font-size:14px;"/></td>
							<td align="center"><input type="hidden" value="<s:property value="id"/>"/><a name="delshowBtn" style="color : red;">删除</a></td>
						</tr>
					</s:iterator>
					<tr class="addTr">
						<td>
							<select name="subFlowList[#index].deployementId">
								<option value="">----子流程模型----</option>
								<s:iterator value="checkboxDataList" status="st">
									<option value="<s:property value="key"/>" class="option"><s:property value="value"/></option>
								</s:iterator>
							</select>
						</td>
						<td align="center"><input name="subFlowList[#index].flowName" value="" style="width: 90%;"></td>
						<td align="center">
							<select name="subFlowList[#index].autoStart">
								<option value="是">是</option>
								<option value="否">否</option>							
							</select>
						</td>	
						</td>
						<td align="center"><input name="subFlowList[#index].num" value="" style="width: 90%;" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
						<td>
							<input name="subFlowList[#index].responsibleId" type="hidden" value="">
							<input name="subFlowList[#index].responsibleName" type="text" value="" onclick="$(this).next().click()" readonly="readonly">
							<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
						<td><input type="text" class="startDate" name="subFlowList[#index].beginDate" value="" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/></td>
						<td align="center"><input name="subFlowList[#index].manHours" class="dates" value="" style="width: 90%;" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
						<td><input type="text" class="endDate" name="subFlowList[#index].endDate" value="" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/></td>
						<td align="center">					
							<a name="delBtn" href="###" style="color : red;">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
   </form>
</div>

