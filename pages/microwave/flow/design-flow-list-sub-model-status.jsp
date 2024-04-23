<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
		<span style="display: inline;font-size:20px; color:<s:if test='#attr.c.status==3'>green</s:if>
															<s:elseif test='#attr.c.status==5'>red</s:elseif>
															<s:elseif test='#attr.c.status==0'>gray</s:elseif>
															<s:else>orange</s:else>;" 
		> 
		<s:property value="#attr.c.status==0 ? '●' : '●'"/>
		</span>
