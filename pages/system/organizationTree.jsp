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
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
<script type="text/javascript">
		$(function() {
			$("#tree").treeview({
				collapsed: true,
				animated: "medium",
				//control:"#sidetreecontrol",
				persist: "location"
			});
			
			$("li>a").click(function(){
				$("a","#tree").css("background-color","");
				$(this).css("background-color","#7686f1");
				$("#inputEdit").attr("src","organization!inputEdit.action?id="+$(this).parent().attr("id")+"&dt"+new Date());
				return false;
			});
			
			$("#addBtn").click(function(){
				$("#inputEdit").attr("src","addOrganization.jsp");
			});
		});
		
</script>
</head>
<body>
  <div style="width:250px;float:left;clear:left;overflow:hidden;text-align: left;padding-left: 1px;padding-top: 8px">
	<ul id="tree">
		<s:iterator value="list" var="e1">
			<li class="open hasChildren" id="<s:property value="#attr.e1.id"/>"><a><s:property value="#attr.e1.name"/></a>
				<s:if test="#attr.e1.organizationSet.size()!=0">
				<ul>
					<s:iterator value="#attr.e1.organizationSet" var="e2">
						<li class="open hasChildren" id="<s:property value="#attr.e2.id"/>"><a><s:property value="#attr.e2.name"/></a>
							<s:if test="#attr.e2.organizationSet.size()!=0">
							<ul>
								<s:iterator value="#attr.e2.organizationSet" var="e3">
									<li class="openhasChildren" id="<s:property value="#attr.e3.id"/>"><a><s:property value="#attr.e3.name"/></a></li>
								</s:iterator>
							</ul>
							</s:if>
						</li>
					</s:iterator>
				</ul>
				</s:if>
			</li>
		</s:iterator>
	</ul>
	<input type="button" id="addBtn" src="" value="添加主部门">
   </div>
   
   <div style="width: 700px;text-align: right;float: left;">
  	<iframe scrolling="no" id="inputEdit" src="" width="700px" height="1000x" frameborder="0px"></iframe>
  </div>
</body>
</html>