<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	function buildSummary(){
		var summary1 = jn("#summary1").val();
		var summary2 = jn("#summary2").val();
		var summary3 = jn("#summary3").val();
		var summary = summary1 + "㊣" + summary2 + "㊣" +summary3;
		jn("#summary").val(summary);
	}
	
//-->
</script>
<tr style="display: none;">
	<td colspan="4" style="display: none;">
		<textarea name="meeting.summary" id="summary" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summary"/> </textarea>
	</td>
</tr>
<tr>
	<td colspan="4">
		<textarea name="summary1" id="summary1" class="editor required" rows="10" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" placeholder="主要学习内容：">主要学习内容：<s:property value="summary1" escape="false"/></textarea>
	</td>
</tr>
<tr>
	<td colspan="4">
		<textarea name="summary2" id="summary2" class="editor required" rows="10" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" placeholder="举一反三情况：（对质量问题举一反三是否有类似问题及相关措施）">举一反三情况：（对质量问题举一反三是否有类似问题及相关措施）<s:property value="summary2" escape="false"/></textarea>
	</td>
</tr>
<tr>
	<td colspan="4">
		<textarea name="summary3" id="summary3" class="editor required" rows="10" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" placeholder="本班组措施反馈：（对质量问题等本班组的措施和建议）">本班组措施反馈：（对质量问题等本班组的措施和建议）<s:property value="summary3" escape="false"/></textarea>
	</td>
</tr>