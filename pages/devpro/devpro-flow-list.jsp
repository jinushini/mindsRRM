<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
	//流程图
	/* jn(function(){
		var state = jn("#state").val();
		if(state == 0){
			var options={};
			options.width = 800;
			options.height = 500;
			var url="../order/order!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
			$.pdialog.open(url,"new_msg", "查看流程图",options);
		}		
	});  */
	//查看流程图
	jn("#viewImgBtn").click(function(){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../order/order!flowImage.action";
		$.pdialog.open(url,"new_msg", "查看流程图",options);	
	})
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	//创建项目
	jn("#newSelect").change(function(){
		var templateId = jn("#newSelect").val();
		if(templateId == 0){
			return ;
		}
		var url="../devpro/DevProAppr_createProject_devpro-flow-input.action";
		navTab.openTab("", url, { title:"创建项目", fresh:false, data:{flowTemplateId:templateId} });
	})
	
	//启动按钮
	jn("#start").click(function(){
		var id = jn(".list_table").find(".selected").find(".id").text();
		var processInstId = jn(".list_table").find(".selected").find(".processInstId").text();
		var url = "";
		if(id == ""){
			alertMsg.error("请选择项目！");
			url = "<s:property value="page.url"/>";
			jn(this).attr("rel", "currentNavTab");
			jn(this).attr("href", url);
		}else if(processInstId != ""){
			alertMsg.error("该项目已启动！");
			url = "<s:property value="page.url"/>";
			jn(this).attr("rel", "currentNavTab");
			jn(this).attr("href", url);
		}else{
			url = "../devpro/DevProAppr_inputProject_devpro-flow-input.action?id=" + id;
			jn(this).attr("href", url);
		}
	});
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					产品代号：<input type="text" name="paramMap['p.productDesign.productBasic.code like']" value="<s:property value="paramMap['p.productDesign.productBasic.code like']"/>" />
				</td>
				<td>
					产品名称：<input type="text" name="paramMap['p.productDesign.productBasic.name like']" value="<s:property value="paramMap['p.productDesign.productBasic.name like']"/>" />
				</td>
				<td>
					单机主管：<input type="text" name="paramMap['p.flowRun.resopnsibleUser.name like']" value="<s:property value="paramMap['p.flowRun.resopnsibleUser.name like']"/>" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<li style="margin-right:5px;">
				<select style="width:120px;" id="newSelect">
					<option value="0" selected>----创建项目----</option>
					<s:iterator value="templatelist" var="st">
						<option value='<s:property value="id"/>'><s:property value="flowTemplateName"/></option>
					</s:iterator>
				</select>
			</li>
			<li><a class="icon" href="javascript:;" id="start" target="navTab" rel="designFlowConfig"><span>启动流程</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40">状态</th>
					<th width="40" align="center">序号</th>
					<th width="100">产品代号</th>
					<th width="100">产品名称</th>
					<th width="100">流程实例ID</th>
					<th width="100">责任人</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" id="taskState" <s:if test="flowRun.status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="flowRun.status == 2">style="color:orange;font-size:30px"</s:elseif><s:elseif test="flowRun.status == 0">style="color:gray;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="flowRun.status == 0 ? '●' : '●'"/>
					</td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="id"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="flowRun.processInstId"/></td>
					<td align="center"><s:property value="productDesign.productBasic.code"/></td>
					<td align="center"><s:property value="productDesign.productBasic.name"/></td>
					<td align="center"><s:property value="flowRun.processInstId"/></td>
					<td align="center"><s:property value="flowRun.resopnsibleUser.name"/></td>
					<td align="center">
						<a href="../devpro/DevPro_showDetails_devpro-flow-show.action?id=<s:property value="id"/>" target="navTab" class="details">详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

