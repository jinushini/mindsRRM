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
	<form action="../designInfo/Mhic_modifyMhic_mhic.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<input type="hidden" name="mhic.id" value="<s:property value="mhic.id"/>" />
		<div layoutH="60">
			<table width="95%" class="edit_table" style="table-layout:fixed;margin:25px auto;">
				<tr>
					<td align="right" style="width:25%;border:hidden;">产品代号：</td>
					<td style="border:hidden;" style="border:hidden;">
						<span style="color:red;font-size:20px"><s:property value="mhic.code"/></span>
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">产品名称：</td>
					<td style="border:hidden;">
						<input type="text" name="mhic.name" value="<s:property value='mhic.name'/>" class="required" style="width:250px;">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">主管设计师：</td>
					<td style="border:hidden;">
						<input type="hidden" name="mhic.singleHead.id" value="<s:property value='mhic.singleHead.id'/>" class="required">
						<input type="text" name="mhic.singleHead.name" value="<s:property value='mhic.singleHead.name'/>" class="required" readonly="readonly" onclick="$(this).next().click()"  style="width:250px;">
						<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>

					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">设计时间：</td>
					<td style="border:hidden;">
						<input type="text" name="mhic.designDate" value="<s:date name='mhic.designDate' format='yyyy-MM-dd'/>" class="required" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" style="width:250px;">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">备注：</td>
					<td style="border:hidden;">
						<textarea name="mhic.note" rows="2" cols="32"><s:property value="mhic.note"/></textarea>
					</td>
				</tr>
			</table>
		</div>	
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>