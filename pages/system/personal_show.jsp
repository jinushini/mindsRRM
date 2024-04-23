<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#modify").click(function(){
		navTab.loadUrl("../fextends/user!inputPerson.action")
	})
	
//-->
</script>
<br>
<div style="color:red;font-size:30px" ><s:property value="user.name"/>  您的个人资料</div>
<hr>
<br/>
<br/>
<div class="pageContent">
   <div class="pageFormContent" layoutH="56">
   	<table class="edit_table" width="98%" layoutH="140">
		<tr>
			<td style="text-align: center; width:20%;">部门：</td>
			<td><s:property value="user.organization.fullName"/></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>工号：</td>
			<td><s:property value="user.staffId"/></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>职务：</td>
			<td><lable><s:property value="user.duty"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>职称：</td>
			<td><lable><s:property value="user.position"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>擅长领域：</td>
			<td><lable><s:property value="user.skilledField"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>工作难度系数：</td>
			<td><s:property value="user.difficult_degree"/></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>工作负荷量：</td>
			<td><s:property value="user.workLoad"/></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>收益值：</td>
			<td><lable><s:property value="user.gainVal"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>经验值：</td>
			<td><lable><s:property value="user.expVal"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>专业素养值：</td>
			<td><lable><s:property value="user.professionVal"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>威望值：</td>
			<td><lable><s:property value="user.prestigeVal"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>系统标识：</td>
			<td><lable><s:property value="user.sysCor54rfrfrfrfrfrfrfrfrf4de"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>手写签名：</td>
			<td>
				<div>
					<img src="<s:property value="user.filePath"/>" style="max-width: 80px; max-height: 80px"/>
				</div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>个性签名：</td>
			<td><lable><s:property value="user.signature"/></lable></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>描述：</td>
			<td><lable><s:property value="user.remark"/></lable></td>
		</tr>
	</table>
	<div class="formBar">
		<ul>
 			<li><li><a class="button" href="../fextends/user!inputPerson.action"  target="navTab"><span>完善资料</span></a></li>
		</ul>
		</div>
	</div>
	
</div>

