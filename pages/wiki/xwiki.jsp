<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//window.location.href="http://192.168.1.102:8090/xwiki/bin/view/Main?j_username=<s:property value="currentUser.id"/>";	
	//function page_load(){
		
		//window.parent.document.getElementById("shrink").click()
		
		//window.document.getElementById("form").submit();

		
	//}
	$(function(){
		jn("#form").submit();
		navTab.closeCurrentTab(navTab.getCurrentTabId())
	})
</script>
<body onload="page_load();">
	<form id="form" action="http://192.168.1.108:8080/xwiki-9.11.2/bin/view/Main" method="post" target="_blank">
		<input type="hidden" value="<s:property value="currentUser.id"/>" name="j_username"/>
	</form>
</body>