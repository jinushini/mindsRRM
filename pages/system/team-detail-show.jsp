<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	jd("#cancelBtn").click(function(){
		jd(".close").click();
	})
	

</script>
<div class="pageHeader">
	<div class="searchBar">	
	</div>
</div>
<div class="pageContent">
	<form action="../designInfo/Mcm_modifyMcm_mcm.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<div layoutH="70" style="margin:30px 30px -25px; font-size:16px;line-height: 28px;">	
			<table class="edit_table" width="95%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:10%;text-align: right;vertical-align:top;border:hidden;">隶属处室：</td>
					<td style="width:20%;border:hidden;">
						<s:property value="teamVo.organization.fullName"/>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;vertical-align:top;border:hidden;">班组名称：</td>
					<td style="width:20%;border:hidden;">
						<s:property value="teamVo.name"/>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;vertical-align:top;border:hidden;">班组长：</td>
					<td style="width:20%;border:hidden;">
						<s:property value="teamVo.leadNames"/>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;vertical-align:top;border:hidden;">班组成员：</td>
					<td style="width:20%;border:hidden;">
						<s:property value="teamVo.memberNames"/>
					</td>
				</tr>
			</table>
		</div>	
		<div class="formBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li> -->
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
			</ul>
		</div>
	</form>
</div>