<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action="../general/post_Post_addOrEdit_post-list.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="op" value="<s:property value="op"/>"/>
	<input type="hidden" name="post.id" value="<s:property value="post.id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="op == 1 ? '新增' : '编辑'"/>公文</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="10%" style="font-weight: bold;">公文标题：</td>
				<td width="40%"><input name="post.title" value='<s:property value="post.title"/>' size="90%"/></td>
				<%-- <td align="center" width="10%" style="font-weight: bold;">公文编号：</td>
				<td width="40%"><input name="post.code" value='<s:property value="post.code"/>' size="90%"/></td> --%>
			</tr>
			<tr>
				<td align="center" width="10%" style="font-weight: bold;">密级：</td>
				<td align="left">
					<select name="post.security" width="50">
						<s:iterator value="list" status="st">
							<option value="<s:property value="key"/>" <s:if test="key == post.security">selected="selected"</s:if>><s:property value="value"/></option>							
						</s:iterator>
					</select>
				</td>	
				<td align="center" width="10%" style="font-weight: bold;">签发人</th>
				<td >
					<input name="post.signUser.id" type="hidden" class="required" value="<s:property value='post.signUser.id'/>"/>
					<input name="post.signUser.name" type="text" class="required" value="<s:property value='post.signUser.name'/>" readonly="readonly" onclick="$(this).next().click()"/>
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="post.content" class="editor required" rows="30" style="width: 100%;" tools="Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,|Table" upImgUrl="../dispatchPlan/dispatchAppr!upload.action" upImgExt="jpg,jpeg,gif,png">
							<s:property value="post.contentStr" escape="false" /> 
					</textarea>
				</td>
			</tr>
			<tr style="display:none;">
				<td align="center" width="10%" style="font-weight: bold;">分类：</td>
				<td><input name="post.template" value='<s:property value="post == null ? 'temp2' : post.template"/>' size="90%"/></td>
			</tr>
			<tr>
				<td align="center" width="10%" style="font-weight: bold;">编写单位：</td>
				<td><input name="post.sponsor" value='<s:property value="post == null ? currentUser.organization.mainName : post.sponsor"/>' size="90%"/></td>
				<td align="center" width="10%" style="font-weight: bold;">印发日期：</td>
				<td><input name="post.issueDate" value="<s:date name='post.issueDate' format='yyyy-MM-dd'/>" required="required" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true, isShowClear:false, onpicked:function(){} })"></td>
			</tr>
			<tr>
				<td align="center" width="10%" style="font-weight: bold;">主送：</td>
				<td><input name="post.senTo" value='<s:property value="post.senTo"/>' size="90%"/></td>
				<td align="center" width="10%" style="font-weight: bold;">抄送：</td>
				<td><input name="post.carbonCopy" value='<s:property value="post.carbonCopy"/>' size="90%"/></td>
			</tr>			
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>