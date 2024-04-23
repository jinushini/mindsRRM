<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	var userDialogCallback;//声明回调方法
	
	var $openedObj=$.pdialog.openedObj;//获取打开dialog框的对象

	$(function(){
		//为查询按钮添加事件
		$("#queryBtn").click(function(){
			$.ajax({
				global:false,
				type:'post',
				dataType:"json",
				url:"../system/user!findUserAjax.action",
				data:{
					"userInfo":jd("#userInfo").val()
				},
				success:function(userList){
					var i=0;
					var $users=jd("#users");
					//清空select框
					$users.empty();
					
					for(;i<userList.length;i++){
						$users.append($("<option alt='"+userList[i].name+"' value='"+userList[i].id+"'>"+userList[i].name+"("+userList[i].loginName+")"+"</option>"))
					}
					
				}
			});
		})
		
		//为确认按钮添加事件
		$("#sureBtn").click(function(){
			
			var $selectedOption=$(":selected",jd("#users"));
			$("[type=text]",$openedObj.parent()).val($selectedOption.attr("alt"));
			$("[type=hidden]",$openedObj.parent()).val($selectedOption.attr("value"));
			
			
			//若实现了回调方法，则执行
			if(userDialogCallback)
				userDialogCallback($selectedOption.val(),$selectedOption.attr("alt"));
			
			$.pdialog.closeCurrent();
		})
		
		//为select框添加双击事件
		$("#users").dblclick(function(){
			var $selectedOption=$(":selected",$(this));
			$("[type=text]",$openedObj.parent()).val($selectedOption.attr("alt"));
			$("[type=hidden]",$openedObj.parent()).val($selectedOption.attr("value"));
			jn("#loginName").html($selectedOption.attr("loginName"));
			
			
			//若实现了回调方法，则执行
			if(userDialogCallback)
				userDialogCallback($selectedOption.val(),$selectedOption.attr("alt"));
			
			$.pdialog.closeCurrent();
		})
		
		//为左边的组织机构树添加事件
		$("[organizationId]").click(function(){
			$.ajax({
				global:false,
				type:'post',
				dataType:"json",
				url:"../system/user!findUserAjax.action",
				data:{
					"organizationId":$(this).attr("organizationId"),
					"userInfo":$("#userInfo").val()
				},
				success:function(userList){
					var i=0;
					var $users=$("#users");
					
					//清空select框
					$users.empty();
					
					for(;i<userList.length;i++){
						$users.append($("<option loginName='"+userList[i].loginName+"' alt='"+userList[i].name+"' value='"+userList[i].id+"'>"+userList[i].name+"("+userList[i].loginName+")"+"</option>"))
					}
					
				}
			});
			
		})
	})
//-->
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
		<div style=" float:left; display:block; overflow:auto; width:210px; height:97%; border:solid 1px #CCC; line-height:21px; background:#FFF;">
			<ul class="tree">
				<s:iterator value="list" var="e1">
					<li><a organizationId="<s:property value="#attr.e1.id"/>"><s:property value="#attr.e1.name"/></a>
					<s:if test="#attr.e1.organizationSet.size()!=0">
						<ul>
							<s:iterator value="#attr.e1.organizationSet" var="e2">
								<li><a organizationId="<s:property value="#attr.e2.id"/>"><s:property value="#attr.e2.name"/></a>
								<s:if test="#attr.e2.organizationSet.size()!=0">
								<ul>
									<s:iterator value="#attr.e2.organizationSet" var="e3">
										<li><a organizationId="<s:property value="#attr.e3.id"/>"><s:property value="#attr.e3.id"/></a>
										<s:if test="#attr.e3.organizationSet.size()!=0">
											<ul>
												<s:iterator value="#attr.e2.organizationSet" var="e4">
													<li><a organizationId="<s:property value="#attr.e4.id"/>"><s:property value="#attr.e4.name"/></a></li>
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
		<div style=" float:left; display:block; margin-left:20px;margin-right:0px;margin-bottom:0px; overflow:auto; width:254px; height:310px; line-height:21px; background:#FFF;">
			<table cellpadding="0" cellspacing="0" width="100%" border="0">
				<tr>
					<td width="30%" nowrap="nowrap" style="font-size: 13px;">用户信息：</td>
					<td><input id="userInfo" type="text" size="10"><a class="button" id="queryBtn" href="###"><span>查询</span></a></td>
				</tr>
				<tr>
					<td colspan="2" valign="bottom">
						<select class="select" style="border:solid 1px #CCC;width:245px;margin-top:6px;margin-bottom:0px;font-size: 13px;height:278px;" size="15" id="users" ondblclick="_select_dbl_click()"></select>
					</td>
				</tr>
			</table>
		</div>
	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button id="sureBtn" type="button">确定</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
</div>
