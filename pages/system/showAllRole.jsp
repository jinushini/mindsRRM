<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My First Grid</title>
 
<link rel="stylesheet" type="text/css" media="screen" href="../../css/redmond/jquery-ui-1.7.3.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../css/ui.jqgrid.css" />
 
<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="../../js/grid.locale-cn.js" type="text/javascript"></script>
<script src="../../js/jquery.jqGrid.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 	var roleIds='<s:property value="user.rolesStr"/>';
 	$(function(){
        	jQuery("#roleList").jqGrid({
		       	url: "roleManager!showAllRole.action",
		       	datatype: "json",
		       	mtype:"post",
		       	height: "auto",
		       	//width:600,
		       	rowNum: 20,
		       	rownumbers:true,
		       	autowidth:true,
		       	multiselect:true,
		       	pagerpos:"right",
		       	recordpos:"center",
		       	loadComplete:jqGridLoadComplete,
		       	rowList: [10,20,30],
	        	colNames:['序号','角色名称','角色顺序','系统标识'],
	          	colModel:[
	          		{name:'id',index:'r.id', width:60, sorttype:"int",hidden:true},
	          		{name:'name',index:'r.name', width:90, sorttype:"string"},
	          		{name:'train',index:'r.train', width:50, sorttype:"int"},
	          		{name:'sysCode',index:'r.sysCode', width:50, sorttype:"string"}
	          	],
	          	pager: "#pRoleList",
	          	viewrecords: true,
	          	jsonReader:{
	          		repeatitems:false,
	          		root:"list",
	          		page:"page.pageNo",
	          		total:"page.totalPage",
	          		records:"page.count"
	          	},
	          	prmNames:{
	          		page:"page.pageNo",
	          		rows:"page.pageSize",
	          		sort:"sort",
	          		order:"order"
	          	}
	       }).navGrid(
	       		'#pRoleList',
	       		{edit:false,add:false,del:false,search:true,refresh:false,searchtext:"查询",refreshtext:"刷新"},
	       		{},
	       		{},
	       		{},
				{closeOnEscpe:true,multipleSearch:true,closeAfterSearch:true}
			 ).jqGrid("navButtonAdd","#pRoleList",
				{caption:"重置",onClickButton:resetSelected,position:"last"}
			 ).jqGrid("navButtonAdd","#pRoleList",
				{caption:"确定",onClickButton:setRole,position:"last"}
			 ).jqGrid("navButtonAdd","#pRoleList",
				{caption:"返回",onClickButton:goBack,position:"last"}
			 );
	       	 function setRole(){
			   	   var roleIds=jQuery("#roleList").jqGrid("getGridParam","selarrrow");
			   	   if(roleIds.length==0){
			   	   	 alert("请选择角色");
			   	   	 return;
			   	   }
			   	   var i;
			   	   for(i=0;i<roleIds.length;i++){
			   	   	  $("#roleIds").val($("#roleIds").val()+"-"+roleIds[i])
			   	   }
			   	   $("#roleIds").val($("#roleIds").val().substring(1));
			   	   $("#frm").submit();
		 	  }
	        
		       function jqGridLoadComplete(){
		    	  if(roleIds=="") return ;
		    	  var roleIdarr=roleIds.split("-");
		    	  var i;
		    	  for(i=0;i<roleIdarr.length;i++){
		    		   jQuery("#roleList").setSelection(roleIdarr[i],true);
		    	  }
		    	 
		       }
		       function resetSelected(){
		    	   jQuery("#roleList").resetSelection();
		       }
		       function goBack(){
		    	   window.history.back();
		       }
		  
 	});
 	
</script>
</head>
<body>
<table id="roleList"></table>
<div id="pRoleList"></div>
<form action="user!addRole.action" id="frm">
	<input id="userId" name="userId" type="hidden" value="<s:property value="#parameters['userId']"/>"/>
	<input id="roleIds" name="roleIds" type="hidden" value=""/>
</form>
</body>
</html>