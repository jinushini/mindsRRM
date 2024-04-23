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
				$("#inputEditMenu").attr("src","menu!inputEdit.action?id="+$(this).parent().attr("id")+"&dt"+new Date());
				return false;
			});
		});
		function updateMenuName(menuId,menuName){
			$("[id="+menuId+"]>a").html(menuName);
		};
</script>
</head>
<!-- 菜单管理页面——树形菜单展示部分 -->
<body>
  <div style="width:250px;float:left;clear:left;overflow:hidden;text-align: left;padding-left: 1px;padding-top: 8px">
	<ul id="tree">
		<s:iterator value="list" var="e1">
			<li class="hasChildren" id="<s:property value="#attr.e1.id"/>"><a><s:property value="#attr.e1.name"/></a>
				<s:if test="#attr.e1.menuSet.size()!=0">
				<ul>
					<s:iterator value="#attr.e1.menuSet" var="e2">
						<li class="hasChildren" id="<s:property value="#attr.e2.id"/>"><a><s:property value="#attr.e2.name"/></a>
							<s:if test="#attr.e2.menuSet.size()!=0">
							<ul>
								<s:iterator value="#attr.e2.menuSet" var="e3">
									<li class="hasChildren" id="<s:property value="#attr.e3.id"/>"><a><s:property value="#attr.e3.name"/></a>
										<s:if test="#attr.e3.menuSet.size()!=0">
										<ul>
											<s:iterator value="#attr.e3.menuSet" var="e4">
												<li class="hasChildren" id="<s:property value="#attr.e4.id"/>"><a><s:property value="#attr.e4.name"/></a>
													<s:if test="#attr.e4.menuSet.size()!=0">
													<ul>
														<s:iterator value="#attr.e4.menuSet" var="e5">
															<li class="hasChildren" id="<s:property value="#attr.e5.id"/>"><a><s:property value="#attr.e5.name"/></a>
																<s:if test="#attr.e5.menuSet.size()!=0">
																<ul>
																	<s:iterator value="#attr.e5.menuSet" var="e6">
																		<li class="hasChildren" id="<s:property value="#attr.e6.id"/>"><a><s:property value="#attr.e6.name"/></a></li>
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
										</s:if>
									</li>
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
   
   <div style="width: 700px;text-align: right;float: left;">
  	<iframe scrolling="no" id="inputEditMenu" width="700px" src="menu!inputAdd.action" height="400px" frameborder="0px"></iframe>
  </div>
</body>
</html>