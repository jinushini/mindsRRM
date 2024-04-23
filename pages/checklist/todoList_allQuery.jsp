<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">

	jn(function(){
		//合并单元格
		var j = 0;
		var z = 1;
		for(var i=1;i<jn("table tr").length+1;i++){
			var $referCol = jn("table tr").eq(i-j).find("td:eq(0)");
			var $itemCol = jn("table tr").eq(i+1).find("td:eq(0)");
			if($itemCol.find("input:eq(0)").val() == $referCol.find("input:eq(0)").val() ){
				$itemCol.hide();
				j = j+1;
			}else{
				$referCol.attr("rowspan",j+1);
				$referCol.find("span").replaceWith(z);
				z = z+1;
				j = 0;
			}
		}
	})

	//点击[+]超链接时在合适位置增加一行
	jn(".itemAdd").click(function(){
		var $thisTr = $(this).parent().parent();
		var $thisTd = $thisTr.find("td:eq(0)");	
		var parentClassId = $thisTr.find(".parentClassId").val();
		//点击超链接时去掉原本被选中的行样式，为超链接所在行加上selected选中样式
		jn(".selected").removeClass("selected");
		$thisTr.addClass("selected");
		
		//创建新行并添加到指定位置
		var newTr = "<tr>"
						+"<td align='center' style='display:none;'><input type='hidden' class='parentClassId'></td>"
						+"<td align='center'><input type='checkbox' name='ids' value='' /></td>"
						+"<td align='center' style='color:red;font-size:30px'>●</td>"
						+"<td align='left' style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-size:13px;padding:0 5px;'>"
							+"<input type='hidden' class='taskName'/>"
						+"</td>"
						+"<td align='center'><input type='text' style='width:260px;' class='taskDefinition'/></td>"
						+"<td align='center'><input type='text' style='width:110px;' class='completeForm'/></td>"
						+"<td align='center'><input readonly='readonly' onclick='WdatePicker();' type='text' style='width:80px;' class='planEndDate'></td>"
						+"<td align='center'>"
							+"<input name='dispatchList[#index].receiveUserId' type='hidden' readonly='readonly' class='receiveUserId'/>"
							+"<input name='dispatchList[#index].receiveUserName' type='text' readonly='readonly' class='receiveUserName' style='width:100px;' onclick='$(this).next().click()' size='50%'/>"
							+"<a title='人员选择' height='410' width='715' href='../system/user!findMUser.action' target='dialog' rel='selectUser' resizable='false' maxable='false'></a>"
						+"</td>"
						+"<td></td><td></td>"
						+"<td align='center' style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;' class='dispatchManager'></td>"
						+"<td></td>"
					+"</tr>";
		
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../checklist/checklistAppr!verifyBeforeAdd.action", //发送请求的地址
			data : {
				parentClassId : parentClassId,
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				if(data.flag == null){
					alertMsg.error("此项目已闭环,不能增加新待办");
					return false;
				}else{
					var finalSecondCheck = data.flag.split("㊣").pop().slice(0,-19);
					
					//点击超链接时得到被选中行所在的行数
					var selectedNum = 0;
					for(var i=1;i<jn("table tr").length;i++){
						if(jn("table tr").eq(i).is(".selected")){
							break;
						}else{
							if(jn("table tr").eq(i).find("td:eq(0)").is(":hidden")){
								continue;
							}else{
								selectedNum = selectedNum + parseInt(jn("table tr").eq(i).find("td:eq(0)").attr("rowspan"));
							}
						}
					}
					var rowspan = parseInt($thisTd.attr("rowspan"));
					//将html代码段先转化为jquery对象再进行操作
					var $newTr = $(newTr);
					$newTr.initUI();
					$newTr.find("input:checkbox").removeAttr("checked");
					$newTr.removeClass("selected");
					$newTr.find("input").removeClass("required");
					$newTr.find(".parentClassId").val($thisTd.find(".parentClassId").val());
					$newTr.find(".dispatchManager").append($thisTr.find(".dispatchManager").text());
					$newTr.find(".dispatchManager").attr("title",$thisTr.find(".dispatchManager").text());
					$newTr.insertAfter(jn("table tr").eq(selectedNum+rowspan));
					$thisTd.attr("rowspan",rowspan+1);
					$taskName = $newTr.find(".taskName");
					$taskName.val(finalSecondCheck);
					$taskName.parent().find("td").attr("title",finalSecondCheck);
					$("<div style='font-size:13px;'>"+finalSecondCheck+"</div>").insertAfter($taskName);
				}
			}
		});
	})

	function verify(obj){
		var parentClassId =  jn(obj).parent().find("input[class=parentClassId]").val();
		var dispatchId = jn(obj).parent().find("input[class=dispatchId]").val();
		var title= "";
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../checklist/checklistAppr!verifyBeforeDel.action", //发送请求的地址
			async: false,
			data : {
				dispatchId : dispatchId,
				parentClassId : parentClassId
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				if(data.flag != null){
					jn(obj).attr("title", data.flag);
				}
			}
		});
	}
	 	
	jn("#submitBtn").click(function(){
		if(jn("table input:checked").length==0){
			alertMsg.error("请选择信息");
			return false;
		}
		var j=0;
		for(var i=1;i<jn("table tr").length+1;i++){
			var $thisTr = jn("table tr").eq(i);
			if($thisTr.find("input[type='checkbox']").is(":checked")){
				$thisTr.find("td input").addClass("required");
				$thisTr.find(".parentClassId").attr("name","dispatchList["+j+"].parentClassId");
				$thisTr.find(".taskName").attr("name","dispatchList["+j+"].taskName");
				$thisTr.find(".taskDefinition").attr("name","dispatchList["+j+"].taskDefinition");
				$thisTr.find(".completeForm").attr("name","dispatchList["+j+"].completeForm");
				$thisTr.find(".planEndDate").attr("name","dispatchList["+j+"].scheduleDate.planEndDate");
				$thisTr.find(".receiveUserId").attr("name","dispatchList["+j+"].receiveUserId");
				$thisTr.find(".receiveUserName").attr("name","dispatchList["+j+"].receiveUserName");
				j=j+1;
			}else{
				$thisTr.find("td input").removeClass("required");
				$thisTr.find(".parentClassId,.taskName,.taskDefinition,.completeForm,.planEndDate,.receiveUserId,.receiveUserName").removeAttr("name");
			}
		}
	})

	jn("#print").click(function(){
		var isfull = <s:property value='dispatchList.size()' />;
		if(isfull == 0){
			alertMsg.error("没有可打印的待办事项表");
		}else{
			var url="../checklist/print!printTodoList.action?parentClassProcessInstId=<s:property value='parentClassProcessInstId' />";
			jn(this).attr("href",url);
		}
	})

	jn("#cancelBtn").click(function(){
		navTab.reload("../checklist/checklistAppr!checklistModifyInput.action?taskId=<s:property value='parentTaskId'/>&processInstId=<s:property value='parentClassProcessInstId'/>");
	})

	
</script>
<div class="pageHeader">
	<div class="searchBar">
	</div>
</div>
<div class="pageContent">
	<form method="post" target="selectedTodo" action='../checklist/checklistAppr!todoListSaveStart.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="panelBar">
		<ul class="toolBar">
			<li><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">保存并启动</button></div></div></li>
		</ul>
	</div>
	
	<div class="pageFormContent" layoutH="95">
		<!-- 此页面有统一的parentClassProcessInstId 和 parentTaskId -->
		<input type="hidden" name="parentClassProcessInstId" value="<s:property value='parentClassProcessInstId' />" />
		<input type="hidden" name="parentTaskId" value="<s:property value='parentTaskId' />" />
		<s:set name="parentTaskId" value="taskId"></s:set>
		<table class="list_table list" width="100%" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="50">序号</th>
					<th width="25"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="35">状态</th>
					<th width="180">子任务</th>
					<th width="280">待办事项描述</th>
					<th width="130">完成形式</th>
					<th width="100">要求完成时间</th>
					<th width="120">责任人</th>
					<th width="200">待办事项落实情况</th>
					<th width="200">完成情况</th>
					<th width="80">检查人</th>
					<th width="60">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="dispatchList" status="st" >
					<tr level="Tr<s:property value='parentClassId'/>">
						<td align="center" rowspan="1">
							<span style="font-size:16px;"><s:property value='#st.index+1'/></span>
							
							<!-- 闭环后不能再添加新待办 -->
							<s:if test="!set.contains(parentClassId)">
								<a href="javascript:;" class="itemAdd" style="color:green;margin-right:-20px;" title="添加子待办">[+]</a>
							</s:if>
							<input type="hidden" value="<s:property value='parentClassId'/>" class="parentClassId">
						</td>
						
						<!-- 已经启动的待办不能再重新启动、任务闭环后不能启动新待办（重点是包括第一条未启动的待办） -->
						<s:if test="processInstId==null">
							<td align="center"><s:if test="!set.contains(parentClassId)"><input type="checkbox" name="ids" value="<s:property value='id'/>"/></s:if></td>
						</s:if>
						<s:else>
							<td></td>
						</s:else>
						<td align="center" style="font-size:30px; color:<s:if test='status == 3'>green</s:if><s:elseif test='status == 0'>gray</s:elseif><s:elseif test='status == 5'>red</s:elseif><s:else>orange</s:else>;">
							<s:property value="status == 0 ? '●' : '●'"/>
							<input type="hidden" value="<s:property value='status'/>" class="status"/>
						</td>
						
						 
						<!-- 修改时最新增加的问题待办，还没被保存并启动的，可以被编辑 -->
						<s:if test="processInstId==null && !set.contains(parentClassId)">
							<td align="left" title="<s:property value='taskName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-size:13px;padding:0 5px;">
								<input type="hidden" value="<s:property value='taskName'/>" class="taskName" />
								<s:property value='taskName'/>
							</td>
							<td align="center"><input type="text" value="" style="width:260px;" class="taskDefinition"/> </td>
							<td align="center"><input type="text" value="" style="width:110px;" class="completeForm"/></td>
							<td align="center">
								<input readonly="readonly" onclick="WdatePicker();" type="text" style="width:80px;" class="planEndDate">
							</td>
							<td align="center">
								<input name="dispatchList[#index].receiveUserId" type="hidden" readonly="readonly" class="receiveUserId"/>
								<input name="dispatchList[#index].receiveUserName" type="text" readonly="readonly" class="receiveUserName" style="width:100px;" onclick="$(this).next().click()" size="50%"/>
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
						</s:if>
						<!-- 已经被启动的待办或者任务闭环后对应的所有待办，只能查看不能编辑 -->
						<s:else>
							<td align="left" title="<s:property value='taskName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-size:13px;padding:0 5px;" class="taskName"><s:property value='taskName'/></td>
							<td align="center" title="<s:property value='taskDefinitionStr'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='taskDefinitionStr'/></td>
							<td align="center" title="<s:property value='completeForm'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='completeForm'/></td>
							<td align="center" title="<s:date name='scheduleDate.planEndDate' format='yyyy-MM-dd'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
							<td align="center" title="<s:property value='receiveUserName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='receiveUserName'/></td>
						</s:else>
						
						<td align="center" title="<s:property value='feedbackInfoStr'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='feedbackInfoStr' escape="false"/></td>
						
						<td align="center" title="<s:property value='finishStatus'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='finishStatus'/></td>
						
						<td align="center" title="<s:property value='dispatchManager.name'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" class="dispatchManager"><s:property value='dispatchManager.name'/></td>
						
						<s:if test="processInstId!=null">
							<td align="center">
								<!-- 此页面每一行有本行的dispatchId 和 parentClassId -->
								<input type="hidden" class="dispatchId" value="<s:property value='id'/>">
								<input type="hidden" class="parentClassId" value="<s:property value='parentClassId'/>">
								<!-- 闭环后不能对待办进行删除操作 -->
								<s:if test="!set.contains(parentClassId)">
									<a class="delete" href="../checklist/checklistAppr!todoListDelete.action?parentClassId=<s:property value='parentClassId'/>&dispatchId=<s:property value='id'/>&parentTaskId=<s:property value='parentTaskId'/>" target="ajaxTodo" onclick="verify(this)"><span>删除</span></a>						
								</s:if>
							</td>
						</s:if>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<%-- <li><a class="button" id="print" href="###"><span>生成打印</span></a></li> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" type="button">返回</button></div></div></li>
		</ul>			
	</div>
	</form>
</div>


	
