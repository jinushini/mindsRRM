<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
//添加按钮
jd("[name=addBtn]").click(function(){
	var $itemList=jd("#itemList");
	
	//新一行(新加一行)
	var $newItem=$itemList.find(".addTr").eq("0").clone();
	$newItem.find("td:last").find("a").click(function(){
		 if(jd("#itemList").find(".addTr").length>1){
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
jd("[name=delBtn]").click(function(){
	if(jd("#itemList").find(".addTr").length>1){
		$(this).parent().parent().remove();
	}else{
		alertMsg.error("操作失败！");
	}
});

//显示行删除按钮
jd("[name=delshowBtn]").click(function(){	
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
jd("[type=submit]").click(function() {
	//新增Tr行数据
	var $itemTr = jd("#itemList").find(".addTr");
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
	
	var $modifyTr = jd("#itemList").find(".modifyTr");
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


	/* jd(function() {
		for (var i=0; i < jd(".option").length; i++) {
			if(jd(".option").eq(i).text()=="图纸检查单"){
				var val = jd(".option").eq(i).val();
				jd(".option").eq(i).replaceWith("<option value='"+val+"' class='option'>pcb图纸检查单</option><option value='"+val+"' class='option'>mic（过渡片）图纸检查单</option><option value='"+val+"' class='option'>mic图纸检查单</option><option value='"+val+"' class='option'>固放整机图纸检查单</option>"); 
			}
		}
	});  */
	
	jd(function(){
		var $input = jd(".autoStart");
		for(var i = 0 ; i < $input.length ; i ++){
			var $inputeq = $input.eq(i);
			var autoStart = $inputeq.val();
			$inputeq.parent().find("select option[value='"+autoStart+"']").attr("selected","selected");
		}
	});
	
</script>

<div class="pageContent">
  <form action="../fextends/FlowRun_modifyFlowRun.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  		<input type="hidden" name="flowRun.id" value="<s:property value="flowRun.id"/>">
		<br/>
	<fieldset>
		<legend>节点编辑</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th>节点名称</th>
						<th>开始时间</th>
						<th>结束时间</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center"><s:property value="flowRun.flowDefName"/></td>
						<td align="center"><input type="text" name="flowRun.scheduleDate.planBeginDate" value="<s:date name="flowRun.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>" readonly="readonly" class="startDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').focus();}})"/></td>
						<td align="center"><input type="text" name="flowRun.scheduleDate.planEndDate" value="<s:date name="flowRun.scheduleDate.planEndDate" format="yyyy-MM-dd"/>" readonly="readonly" class="endDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();}})"/></td>
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

