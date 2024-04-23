<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
	function getRowObj(obj){
		var i = 0;
		while(obj.tagName.toLowerCase()!= "tr"){
			obj = obj.parentNode;
			if(obj.tagName.toLowerCase()=="table")
				return null;
		}
		return obj;
	}
	jn("[name=deal]").click(function(){
		var $trObj = $(getRowObj(this));	
		$trObj.remove();
	});
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".personalTask").click();
	})
//-->
</script>

<!-- <div class="pageHeader">
</div> -->
<div class="pageContent">
	<%-- <div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div> --%>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120">
			<thead>
				<tr>
					<!-- <th width="5%" align="center">序号</th> -->
					<th width="">任务名称</th>
					<!-- <th width="">节点名称</th> -->
					<th>截止日期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<%-- <td align="center"><s:property value="#st.index+1"/> </td> --%>
					<td align="center"><s:property value="taskSource"/></td>
					<%-- <td align="center"><s:property value="name"/></td> --%>
					<%-- <td align="center"><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td> --%>
					<td align="center" 
						<s:if test="closeDate != null">
							<s:if test="(new java.util.Date().getTime()-closeDate.getTime())/1000/60/60/24>0">
								style="color:red"
							</s:if>
						</s:if>
						<s:elseif test="closeDate == null">
							<s:if test="(new java.util.Date().getTime()-createDate.getTime())/1000/60/60/24>0">
								style="color:red"
							</s:if>
						</s:elseif>
					>
						<s:date name="closeDate !=null ? closeDate : createDate" format="MM-dd"/>
					</td>
					<td align="center">
						<a href="<s:property value="formKey"/>?taskId=<s:property value="id"/>&processInstId=<s:property value="processInstId"/>" target="navTab" name="deal" rel="personalTask" class="personalTask"><span>处理</span></a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		
	</div>
</div>

