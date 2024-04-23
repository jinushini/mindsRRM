<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	function buildSummary(){
	}
	
//-->
</script>
<tr>
	<td colspan="4">
		<textarea name="meeting.summary" id="summary1" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summary" escape="false"/> </textarea>
	</td>
</tr>