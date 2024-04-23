<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){		
		//启动链接
		jn(".startA").click(function(){
			var subFlowId = jn(this).parent().parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().parent().find("input[name=processInstId]").val();
			var auditorId = jn(this).parent().find("input[name=auditorId]").val();
			var auditorName = jn(this).parent().find("input[name=auditorName]").val();
			if(auditorId==""||auditorName==""){
				alertMsg.error("请选择责任人");
				return false;
			}
			alertMsg.confirm("确认启动", {
				 okCall: function(){				 
						$.ajax({
						global : false,
						type : 'post',
						dataType : "json",
						url : "../ssaps/ssapsController!startSubProcess.action",
						data:{
							auditorId:auditorId,
							auditorName:auditorName,
							subFlowId:subFlowId,
							processInstId:processInstId
						}, 
						success : function(data, statusText) {
							alertMsg.correct("Success");	
							navTab.reload();
							}
						});  
				 },
				 cancelCall : function() {}
			});
		});
		//设置链接
		jn(".setUserA").click(function(){
			var $setUserDiv = jn(this).parent().find("div[class=setUserDiv]");
			$setUserDiv.attr("style","");
			jn(this).attr("style","display:none;");
		});
		//关闭链接
		jn(".closeUserA").click(function(){
			var $setUserA = jn(this).parent().parent().find("a[class=setUserA]");
			var $setUserDiv = jn(this).parent();
			$setUserA.attr("style","");
			$setUserDiv.attr("style","display:none;");
		});

		//终止链接
		jn(".stopA").click(function(){
			var subFlowId = jn(this).parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().find("input[name=processInstId]").val();
			var flowClassId = jn(this).parent().find("input[name=flowClassId]").val();
			var flowClassName = jn(this).parent().find("input[name=flowClassName]").val();
			alertMsg.confirm("确认终止", {
				 okCall: function(){				 
						$.ajax({
						global : false,
						type : 'post',
						dataType : "json",
						url : "../ssaps/ssapsController!stopSubProcess.action",
						data:{
							subFlowId:subFlowId,
							processInstId:processInstId,
							flowClassId:flowClassId,
							flowClassName:flowClassName
						}, 
						success : function(data, statusText) {
							alertMsg.correct("Success");	
							navTab.reload();
							}
						});  
				 },
				 cancelCall : function() {}
			});
		});
		//重新启动
		jn(".restartA").click(function(){
			var subFlowId = jn(this).parent().parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().parent().find("input[name=processInstId]").val();
			var flowClassId = jn(this).parent().parent().find("input[name=flowClassId]").val();
			var flowClassName = jn(this).parent().parent().find("input[name=flowClassName]").val();
			var auditorId = jn(this).parent().find("input[name=auditorId]").val();
			var auditorName = jn(this).parent().find("input[name=auditorName]").val();
			if(auditorId==""||auditorName==""){
				alertMsg.error("请选择责任人");
				return false;
			}
			alertMsg.confirm("确认重启", {
				 okCall: function(){				 
						$.ajax({
						global : false,
						type : 'post',
						dataType : "json",
						url : "../ssaps/ssapsController!reStartSubProcess.action",
						data:{
							auditorId:auditorId,
							auditorName:auditorName,
							subFlowId:subFlowId,
							processInstId:processInstId,
							flowClassId:flowClassId,
							flowClassName:flowClassName
						}, 
						success : function(data, statusText) {
							alertMsg.correct("Success");	
							navTab.reload();
							}
						});  
				 },
				 cancelCall : function() {}
			});
		});
	});

	//强制执行按钮
	jn("#forceBtn").click(function(){
		jn(".required").removeClass();
		var taskId = <s:property value="taskId"/>;
		var processInstId = <s:property value="processInstId"/>;
		alertMsg.confirm("确认强制完成", {
			 okCall: function(){				 
				 $.post("../ssaps/ssapsAppr!handelForce.action", {taskId:taskId,processInstId:processInstId}, navTabAjaxDone, "json"); 
			 },
			 cancelCall : function() {}
		});
		
	});

</script>
<div class="pageContent">
  <form method="post" action='../ssaps/ssapsAppr!handleReview.action' class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>流程控制：<s:property value="ssaps.productName"/>（<s:property value="ssaps.productCode"/>）</legend>
			<div class="flow-frame">
				<s:iterator value="ssaps.nodes" status="st" var="a">
					<div class="stage">
						<div id="<u:index value='#st.index+1'/>">
							<h1><s:property value="#attr.a.nodesName"/>
								<a href="../ssaps/ssaps!inputModifySsapsNode.action?ssapsNodeId=<s:property value="#attr.a.id"/>" width="750" target="dialog" mask="true"><input type="hidden" value="<s:property value="#attr.a.id"/>"><img src="../../img/edit.gif"></a>
								<a href="../ssaps/ssapsConfig!inputSuperFlowNodeConfig.action?parentNodeId=<s:property value="#attr.a.id"/>&&processInstId=<s:property value="processInstId"/>" target="dialog" width="750" mask="true" title="新增子任务"><img src="../../img/new.gif"></a>
								<span class="action-period">执行时间：<s:date name="#attr.a.beginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.endDate" format="yyyy-MM-dd"/></span></h1>
							</h1>
							<ul>
								<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
									<li>
										
										<span <s:if test="#attr.b.status==3">style="display: inline; color:green;font-size:30px" </s:if>
											<s:elseif test="#attr.b.status==0">style="display: inline; color:red;font-size:30px"</s:elseif>
											<s:elseif test="#attr.b.status==5">style="display: inline; color:red;font-size:30px"</s:elseif>
											<s:else>style="display: inline; color:orange;font-size:30px;"</s:else>
											> 
											<s:property value="#attr.b.status==0 ? '●' : '●'"/>
										</span>
										<s:property value="#attr.b.flowName" /> （<s:property value="#attr.b.responsibleUser==null?'未配置':#attr.b.responsibleUser.name"/>）						
										<input type="hidden" name="subFlowId" value="<s:property value="#attr.b.id"/>" readonly="readonly">
										<input type="hidden" name="processInstId" value="<s:property value="ssaps.processInstId"/>">
										<input type="hidden" name="flowClassId" value="<s:property value="#attr.b.subClassId"/>" readonly="readonly">
										<input type="hidden" name="flowClassName" value="<s:property value="#attr.b.subClassName"/>" readonly="readonly">
										
										<s:if test="#attr.b.status==5">
											<a class="setUserA" style="display:" title="设置人员"><img src="../../img/setting.gif"></a>
											<div class="setUserDiv" style="display:none;">
												<span style="float:left; font-size:16px;">责任人：</span>
												<input name="auditorId" type="hidden" class="required"/>
												<input name="auditorName" type="text" class="required" onclick="$(this).next().click()" readonly="readonly" size="10%"/>
												<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
												<a href="##" class="startA" style="color:green;"><img src="../../img/start.gif"></a>
												<a class="closeUserA"><img src="../../img/cancel.gif"></a>
											</div>											
										</s:if>
										<s:else>
											<div class="setUserDiv" style="display:none;">
												<span style="float:left; font-size:16px;">责任人：</span>
												<input name="auditorId" type="hidden" class="required"/>
												<input name="auditorName" type="text" class="required" onclick="$(this).next().click()" readonly="readonly" size="10%"/>
												<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
												<a href="##" class="restartA" style="color:green;" title="强制重启子任务"><img src="../../img/reboot.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;
											</div><br/>
											<a href="<s:property value="#attr.b.subFlowDetailsPath" />" class="detailsA" target="dialog" height="450" width="850" title="子任务详情"><img src="../../img/details.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" target="dialog" height="450" width="850"><img src="../../img/view.gif" title="查看子任务进度"></a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="##" class="stopA"  title="强制终止子任务"><img src="../../img/end.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a class="setUserA" title="强制重启子任务"><img src="../../img/reboot.gif"></a>
										</s:else>
									</li>
								</s:iterator>
							</ul>
						</div>
					</div>
				</s:iterator>
			</div>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="forceBtn" type="button">强制完成</button></div></div></li>
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">强制完成</button></div></div></li> -->
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>