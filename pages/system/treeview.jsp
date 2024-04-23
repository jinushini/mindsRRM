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
				//control:"#sidetreecontrol",
				persist: "location"
			});
			
			var i;
			var $lis=$("li,ul");
			for(i=1;i<$lis.length;i++){
				$lis.eq(i).attr("id","node_"+i);
			}
			
			$("#add").click(function(){
				
				var $li=$("li:eq(3)");
				//$li.remove();
				var branches=$("<li>"+$li.html()+"<ul><li>新节点</li></ul></li>").appendTo($li.parent());
				$("#tree").treeview({
					add:branches
				}); 
				$li.remove();
				//alert($ul.attr("id"));
			});
		})
		
</script>
</head>
<body>
  <div>
	<ul id="tree">
		<s:iterator value="list" var="e1">
			<li class="open"><span><s:property value="#attr.e1.name"/></span>
				<s:if test="#attr.e1.menuSet.size()!=0">
				<ul>
					<s:iterator value="#attr.e1.menuSet" var="e2">
						<li class="open"><span><s:property value="#attr.e2.name"/></span>
							<s:if test="#attr.e2.menuSet.size()!=0">
							<ul>
								<s:iterator value="#attr.e2.menuSet" var="e3">
									<li><span><s:property value="#attr.e3.name"/></span></li>
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
  </div>
  
  <input type="button" id="add" value="添加">
</body>
</html>