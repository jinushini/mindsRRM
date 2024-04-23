<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	var userDialogCallback;//声明回调方法
	
	//这个不是一个很好的解决方案，在快速频繁的点击dialog框时是有问题的。考虑到出现这个现象的概率较低，暂这样处理了。
	var $openedObj=$.pdialog.openedObj;

	//初始化
	var names=$("[type=text]",$openedObj.parent()).val();
	var ids=$("[type=hidden]",$openedObj.parent()).val();
	var idArr=ids.split(";");
	var nameArr=names.split(";");
	for(var i=0;i<idArr.length-1;i++){
		$("#selectedUsers").append($("<option alt='"+nameArr[i]+"' value='"+idArr[i]+"'>"+nameArr[i]+"</option>"))
	}
	
	$(function(){
		
		$("[organizationId]").click(function(){
			$("#userInfo").val("")
			getUserList($(this).attr("organizationId"));
		})
		
		$("#queryBtn").click(function(){
			getUserList();
		})
		
		//为左边的select框添加事件
		$("#queryUserSelect").dblclick(function(){
			var $selectedOption=$("#queryUserSelect").find("option:selected");
			
			for(var i=0;i<$selectedOption.length;i++){
				if($("#selectedUsers").find("[value="+$selectedOption.eq(i).attr("value")+"]").length==0)
					$("#selectedUsers").append($selectedOption.eq(i).clone());
			}
			
		})
		//为左箭头添加事件
		$("#rightBtn").click(function(){
			var $selectedOption=$("#queryUserSelect").find("option:selected");
			
			for(var i=0;i<$selectedOption.length;i++){
				if($("#selectedUsers").find("[value="+$selectedOption.eq(i).attr("value")+"]").length==0)
					$("#selectedUsers").append($selectedOption.eq(i).clone());
			}
			
		})
		
		//为右边的select框添加事件
		$("#selectedUsers").dblclick(function(){
			$(this).find("option:selected").remove();
		})
		
		//为右箭头添加事件
		$("#leftBtn").click(function(){
			$("#selectedUsers").find("option:selected").remove();
		})
		
		//为确认按钮添加事件
		$("#sureBtn").click(function(){
			
			var $selectedOption=$("#selectedUsers").find("option");
			var ids="";
			var names="";
			for(var i=0;i<$selectedOption.length;i++){
				ids+=$selectedOption.eq(i).attr("value")+";";
				names+=$selectedOption.eq(i).attr("alt")+";";
			}
			$("[type=text]",$openedObj.parent()).val(names);
			$("[type=hidden]",$openedObj.parent()).val(ids);
			
			//若实现了回调方法，则执行
			if(userDialogCallback)
				userDialogCallback($selectedOption.val(),$selectedOption.attr("alt"));
			
			$.pdialog.closeCurrent();
		})
	})
	
	
	
	//人员选择
	function _select_dbl_click(){
		var $openedObj=$.pdialog.openedObj;
			
		var $selectedOption=$(":selected","#users");
		$("[type=text]",$openedObj.parent()).val($selectedOption.attr("alt"));
		$("[type=hidden]",$openedObj.parent()).val($selectedOption.val());
		
		
		//若实现了回调方法，则执行
		if(userDialogCallback)
			userDialogCallback($selectedOption.val(),$selectedOption.attr("alt"));
		
		$.pdialog.closeCurrent();
	}
	
	
	function getUserList(organizationId){
		$.ajax({
			global:false,
			type:'post',
			dataType:"json",
			url:"../system/user!findUserAjax.action",
			data:{
				"organizationId":organizationId,
				"userInfo":$("#userInfo").val()
			},
			success:function(userList){
				var i=0;
				var $users=$("#queryUserSelect");
				
				//清空select框
				$users.empty();
				
				for(;i<userList.length;i++){
					$users.append($("<option alt='"+userList[i].name+"' value='"+userList[i].id+"'>"+userList[i].name+"("+userList[i].loginName+")"+"</option>"))
				}
				
			}
		});
	}
	
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
		<div style=" float:left; display:block; margin-left:20px;margin-right:0px;margin-bottom:0px; overflow:auto; width:200px; height:310px; line-height:21px; background:#FFF;">
			<table cellpadding="0" cellspacing="0" width="100%" border="0">
				<tr>
					<td nowrap="nowrap">用户信息：</td>
					<td><input style="float: left;" id="userInfo" type="text" size="15"><a style="float: left;" id="queryBtn" class="btnLook" href="###"><span>查询</span></a></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" valign="bottom">
						<select class="select" style="border:solid 1px #CCC;width:190px;margin-top:6px;margin-bottom:0px;font-size: 13px;height:278px;" multiple="multiple" size="15" id="queryUserSelect"></select>
					</td>
				</tr>
			</table>
		</div>
		<div style="float:left;height:310px;width: 35px;">
			<br/><br/><br/>
			<a class="button" id="rightBtn"><span>=></span></a>
			<br/><br/><br/>
			<a class="button" id="leftBtn"><span><=</span></a>
		</div>
		<div style=" float:left; display:block; margin-left:20px;margin-right:0px;margin-bottom:0px; overflow:auto; width:200px; height:310px; line-height:21px; background:#FFF;">
			<select class="select" style="border:solid 1px #CCC;width:190px;margin-top:6px;margin-bottom:0px;font-size: 13px;height:301px;" size="15" id="selectedUsers" multiple="multiple" ondblclick=""></select>
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
