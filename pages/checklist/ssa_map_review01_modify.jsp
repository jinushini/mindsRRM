<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){  
		
		//切换完整版本与最终版本
		jn("#switchShow").change(function(){
			navTab.reload("../checklist/checklistAppr!checklistModifyInput.action?flag="+jn("#switchShow").val()+"&taskId="+jn("[name='taskId']").val()+"&processInstId="+jn("[name='processInstId']").val());
		})
		//完整版本与最终版本下拉框默认选中
		if(jn("#flag").val()!=""){
			jn("#switchShow").val(jn("#flag").val());
		}
		
		var z = 0;
		for(var i=0;i<jn(".tbody tr").length;i++){
			
			//合并单元格
			var $referCol = jn(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jn(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
			
			//检查结果在单元格内的输出格式
			var $thisRow = jn(".tbody tr").eq(i);
			var text="";
			
			for(var j=0;j<$thisRow.find("div").length;j++){
				var $thisDiv = $thisRow.find("div").eq(j);
				if(jn("#switchShow").val() == "whole"){
					text = $thisDiv.text().split("㊣").pop().slice(0,-19);
				}else{
					text=$thisDiv.text();
				}
				
				//不同流程节点时页面结果与审批的不同展示
				
				if(jn("#taskName").val() == "修改"){
					//先根据后台数据展示结果中可修改的部分
					if($thisDiv.parent().find("input").attr("type")=="radio"){
						$thisDiv.parent().find("input[value='"+text+"']").prop("checked","checked");
					}else{
						$thisDiv.parent().find("input").val(text);
					}
					//再根据“完整版”和“最终版”决定div是“加白色背景”还是“隐藏掉”   //div加上背景色后用户容易将div和输入框看混，所以不加背景色
					if(jn("#switchShow").val() == "whole" && $thisDiv.text() != ""){
						$("<br/>").insertAfter($thisDiv);
						/* $thisDiv.attr("style","background-color:#FFFFFF;width:98%;font-size:15px;margin:4px 0 -13px 4px;padding:5px;"); */
					}else{
						$thisDiv.hide();
					}
					
					//动态添加firstCheck的input输入框name，并判断当前行“已闭环”时此行firstCheck的input输入框不显示
					if(j==0){
						$thisDiv.parent().find("input").attr("name","checkResultList["+ i +"].firstCheck");
					}
					//动态添加secondCheck的input输入框name
					if(j==1){
						$thisDiv.parent().find("input").attr("name","checkResultList["+ i +"].secondCheck");
						if($thisRow.find(".remark").text() == "已闭环"){
							$thisDiv.parent().find("input").hide();
							$thisDiv.show();
						}
					}
					
					jn("#approve").remove();
					
				}else{
					//审批页面因为td中还存在单选框和文本框，所有先把td内容清空再写入检查结果
					$thisDiv.parent().text("").append($thisDiv);
					//会签节点显示“是否闭环”和“待办事项”列
					if(jn("#taskName").val() == "会签"){
						jn(".isClosedLoop, .todoList").show();
					}
				}
				
				//将检查结果从㊣字符处切开，规整成“原：”“改”的形式
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
		
		//控制流程不同界面中审批意见的显示
		jn("#approveComment tr:eq(0)").remove();
		if(jn("#relUser tr").eq(2).find("td").eq(0).find("#submitDate").text()==""){
			jn("#approveComment tr:eq(3)").hide();
			if(jn("#relUser tr").eq(1).find("td").eq(1).find("#submitDate").text()==""){
				jn("#approveComment tr:eq(2)").hide();
				if(jn("#relUser tr").eq(1).find("td").eq(0).find("#submitDate").text()==""){
					jn("#approveComment tr:eq(1)").hide();
					if(jn("#relUser tr").eq(0).find("td").eq(1).find("#submitDate").text()==""){
						jn("#approveComment").hide();
					}
				}
			}
		}
		
		
		//将待办事项闭环
		jn("[name='remark']").change(function(){
			switch(jn(this).val()){
				case '闭环':
					//parentClassId在alertMsg.confirm之后不能被取到
					var parentClassId = jn(this).parent().parent().attr("rel");
					alertMsg.confirm("强制闭环后，未完成的派工将被终止，确定要闭环吗", {
			 			okCall: function(){
							$.ajax({
								global : false, //(默认: true) 是否触发全局 AJAX 事件
								url : "../checklist/checklistAppr!closedLoopSet.action", //发送请求的地址
								data : {
									parentClassId: parentClassId
								},//发送到服务器的请求参数
								type : "POST", //请求方式：post或get
								dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
								success : function(data, statusText) {
									alertMsg.correct("闭环成功");	
									navTab.reload();
								}
							});
							
						 },
					 cancelCall : function() {}
					});
					break;
			}
		})
		
		//代办事项有“未闭环”时不允许通过并提交
		jn("#submitBtn").click(function(){
			if(jn("#taskName").val() == "会签"){
				if(jn("#pass").is(":checked")){
					for(var i=0;i<jn(".tbody tr").length;i++){
						if(jn(".tbody tr").eq(i).find(".remark").text()=="未闭环"){
							alertMsg.confirm("请将所有待办事项闭环后再试");
							return false;
						}
					}
				}
			}	
		})
	})
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!reviewCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId'/>"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr >
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
							<label style="width: 25%;">研制阶段：<s:property value="checklist.stage"/></label>
							<label style="width: 25%;">检查单编号：<s:property value="checklist.checklistNum"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>检查内容</legend>		
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center">
						<th width="10%">检查项目</th>
						<th width="20%">注意事项 </th>
						<th width="15%">检查结果</th>
						<th width="30%">备注</th>
						<th width="10%" class="isClosedLoop" style="display:none;">是否闭环</th>
						<th width="10%" class="todoList" style="display:none;">
							<a href="../checklist/checklistAppr!todoListAllQuery.action?parentClassProcessInstId=<s:property value='processInstId'/>&parentTaskId=<s:property value='taskId'/>" style="color:red;font-size: 15px;" target="navTab" rel="currentNavTab">待办事项表</a>
						</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st" >
						<tr target="id" rel="<s:property value="id"/>">
							<td align="center" class="item"><s:property value='checkItem.item'/></td>
							<td style="padding:5px 15px;"><s:property value='checkItem.num'/>.&nbsp;<s:property value='checkItem.demand'/></td>
							<td style="padding:5px 15px;" >
								<div style="font-size:15px;"><s:property value='firstCheck'/></div>
									<input type="radio" value="是" checked/>是
									<input type="radio" value="否" />否
							</td>
							<td style="padding:5px 15px;">
								<div style="padding:5px;font-size:15px;white-space:normal;word-break:break-all;word-wrap:break-word; "><s:property value='secondCheck'/></div>
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;"/>
							</td>
							<td align="center" style="padding:5px 15px;display:none;" class="isClosedLoop">
								<span style="display:none;" class="checkItemId"><s:property value='checkItem.num'/></span>
								<span style="display:none;" class="remark"><s:property value='remark'/></span>
								<s:if test="remark=='已闭环'">
									<span>已闭环</span>
								</s:if>
								<s:if test="remark=='未闭环'">
									<select style="width:70px;" name="remark">
										<option value="未闭环">未闭环</option>
										<option value="闭环">闭环</option>
									</select>
								</s:if>
							</td>
							<td align="center" style="padding:5px 15px;display:none;" class="todoList">
								<s:if test="remark=='未闭环'||remark=='已闭环'">
									<a href="../checklist/checklistAppr!todoListQuery.action?parentClassId=<s:property value='id'/>" width="1200" height="350" target="dialog">查看</a>
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div style="margin:10px 10px;">
			各个频段的参考紧固螺钉间距 <br/><br/>
			频段代号  频率范围(GHz)  紧固螺钉间距（mm） <br/><br/>
			低于L  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2GHz以下&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20 <br/><br/>
			L  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1-2  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15 <br/><br/>
			S  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2-4  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13 <br/><br/>
			C  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4-8  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10 <br/><br/>
			X  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8-12  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7 <br/><br/>
			Ku  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12-18  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5 
			Ku以上 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18GHz以上  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尽量紧密 
		</div>
		</fieldset>
		<fieldset id="approveComment">
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
							<input type="radio" name="approve.resultCn" value="通过" id="pass">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过">不通过
						</span>
					</td>
				</tr>
				<tr>
					<td align="center">审批意见：</td>
					<td><textarea name="approve.comments" style="width: 90%;" rows="10"></textarea></td>
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
						<span style="font-size:14px" id="submitDate">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
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