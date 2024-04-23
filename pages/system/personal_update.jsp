<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/user!showPerson.action")
	})
	$(function(){
		$('form :input').blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
			 if( $(this).is('#before') ){
			 	if($("#before").val()!="" || $("#new").val() !="" || $("#repeat").val() !=""){
			 		if( this.value != '<s:property value="user.password"/>' ){
					    var errorMsg = '请输入原密码';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '密码输入正确';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
			 	}	
			 }
			 if( $(this).is('#new')){
			 	if($("#new").val()!=""){
			 		if( this.value.length < 6 ){
			 				var errorMsg = '请输入至少6位数的密码';
                       	 	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
					   		var okMsg = '密码输入正确';
					  	  	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
			 		
			 	}	
			 }
			 if( $(this).is('#repeat')){
			 	if($("#repeat").val()!="" || $("#new").val()!=""){
			 		if( this.value != $('#new').val()){
					    var errorMsg = '请与新密码保持一致';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '密码输入正确';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
			 	}
			 }
		}).keyup(function(){
			$(this).triggerHandler("blur");
		}).focus(function(){
			$(this).triggerHandler("blur");
		})
		
		$('#submit').click(function(){
			$('form :input').trigger('blur');
			var numError = $('form .onError').length;
			if(numError){
				return false;
			}
		})
		
		//部门下拉框默认选中、职务下拉框默认选中、职称下拉框默认选中
		jn("#userOrgan").val(jn("#organId").val());
		jn("#userDuty").val(jn("#duty").val());
		jn("#userPosition").val(jn("#position").val());
		
		
	})
	
	
	
//-->
</script>
<br>
<div style="color:red;font-size:30px" ><s:property value="user.name"/>  您正在修改自己的个人信息哦</div>
<hr>
<br/>
<br/>


<div class="pageContent">
<form method="post" enctype="multipart/form-data" id="searchFrm" action='../fextends/user!updatePerson.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
   <input type="hidden" name="user.id" value="<s:property value="user.id"/>"/>
   <div class="pageFormContent" layoutH="56">
   	<table class="edit_table" width="98%" layoutH="140">	
		<tr>
			<td style="text-align: center; width:20%;">登录名：</td>
			<td><s:property value="user.loginName"/></td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;" class="required">原密码：</td>
			<td><input type="password" id="before"/> </td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">新密码：</td>
			<td><input type="password" id="new" /> </td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">重复密码：</td>
			<td><input type="password" id="repeat" name='user.password'/> </td>
		</tr>
		<tr>
			<td style="text-align: center;width:20%;">部门：</td>
			<td>
				<input type="hidden" value="<s:property value='user.organization.id'/>" id="organId"/>
				<select name="user.organization.id" id="userOrgan">
					<s:iterator value="organList" status="st">
						<option value="<s:property value="id"/>" class="option"><s:property value="fullName"/></option>
					</s:iterator>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">职务：</td>
			<td>
				<input type="hidden" value="<s:property value='user.duty'/>" id="duty"/>
				<select name="user.duty" id="userDuty">
					<s:iterator value="dutyList" status="st">
						<option value="<s:property value="value"/>" class="option"><s:property value="key"/></option>
					</s:iterator>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">职称：</td>
			<td>
				<input type="hidden" value="<s:property value='user.position'/>" id="position"/>
				<select name="user.position" id="userPosition">
					<s:iterator value="positionList" status="st">
						<option value="<s:property value="value"/>" class="option"><s:property value="key"/></option>
					</s:iterator>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">擅长领域：</td>
			<td><input type="text" name="user.skilledField" value="<s:property value="user.skilledField"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">个性签名：</td>
			<td><input type="text" name="user.signature" value="<s:property value="user.signature"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: center; width:20%;">
				手写签名：<br/><br/>
				<div style="color:red;">
					(上传新签名前请先删除旧签名)
				</div>
				
			</td>
			<td>
				<div class="upload-wrap">
					<input type="file" name="handWritten" accept="" class="valid" style="left: 0px;">
					<div class="thumbnail">
						<img src="<s:property value="user.filePath"/>" style="max-width: 80px; max-height: 80px">
						<a class="del-icon" href="ajaxDone.html"></a>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<div class="formBar" style="text-align:right" >
		<input type="submit"  value="保存" id="submit" />
		<input type="button" value="取消" id="cancelBtn" />	
	</div>
  </div>
</form>
</div>
