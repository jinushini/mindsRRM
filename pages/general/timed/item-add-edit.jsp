<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//重复规则
	jd("input[name='item.isRepeat']").change(function(){
		var repeat = jd(this).val();
		if(repeat == 1){
			jd(".repeatMode").show();
		}else if(repeat == 0){
			jd(".repeatMode").hide();
		}
	});
	jd(function(){
		var repeat = jd("input[name='item.isRepeat']:checked").val();
		if(repeat == 1){
			jd(".repeatMode").show();
		}else if(repeat == 0){
			jd(".repeatMode").hide();
		}
	})
	
	jd(function(){
		showItemunit();
	});
	
	//事项来源下拉框改变事件
	jd("#itemsource").change(function(){
		showItemunit();
	});
	
	//显示单位/组织/党支部下拉框
	function showItemunit(){
		jd("#itemteam").hide();
		var itemsource = jd("#itemsource").val();
		if(itemsource == "党支部"){
			jd("#itemteam").show();
		}
	}
</script>
<div class="pageContent">
  <form method="post" action="../general/timed_DispatchPlanItem_addOrModify_plan-item-list.action" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input type="hidden" name="op" value="<s:property value="op"/>"/>
	<input type="hidden" name="item.id" value="<s:property value="item.id"/>"/>
	<input type="hidden" name="item.isPlan" value="<s:property value="item.isPlan"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="op == 0 ? '编辑' : '新增'"/>事项</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">事项名称：</td>
				<td><input type="text" name="item.name" value="<s:property value='item.name'/>" placeholder="PS:支部大会" class="required"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">事项要求：</td>
				<td><input type="text" name="item.demand" value="<s:property value='item.demand'/>" placeholder="PS:每季度1次" ></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">完成目标：</td>
				<td><input type="text" name="item.target" value="<s:property value='item.target'/>" placeholder="PS:组织召开会议" class="required"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">年度：</td>
				<td><input type="text" name="item.years" value='<s:property value="item.years"/>' placeholder="PS:2020" onkeyup="value=value.replace(/[^\d]/g,'')" class="required" minlength="4" maxlength="4"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">责任人：</td>
				<td align="center">
					<input name="item.receiverIds" type="hidden" class="required" value="<s:property value='item.receiverIds'/>" readonly="readonly"/>
					<input name="item.receiverNames" type="text" class="required" value="<s:property value='item.receiverNames'/>" readonly="readonly" onclick="$(this).next().click()" size="50%" placeholder="提醒给谁/给谁发送代办，可多人，任一人完成即可"/>
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">是否需要审批环节：</td>
				<td>
					<input type="radio" name="item.needApprove" <s:if test="item.needApprove == 1">checked="checked"</s:if> value="1"/>是<input type="radio" name="item.needApprove" <s:if test="item == null || item.needApprove == 2">checked="checked"</s:if> value="2"/>否
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">事项来源：</td>
				<td>
					<select name="item.source" id="itemsource">
						<option value="党支部">党支部</option>
					</select>
				</td>
			</tr>
			<tr hidden="hidden" id="itemteam">
				<td align="center" style="font-weight: bold;">支部名称：</td>
				<td>
					<select name="item.team">
						<option value="微波有源事业部党支部">微波有源事业部党支部</option>
						<option value="微波无源事业部党支部">微波无源事业部党支部</option>
						<option value="微波功率部件事业部第一党支部">微波功率部件事业部第一党支部</option>
						<option value="微波功率部件事业部第二党支部">微波功率部件事业部第二党支部</option>
						<option value="微波所综合管理处党支部">微波所综合管理处党支部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;" colspan="2">事项描述：</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="item.content" class="editor required" rows="13" tools="Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About" style="width: 100%;"><s:property value="item.contentStr" escape="false" /> </textarea></td>
			</tr>
		</table>
	</fieldset>
	<fieldset <s:if test="op == 0">style="display:none;"</s:if>>
		<legend>编排计划</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">事项截止日期（首次）：</td>
				<td>
					<input type="text" name="item.plans[0].deadline" value="<s:date name='item.plans[0].deadline' format='yyyy-MM-dd'/>" class="required deadline"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true, isShowClear:false, onpicked:function(){jd('.remindTime').val('');jd('.remindTime').val(convertToDate(Date.parse(jd(this).val())+((jd('.remindTime').val()-2)*1000*60*60*24)));} })">
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">提醒时间（首次）：</td>
				<td>
					<input type="text" name="item.plans[0].remindTime" value="<s:date name='item.plans[0].remindTime' format='yyyy-MM-dd'/>" class="required remindTime" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true, isShowClear:false, onpicked:function(){jd('.deadline').val('');jd('.deadline').val(convertToDate(Date.parse(jd(this).val())+((jd('.deadline').val()+2)*1000*60*60*24)));} })">
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">重复机制：</td>
				<td><input type="radio" name="item.isRepeat" value="1" <s:if test="item.isRepeat == 1">checked="checked"</s:if>/>是<input type="radio" name="item.isRepeat" value="0" <s:if test="item == null || item.isRepeat == 0">checked="checked"</s:if> />否</td>
			</tr>
			<%-- <tr style="display:none;" class="repeatMode">
				<td align="center" style="font-weight: bold;">取消提醒：</td>
				<td>
					<input name="item.stopRemindTime" value="<s:date name='item.stopRemindTime' format='yyyy-MM-dd'/>" class="remindTime" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){} })">
				</td>
			</tr> --%>
			<tr style="display:none;" class="repeatMode">
				<td align="center" style="font-weight: bold;">重复模式：</td>
				<td>
					<select name="item.repeatMode">
						<!-- <option value="1">每天一次</option> -->
						<!-- <option value="2">每周一次</option> -->
						<option value="3">每月一次</option>
						<option value="4">每季度一次</option>
						<option value="5">每半年一次</option>
						<option value="6">每年一次</option>
					</select>
				</td>
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