<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/HtyFlow_showFlowDefKeyList_custom-flow-key-config-list.action")
	})
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm"
		action="../fextends/HtyFlow_addFlowDefKey.action"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br />
			<br />
			<div style="text-align: center; font-size: 20px;">
				<b>新增流程定义Key</b>
			</div>
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>
							名称
						</th>
						<td>
							<input name="reKey.key" type="text" class="required">
						</td>

					</tr>
					<tr>
						<th width='15%'>
							key值
						</th>
						<td>
							<input name="reKey.value" type="text" class="required">
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