<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	
	jn(function(){
		var state = jn("#state").val();
		if(state == 0){
			var options={};
			options.width = 800;
			options.height = 500;
			var url="../ssaps/ssaps!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
			$.pdialog.open(url,"new_msg", "查看流程图",options);
		}		
	}); 
	jn("#viewImgBtn").click(function(){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../ssaps/ssaps!flowImage.action";
		$.pdialog.open(url,"new_msg", "查看流程图",options);	
	}) 
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	//启动按钮
	jn("#start").click(function(){
		var ssapsId = jn(".list_table").find(".selected").find(".ssapsId").text();
		var processInstId = jn(".list_table").find(".selected").find(".processInstId").text();
		var url = "";
		if(ssapsId == ""){
			alertMsg.error("请选择项目！");
			url = "<s:property value="page.url"/>";
			jn(this).attr("href", url);
		}else if(processInstId != ""){
			alertMsg.error("该项目已启动！");
			url = "<s:property value="page.url"/>";
			jn(this).attr("href", url);
		}else{
			url = "../ssaps/ssaps!configAutoStart.action?ssapsId=" + ssapsId;
			jn(this).attr("href", url);
		}
	});
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				型号代号：<input type="text" name="paramMap['s.typeCode like']" value="<s:property value="paramMap['s.typeCode like']"/>" />
			</li>
			<li>
				分系统：<input type="text" name="paramMap['s.modelName like']" value="<s:property value="paramMap['s.modelName like']"/>" />
			</li>
			<li>
				产品代号：<input type="text" name="paramMap['s.productCode like']" value="<s:property value="paramMap['s.productCode like']"/>" />
			</li>
			<li>
				产品名称：<input type="text" name="paramMap['s.productName like']" value="<s:property value="paramMap['s.productName like']"/>" />
			</li>
			<li>
				单机主管：<input type="text" name="paramMap['s.singleHead.name like']" value="<s:property value="paramMap['s.singleHead.name like']"/>" />
			</li>

		</ul>
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
			<li><a class="add" href="../ssaps/ssaps!inputProjectData.action" target="navTab" rel="currentNavTab"><span>创建项目</span></a></li>
			<li><a class="icon" href="javascript:;" id="start" target="navTab" rel="bigflow"><span>启动流程</span></a></li>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="144" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40">状态</th>
					<th width="40">序号</th>
					<th width="40" style="display:none;">ID</th>
					<th width="40" style="display:none;">流程实例ID</th>
					<th width="100">型号代号</th>
					<th width="100">型号名称</th>
					<th width="130">产品代号</th>
					<th width="150">产品名称</th>
					<th width="80">单机主管</th>
					<th width="80">计划管理</th>
					<th width="80">产品保证</th>
					<th width="80">质量管理</th>
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
					<td align="center" style="display:none;" class="ssapsId"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="processInstId"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productLib.modelCode"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productLib.modelName"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.code"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.name"/></td>
					<td align="center" title="<s:property value="productDetail.singleHead.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.singleHead.name"/></td>
					<td align="center" title="<s:property value="productDetail.planManager.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.planManager.name"/></td>
					<td align="center" title="<s:property value="productDetail.productManager.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productManager.name"/></td>
					<td align="center" title="<s:property value="productDetail.qualityManager.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.qualityManager.name"/></td>
					<td align="center">
						<a href="../ssaps/ssaps!showSSAPS.action?ssapsId=<s:property value="id"/>" target="navTab" class="details">详情</a>
						<%-- &nbsp;| 
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a> --%>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

