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
	
	jn("#newOrder").change(function(){
		switch(jn("#newOrder").val()){
			case '新增订单':
				break;
			case 'fill':
				jn("#newOrder").val("新增订单");
				var url="../order/order!inputOrder.action";
				navTab.openTab("", url, { title:"新建订单", fresh:false, data:{} });
				break;
			case 'excel':
				jn("#newOrder").val("新增订单");
				var url="../order/order!inputOrderByExcel.action";
				navTab.openTab("", url, { title:"Excel导入订单", fresh:false, data:{} });
				break;
			default:
				alert("error");	
				break;
		}
	})
	
	//启动按钮
	jn("#start").click(function(){
		var id = jn(".list_table").find(".selected").find(".id").text();
		var processInstId = jn(".list_table").find(".selected").find(".processInstId").text();
		var url = "";
		if(orderId == ""){
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
			url = "../resolve/ResolveAppr_startProcess_resolve_list.action?id=" + id;
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
					型号代号：<input type="text" name="paramMap['o.productLib.modelCode like']" value="<s:property value="paramMap['o.productLib.modelCode like']"/>" />
				</td>
				<td>
					产品种类：<input type="text" name="paramMap['o.subType.value like']" value="<s:property value="paramMap['o.subType.value like']"/>" />
				</td>
				<td>
					单机主管：<input type="text" name="paramMap['o.singleHead.name like']" value="<s:property value="paramMap['o.singleHead.name like']"/>" />
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
			<%-- <li><a class="icon" href="javascript:;" id="start" target="navTab" rel=""><span>启动流程</span></a></li> --%>
			<%-- <li><a class="icon" href="../resolve/ResolveAppr_startProcess_resolve_list.action" target="navTab" rel="currentNavTab"><span>启动流程</span></a></li> --%>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40">状态</th>
					<th width="40" align="center">序号</th>
					<th width="100">产品名称</th>
					<th width="100">产品代号</th>
					<th width="100">流程实例ID</th>
					<th width="100">下达人</th>
					<th width="130">处理人</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" id="taskState" <s:if test="status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif><s:elseif test="status == 0">style="color:gray;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="status == 0 ? '●' : '●'"/>
					</td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="id"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="processInstId"/></td>
					<td align="center"><s:property value="productDesign.productBasic.code"/></td>
					<td align="center"><s:property value="productDesign.productBasic.name"/></td>
					<td align="center"><s:property value="processInstId"/></td>
					<td align="center"><s:property value="dispatcher.name"/></td>
					<td align="center"><s:property value="operator.name"/></td>
					<td align="center">
						<a href="../resolve/Resolve_showResolveDetails_resolve-details.action?id=<s:property value="id"/>" height="450" width="850" target="dialog" class="details">详情</a>&nbsp|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

