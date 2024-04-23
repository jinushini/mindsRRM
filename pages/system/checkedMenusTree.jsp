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
			var menusStr="<s:property value="role.menusStr"/>"
			$("#tree").treeview({
				collapsed: true,
				animated: "medium",
				//control:"#sidetreecontrol",
				persist: "location"
			});
			
			$("a").click(function(){
				if($(this).find(">input").attr("checked"))
					$(this).parents("li").find(">a [type=checkbox]").attr("checked",true);
				
				if($(":checked",getParentNode($(this).parent())).length==1){
					$(":checked",getParentNode($(this).parent())).attr("checked",false);
				}
			});
			
			function getParentNode($node){
				var $parentNode;
				$parentNode=$node.parent();
				if($parentNode[0].tagName=="LI")
					return $parentNode;
				else 
					return getParentNode($parentNode);
			};
			
			$("[type=checkbox]").each(function(){
				var menuId=menusStr.split("-");
				var i;
				for(i=1;i<menuId.length;i++){
					if(menuId[i]==$(this).val()){
						
						$(this).attr("checked",true);
						continue;
					}
				}
			});
			
			
			
			$("#saveBut").click(function(){
				$("#frm").submit();		
			});
		});
</script>
</head>
<body>
<!-- 角色设置权限 --> <!-- class="open hasChildren"的li在页面打开后会自动展开 -->
<form action="roleManager!addAuth.action" method="post" id="frm">
	<input name="roleId" type="hidden" value="<s:property value="roleId"/>">
  	<ul id="tree">
		<s:iterator value="list" var="e1">
			<li class="open hasChildren" id="<s:property value="#attr.e1.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e1.id"/>" /><s:property value="#attr.e1.name"/></a>
				<s:if test="#attr.e1.menuSet.size()!=0">
				<ul>
					<s:iterator value="#attr.e1.menuSet" var="e2">
						<li class="open hasChildren" id="<s:property value="#attr.e2.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e2.id"/>" /><s:property value="#attr.e2.name"/></a>
							<s:if test="#attr.e2.menuSet.size()!=0">
							<ul>
								<s:iterator value="#attr.e2.menuSet" var="e3">
									<li class="open hasChildren" id="<s:property value="#attr.e3.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e3.id"/>" /><s:property value="#attr.e3.name"/></a>
										<s:if test="#attr.e3.menuSet.size()!=0">
											<ul>
												<s:iterator value="#attr.e3.menuSet" var="e4">
													<li class="open hasChildren" id="<s:property value="#attr.e4.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e4.id"/>" /><s:property value="#attr.e4.name"/></a>
														<s:if test="#attr.e4.menuSet.size()!=0">
															<ul>
																<s:iterator value="#attr.e4.menuSet" var="e5">
																	<li class="open hasChildren" id="<s:property value="#attr.e5.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e5.id"/>" /><s:property value="#attr.e5.name"/></a>
																		<s:if test="#attr.e5.menuSet.size()!=0">
																			<ul>
																				<s:iterator value="#attr.e5.menuSet" var="e6">
																					<li class="openhasChildren" id="<s:property value="#attr.e6.id"/>"><a><input name="menuId" type="checkbox" value="<s:property value="#attr.e6.id"/>" /><s:property value="#attr.e6.name"/></a></li>
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
</form>
<div align="left">
	<input type="button" id="saveBut" value="保存">
	&nbsp;&nbsp;&nbsp; <input type="button" onclick="window.history.back();" value="返回">
</div>
</body>
</html>