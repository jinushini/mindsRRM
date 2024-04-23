<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> -->
<link rel="stylesheet" type="text/css" media="screen" href="../../css/jquery.treeview.css" />
<%-- <script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script> --%>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
<script type="text/javascript">
		jn(function() {
			jn("li>a").css("font-size", "17px");
			jn("#tree").treeview({
				collapsed: true,
				animated: "medium",
				//control:"#sidetreecontrol",
				persist: "location"
			});
			
			jn("li>a").click(function(){
				jn("a","#tree").css("background-color","");
				jn(this).css("background-color","#7686f1");
				jn("#inputEditMenu").attr("src","../microwave/product_ProductOrder_showProductOrder_youy-order-show-in-tree.action?num="+jn(this).parent().attr("id")+"&dt"+new Date());
				return false;
			});
		});
		function updateMenuName(menuId,menuName){
			jn("[id="+menuId+"]>a").html(menuName);
		};
</script>
<!-- </head> -->
<!-- 菜单管理页面——树形菜单展示部分 -->
<!-- <body> -->
  <div style="width:250px;float:left;clear:left;overflow:hidden;text-align: left;padding-left: 1px;padding-top: 8px;">
	<ul id="tree">
		<li class="hasChildren" id="<s:property value="productOrder.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="productOrder.name"/></span><s:property value="productOrder.code"/></a>
			<s:if test="productOrder.childProductOrderSet.size()!=0">
			<ul>
				<s:iterator value="productOrder.childProductOrderSet" var="e1">
				<li class="hasChildren" id="<s:property value="#attr.e1.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e1.name"/></span><s:property value="#attr.e1.code"/></a>
					<s:if test="#attr.e1.childProductOrderSet.size()!=0">
					<ul>
						<s:iterator value="#attr.e1.childProductOrderSet" var="e2">
							<li class="hasChildren" id="<s:property value="#attr.e2.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e2.name"/></span><s:property value="#attr.e2.code"/></a>
								<s:if test="#attr.e2.childProductOrderSet.size()!=0">
								<ul>
									<s:iterator value="#attr.e2.childProductOrderSet" var="e3">
										<li class="hasChildren" id="<s:property value="#attr.e3.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e3.name"/></span><s:property value="#attr.e3.code"/></a>
											<s:if test="#attr.e3.childProductOrderSet.size()!=0">
											<ul>
												<s:iterator value="#attr.e3.childProductOrderSet" var="e4">
													<li class="hasChildren" id="<s:property value="#attr.e4.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e4.name"/></span><s:property value="#attr.e4.code"/></a>
														<s:if test="#attr.e4.childProductOrderSet.size()!=0">
														<ul>
															<s:iterator value="#attr.e4.childProductOrderSet" var="e5">
																<li class="hasChildren" id="<s:property value="#attr.e5.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e5.name"/></span><s:property value="#attr.e5.code"/></a>
																	<s:if test="#attr.e5.childProductOrderSet.size()!=0">
																	<ul>
																		<s:iterator value="#attr.e5.childProductOrderSet" var="e6">
																			<li class="hasChildren" id="<s:property value="#attr.e6.id"/>"><a><span style="font-weight:bold;font-size:16px;"><s:property value="#attr.e6.name"/></span><s:property value="#attr.e6.code"/></a></li>
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
			</s:if>
		</li>
	</ul>
   </div>
   <div style="width: 700px;text-align: right;float: left;">
  	<iframe id="inputEditMenu" width="700px" src='../microwave/product_ProductOrder_showProductOrder_youy-order-show-in-tree.action?num=<s:property value="productOrder.id"/>' height="650px" frameborder="0px"></iframe>
  </div>
<!-- </body>
</html> -->