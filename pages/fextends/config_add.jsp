<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/systemConfig!showList.action")
	})
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm"
		action="../fextends/systemConfig!add.action"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br />
			<br />
			<div style="text-align: center; font-size: 20px;">
				<b>新增配置</b>
			</div>
			<input name="systemConfig.id" type="hidden"
				value="<s:property value="systemConfigId"/>">
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>
							类型
						</th>
						<td>
							<input name="systemConfig.key" type="text" class="required">
						</td>

					</tr>
					<tr>
						<th width='15%'>
							描述
						</th>
						<td>
							<input name="systemConfig.value" type="text" class="required">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button id="saveBtn" type="submit">
								保存
							</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" id="cancelBtn">
								取消
							</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>