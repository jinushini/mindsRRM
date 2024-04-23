<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" media="screen" href="../../css/jquery.treeview.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../css/main.css" />

<style type="text/css">
	.tree-div{
		width:220px;
		height:307px; 
		overflow-y:auto; 
		float:left;
		clear:left;
		overflow:hidden;
		text-align: left;
		padding-left: 1px;
		padding-top: 8px;
		font-size: 12px;
		scrollbar-base-color : #C5DBEC;
		scrollbar-darkshadow-color : #A6C9E2;
	}
</style>

<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>

<script type="text/javascript">
		$(function() {
			$("#tree").treeview({
				collapsed: true,
				animated: "medium",
				persist: "location"
			});
			
			$("li>span").click(function(){
				//颜色变化
				$("span","#tree").css("background-color","");
				$(this).css("background-color","#7686f1");
				
				//得到li
				organizationId=$(this).parent().attr("id");
				//设置userInfo文本框为空值
				$("#userInfo").val("");
				
				getUserList(organizationId);
				
			});
			
			//为查询按钮添加事件
			$("#queryBtn").click(function(){
				getUserList();
			});
			
			$("#userInfo").bind('keydown',function(e){
				var key=e.which;
				if(key==13){
					e.preventDefault();
					getUserList();
				}
			})
			
			
			function getUserList(organizationId){
				$.post(
					"../system/user!findUserAjax.action",{
					"organizationId":organizationId,
					"userInfo":$("#userInfo").val()
				},function(userList,textStatus){
					var i=0;
					var $users=$("#users");
					
					//清空select框
					$users.empty();
					
					for(;i<userList.length;i++){
						$users.append($("<option alt='"+userList[i].name+"' value='"+userList[i].id+"'>"+userList[i].name+"("+userList[i].loginName+")"+"</option>"))
					}
					
				});
			}
		});
		
</script>
</head>
<body topmargin="0" marginheight="0" leftmargin="0" rightmargin="0" bottommargin="0">
  <div style="font-size:14px; ">选择员工</div>
  <div class="div-border-blue tree-div">  	
	<ul id="tree">
		<s:iterator value="list" var="e1">
			<li class="closed" id="<s:property value="#attr.e1.id"/>"><span><s:property value="#attr.e1.name"/></span>
				<s:if test="#attr.e1.organizationSet.size()!=0">
				<ul>
					<s:iterator value="#attr.e1.organizationSet" var="e2">
						<li class="closed" id="<s:property value="#attr.e2.id"/>"><span><s:property value="#attr.e2.name"/></span>
							<s:if test="#attr.e2.organizationSet.size()!=0">
							<ul>
								<s:iterator value="#attr.e2.organizationSet" var="e3">
									<li class="closed hasChildren openhasChildren" id="<s:property value="#attr.e3.id"/>"><span><s:property value="#attr.e3.name"/></span></li>
									<s:if test="#attr.e3.organizationSet.size()!=0">
										<ul>
											<s:iterator value="#attr.e2.organizationSet" var="e4">
												<li class="closed hasChildren" id="<s:property value="#attr.e4.id"/>"><span><s:property value="#attr.e4.name"/></span></li>
											</s:iterator>
										</ul>
									</s:if>
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
   
   <div style="float:left;margin-left:20px;font-size: 12px;">
   	用户信息：<input type="text" style="font-size: 12px;height: 20px;width: 95px;" id="userInfo"><input type="button" id="queryBtn"  class="query-button" style="height: 20px;"><br/>
  	<select style="width:220px;margin-top:6px;font-size: 13px;" size="17" id="users" ondblclick="_select_dbl_click()">
  	</select>
  </div>
  <script type="text/javascript">
  	//$("#_hidden_body").hide();
  </script>
