<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form action="../inform/message!add.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新建消息</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center">标题：</td>
					<td><input type="text" name="message.title"> </td>
				</tr>
				<tr>
					<td align="center">内容：</td>
					<td colspan="4">
						<textarea name="message.content" class="editor required" rows="15" style="width: 91%;"  upImgUrl="../inform/message!upload.action" upImgExt="jpg,jpeg,gif,png" ></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">收件人：</td>
					<td>
						<input type="hidden" name="receiveUserId" class="required">
						<input type="text" name="receiveUserName" class="required" onclick="jn('#receiveUser').click()">
						<a title="人员选择" class="btnLook" height="410" width="715"
							href="../system/user!findMUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false" id="receiveUser"><span>人员选择</span>
						</a>
					</td>
					
				</tr>
			</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" name="confirm" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../inform/message!showAllMsg.action"  target="navTab" ><span>返回</span></a>					
		</ul>
	</div>
   </form>
</div>