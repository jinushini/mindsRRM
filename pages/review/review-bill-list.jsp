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
			var url="../review/review!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
			$.pdialog.open(url,"new_msg", "查看流程图",options);
		}		
	}); 
	jn("#viewImgBtn").click(function(){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../review/review!flowImage.action";
		$.pdialog.open(url,"new_msg", "查看流程图",options);	
	})
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					复查主题：<input type="text" name="paramMap['r.reviewBillName like']" value="<s:property value="paramMap['r.reviewBillName like']"/>" />
				</td>
				<td>
					创建人：<input type="text" name="paramMap['r.tableManager.name like']" value="<s:property value="paramMap['r.tableManager.name like']"/>" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li> -->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%-- <li><a class="add" href="../review/review!inputAddReviewProduct.action" target="navTab" rel=""><span>选择产品</span></a></li> --%>
			<li><a class="add" href="../review/Review_enterAdd_review-request-add.action" target="navTab" rel=""><span>新建复查项目</span></a></li>
			<%-- <li><a class="icon" href="../review/review!showReviewBill.action?reviewBillId={id}" target="navTab" rel="" class="details"><span>详情</span></a></li> --%>			
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="20">状态</th>
					<th width="20" align="center">序号</th>
					<th width="200">复查主题</th>
					<th width="150">创建人</th>
					<th width="100">开始日期</th>				
					<th width="100">截止日期</th>				
					<th width="20">操作</th>				
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st" var="a">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" <s:if test="status==3">style="color:green;font-size:30px"</s:if><s:elseif test="status==2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>●</td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="reviewBillName"/></td>
					<td align="center"><s:property value="tableManager.name"/></td>
					<td align="center"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>		
					<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>		
					<td align="center"><a href="../review/review!showReviewBill.action?reviewBillId=<s:property value='id'/>" target="navTab" rel="" class="details"><span>详情</span></a></td>	
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

