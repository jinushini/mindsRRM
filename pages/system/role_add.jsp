<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--

//-->
</script>

<div class="pageContent">
  <form action="../fextends/role!addRole.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
	<input id="userId" name="userId" type="hidden" value="<s:property value="userId"/>"/>
	<div class="pageFormContent" layoutH="56">
	<fieldset>
	<legend>设置角色</legend>
		<table class="list_table list" width="100%" style="table-layout : fixed;" >
			<thead>
				<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="5%" align="center">序号</th>
					<th align="center">角色名称</th>
					<th align="center">角色顺序</th>
					<th align="center">角色类别</th>
					<th align="center">系统标识</th>
					<th align="center">备注</th>
				</tr>
			</thead>
			<tbody checkedValue="<s:property value="user.rolesStr.replace('-',',')"/>">
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value='id'/>">
					<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
					<td align="center"><u:index value="#st.index+1" /></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="train"/></td>
					<td align="center"><s:property value="sort"/></td>
					<td align="center"><s:property value="sysCode"/></td>
					<td align="center"><s:property value="remark"/></td>
					
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" name="confirm" type="submit">提交</button></div></div></li>
		</ul>
	</div>
	</form>
</div>
