<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="../../css/jquery.treeview.css" />
<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script type="text/javascript">
		$(function() {
			$("#tree").treeview({
				collapsed: true,
				animated: "medium",
				control:"#sidetreecontrol",
				persist: "location"
			});
		})
		
</script>
</head>
<body>
  <div style="width:auto;float:left;clear:left;overflow:hidden;text-align: left;padding-left: 1px;padding-top: 8px">
  	<iframe scrolling="no" height="1000px" src="menu!showMainMenus.action" frameborder="0px" ></iframe>
  </div>
  
  <div style="width: 500px;text-align: left">
  	<div><input type="button" id="addRootBut" value="添加根节点"/></div>
  </div>
</body>
</html>