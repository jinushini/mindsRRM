<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="../../css/jquery.treeview.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#saveBut").click(function(){
			$("#frm").submit();	
		});
		$("#addMenuBut").click(function(e){
			e.preventDefault();
			window.location.href="menu!inputAdd.action?menuId="+$("[name='menu.id']").val();
		});
		$("#delMenuBtn").click(function(e){
			e.preventDefault();
			window.location.href="menu!delete.action?id="+$("[name='menu.id']").val();
		});
		$("#addRootMenuBut").click(function(e){
			e.preventDefault();
			window.location.href="menu!inputAdd.action";
		});
		
	});
	$(window).load(function(){
		if($("center").html()!=""){
			window.parent.updateMenuName('<s:property value="menu.id"/>','<s:property value="menu.name"/>');
		}
	});
</script>
</head>
<!-- 菜单管理页面——操作部分 -->
<body>
	<H3><FONT color="red"><s:property value="msg"/></FONT></H3>
   <form action='menu!<s:property value="op"/>.action' method="post" id="frm">
   	<input type="hidden" name="menuId" value="<s:property value="menuId"/>">
   	<input type="hidden" name="menu.id" value="<s:property value="menu.id"/>">
	<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
		<tr>
			<td>ID</td>
			<td><s:property value="menu.id"/></td>
		</tr>
		<tr>
			<td>菜单名称</td>
			<td><input type="text" style="width: 500px;" name="menu.name" value="<s:property value="menu.name"/>"/> </td>
		</tr>
		<tr>
			<td>菜单地址</td>
			<td><input type="text" style="width: 500px;" name="menu.href" value="<s:property value="menu.href"/>"/> </td>
		</tr>
		<tr>
			<td>菜单序号</td>
			<td><input type="text" style="width: 500px;" name="menu.sort" value="<s:property value="menu.sort"/>"/> </td>
		</tr>
		<tr>
			<td>菜单图片</td>
			<td><input type="text" style="width: 500px;" name="menu.icon" value="<s:property value="menu.icon"/>"/> </td>
		</tr>
		<tr>
			<td nowrap="nowrap">菜单打开时的图片</td>
			<td><input type="text" style="width: 500px;" name="menu.openIcon" value="<s:property value="menu.openIcon"/>"/> </td>
		</tr>
		<tr>
			<td>菜单级别</td>
			<td><input type="text" style="width: 500px;" name="menu.level" value="<s:property value="menu.level"/>"/> </td>
		</tr>
		<tr>
			<td>菜单是否有效</td>
			<td><input type="text" style="width: 500px;" name="menu.enable" value="<s:property value="menu.enable"/>"/> </td>
		</tr>
		<tr>
			<td>菜单描述</td>
			<td><input type="text" style="width: 500px;" name="menu.description" value="<s:property value="menu.description"/>"/></td>
		</tr>
		<tr>
			<td>external</td>
			<td><input type="text" style="width: 500px;" name="menu.external" value="<s:property value="menu.external"/>"/></td>
		</tr>
	</table>
	<br/>
	<table width="90%" cellspacing="1" cellpadding="2" align="center" class="">
		<tr>
			<td width="40%" style="text-align: center;">
				<input type="button" id="saveBut" value="保存">
				<s:if test="showDelBtn">
					<input type="button" id="delMenuBtn" value="删除">
				</s:if>
			</td>
			<td width="60%" style="text-align: center;">
				<!-- Action中设定当菜单的Level为3时showAddBtn=false,即3级菜单时不能添加下级菜单 -->
				<%-- <s:if test="showAddBtn">
					<input type="button" id="addMenuBut" value="添加下级菜单">
				</s:if> --%>
				<input type="button" id="addMenuBut" value="添加下级菜单">
				<s:if test='op!="add"'>
					<input type="button" id="addRootMenuBut" value="添加根节点">
				</s:if>
			</td>
		</tr>
	</table>
	<center>
		
		
	</center>
   </form>
</body>
</html>