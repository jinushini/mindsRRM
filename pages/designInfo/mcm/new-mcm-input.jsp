<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		build();
	})
	jn("#simplify_code").change(function(){
		switch(jn("#simplify_code").val()){
			case 'MCM-R':
				jn("#port").empty().append("<td align='center'>输入接口方式：</td><td><select name='mcm.portInput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td><td align='center'>输出接口方式：</td><td><select name='mcm.portOutput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td>");
				jn("#work_mode").empty().append("<td align='center'>工作模式：</td><td colspan='3'><select name='mcm.workMode'><option value='低噪放'>低噪放</option><option value='低噪放+一次变频'>低噪放+一次变频</option><option value='一次变频'>一次变频</option><option value='低噪放+二次变频'>低噪放+二次变频</option><option value='二次变频'>二次变频</option><option value='调制'>调制</option></select></td>");
				jn("#control_mode").empty().append("<td align='center'>控制模式：</td><td colspan='3'><select name='mcm.controlMode'><option value='固定增益'>固定增益</option><option value='增益步进/可调'>增益步进/可调</option><option value='移相'>移相</option><option value='移相衰减'>移相衰减</option></select></td>");
				jn("#frequency_input").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				jn("#frequency_output").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				break;
			case 'MCM-T':
				jn("#port").empty().append("<td align='center'>输入接口方式：</td><td><select name='mcm.portInput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td><td align='center'>输出接口方式：</td><td><select name='mcm.portOutput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td>");
				jn("#work_mode").empty().append("<td align='center'>工作模式：</td><td colspan='3'><select name='mcm.workMode'><option value='不变频'>不变频</option><option value='一次变频'>一次变频</option><option value='二次变频'>二次变频</option><option value='调制'>调制</option></select></td>");
				jn("#control_mode").empty().append("<td align='center'>控制模式：</td><td colspan='3'><select name='mcm.controlMode'><option value='固定增益'>固定增益</option><option value='增益步进/可调'>增益步进/可调</option><option value='移相'>移相</option><option value='移相衰减'>移相衰减</option></select></td>");
				jn("#frequency_input").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				jn("#frequency_output").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				break;
			case 'MCM-TR':
				jn("#port").empty().append("<td align='center'>输入接口方式：</td><td><select name='mcm.portInput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td><td align='center'>输出接口方式：</td><td><select name='mcm.portOutput'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='微带'>微带</option></select></td>");
				jn("#work_mode").empty().append("<td align='center'>工作模式：</td><td colspan='3'><select name='mcm.workMode'><option value='不变频'>不变频</option><option value='变频'>变频</option></select></td>");
				jn("#control_mode").empty().append("<td align='center'>控制模式：</td><td colspan='3'><select name='mcm.controlMode'><option value='固定增益'>固定增益</option><option value='增益步进/可调'>增益步进/可调</option><option value='移相'>移相</option><option value='移相衰减'>移相衰减</option></select></td>");
				jn("#frequency_input").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				jn("#frequency_output").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				break;
			case 'MCM-FS':
				jn("#port").empty();
				jn("#work_mode").empty();
				jn("#control_mode").empty();
				jn("#frequency_input").empty().append("<option value='内置'>内置</option><option value='10MHz'>10MHz</option><option value='50MHz'>50MHz</option><option value='100MHz'>100MHz</option>");
				jn("#frequency_output").empty().append("<option value='<200MHz'><200MHz</option><option value='200MHz-1000MHz (UHF)'>200MHz-1000MHz (UHF)</option><option value='1000MHz-2000MHz (L)'>1000MHz-2000MHz (L)</option><option value='2000MHz-4000MHz (S)'>2000MHz-4000MHz (S)</option><option value='4000MHz-8000MHz (C)'>4000MHz-8000MHz (C)</option><option value='8000MHz-12400MHz (X)'>8000MHz-12400MHz (X)</option><option value='12400MHz-18000MHz (Ku)'>12400MHz-18000MHz (Ku)</option><option value='18000MHz-40000MHz (Ka)'>18000MHz-40000MHz (Ka)</option><option value='40000MHz-60000MHz (EHF)'>40000MHz-60000MHz (EHF)</option><option value='>60000MHz (EHF以上)'>>60000MHz (EHF以上)</option>");
				break;
			default:
				alert("error");	
		}
	});
	
	jn(".edit_table").on("change","select,[type=radio]",function(){
		build();
	})
	
	function build(){
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/Mcm_buildMcmCode_mcm.action", //发送请求的地址
			data : jn("#searchFrm").serialize(), //发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var mcmList = data.list;
				jn("#mcmPort").html("<input name='mcm.port' type='hidden' value='"+ mcmList[0].port +"' />");
				jn("#similarNumber").html("<input value='"+ mcmList[0].similarNumber +"' type='hidden' class='similarNumber' name='mcm.similarNumber' />");
				jn("#featureCode").html("<input value='"+ mcmList[0].featureCode +"' type='hidden' class='featureCode' name='mcm.featureCode' />");
				var codeStr = "<option value='"+ mcmList[0].code +"' class='0' selected>"+ mcmList[0].code +"</option>";
				for(var i=1;i<mcmList.length;i++){
					codeStr = codeStr + "<option value='"+ mcmList[i].code +"' class='"+ i +"'>"+ mcmList[i].code +"</option>";
				}
				jn("#code").html("<select name='mcm.code' id='mcmCode' style='color:red;font-size:18px;font-weight:bold;height:30px;width:13em;'>"+ codeStr +"</select>");
				
				jn("[name='mcm.code']").change(function(){
					var classVal =  $("[name='mcm.code']").find("option:selected").attr("class");
					jn(".similarNumber").val(mcmList[classVal].similarNumber);
					jn(".featureCode").val(mcmList[classVal].featureCode);
				})
			}
		});
	}
	
</script>
<div class="pageContent">
  <form id="searchFrm" action="../designInfo/Mcm_saveNewMcm_mcm.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>MCM微波部件命名</legend>
			<table border="0" width="98%" class="edit_table" align="center" style="table-layout:fixed;">
				<tr width="30">
					<td align="center" style="background-color:#E4F0FC;">产品简号：</td>
					<td colspan="3">
						<select id="simplify_code" name="mcm.simplifyCode">
							<option value="MCM-R">MCM接收部件</option>
							<option value="MCM-T">MCM发射部件</option>
							<option value="MCM-TR">T/R部件</option>
							<option value="MCM-FS">MCM频率综合部件</option>
						</select></td>
				</tr>
				<tr id="port">
					<td align="center" style="background-color:#E4F0FC;">输入接口方式：</td>
					<td>
						<select name="mcm.portInput">
							<option value="波导">波导</option>
							<option value="同轴">同轴</option>
							<option value="微带">微带</option>
						</select>
					</td>
					<td align="center" style="background-color:#E4F0FC;">输出接口方式：</td>
					<td>
						<select name="mcm.portOutput">
							<option value="波导">波导</option>
							<option value="同轴">同轴</option>
							<option value="微带">微带</option>
						</select>
					</td>
				</tr>
				<tr >
					<td align="center" style="background-color:#E4F0FC;">输入频段：</td>
					<td>
						<select id="frequency_input" name="mcm.frequencyInput">
							<option value="<200MHz"><200MHz</option>
							<option value="200MHz-1000MHz (UHF)">200MHz-1000MHz (UHF)</option>
							<option value="1000MHz-2000MHz (L)">1000MHz-2000MHz (L)</option>
							<option value="2000MHz-4000MHz (S)">2000MHz-4000MHz (S)</option>
							<option value="4000MHz-8000MHz (C)">4000MHz-8000MHz (C)</option>
							<option value="8000MHz-12400MHz (X)">8000MHz-12400MHz (X)</option>
							<option value="12400MHz-18000MHz (Ku)">12400MHz-18000MHz (Ku)</option>
							<option value="18000MHz-40000MHz (Ka)">18000MHz-40000MHz (Ka)</option>
							<option value="40000MHz-60000MHz (EHF)">40000MHz-60000MHz (EHF)</option>
							<option value=">60000MHZ (EHF以上)">>60000MHZ (EHF以上)</option>
						</select>
					</td>
					<td align="center" style="background-color:#E4F0FC;">输出频段：</td>
					<td>
						<select id="frequency_output" name="mcm.frequencyOutput">
							<option value="<200MHz"><200MHz</option>
							<option value="200MHz-1000MHz (UHF)">200MHz-1000MHz (UHF)</option>
							<option value="1000MHz-2000MHz (L)">1000MHz-2000MHz (L)</option>
							<option value="2000MHz-4000MHz (S)">2000MHz-4000MHz (S)</option>
							<option value="4000MHz-8000MHz (C)">4000MHz-8000MHz (C)</option>
							<option value="8000MHz-12400MHz (X)">8000MHz-12400MHz (X)</option>
							<option value="12400MHz-18000MHz (Ku)">12400MHz-18000MHz (Ku)</option>
							<option value="18000MHz-40000MHz (Ka)">18000MHz-40000MHz (Ka)</option>
							<option value="40000MHz-60000MHz (EHF)">40000MHz-60000MHz (EHF)</option>
							<option value=">60000MHZ (EHF以上)">>60000MHZ (EHF以上)</option>
						</select>
					</td>
				</tr>
				<tr id="work_mode">
					<td align="center" style="background-color:#E4F0FC;">工作模式：</td>
					<td colspan="3">
						<select name="mcm.workMode">
							<option value="低噪放">低噪放</option>
							<option value="低噪放+一次变频">低噪放+一次变频</option>
							<option value="一次变频">一次变频</option>
							<option value="低噪放+二次变频">低噪放+二次变频</option>
							<option value="二次变频">二次变频</option>
							<option value="调制">调制</option>
						</select>
					</td>
				</tr>
				<tr id="control_mode">
					<td align="center" style="background-color:#E4F0FC;">控制模式：</td>
					<td colspan="3">
						<select name="mcm.controlMode">
							<option value="固定增益">固定增益</option>
							<option value="增益步进/可调">增益步进/可调</option>
							<option value="移相">移相</option>
							<option value="移相衰减">移相衰减</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;">是否仅适用于地面应用：</td>
					<td colspan="3">
						<input type="radio" name="mcm.surfaceIdentify" value="-D" >是
						<input type="radio" name="mcm.surfaceIdentify" value="" checked>否
					</td>
				</tr>
			</table>
			<div id="similarNumber"></div>
			<div id="mcmPort"></div>
			<div id="featureCode"></div>
			<div>
				<div style="font-size:17px;float:left;margin:5px 10px 20px 20px;">可选择的产品命名</div>
				<div id="code" style="float:left;margin:-5px 0 0 0;"></div>
			</div>
	</fieldset>
	<br/>
	<fieldset>
		<legend>基本信息</legend>
		<table border="0" width="98%" class="edit_table" align="center" style="table-layout:fixed;">
			<tr>
				<td align="center" style="background-color:#E4F0FC;">产品名称</td>
				<td colspan="3">
					<input type="text" name="mcm.name" class="required">
				</td>
			</tr>
			<tr>
				<td align="center" style="background-color:#E4F0FC;">设计师</td>
				<td colspan="3">
					<input type="hidden" name="mcm.singleHead.id" class="required">
					<input type="text" name="mcm.singleHead.name" class="required" readonly="readonly" onclick="$(this).next().click()" >
					<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" style="background-color:#E4F0FC;">备注</td>
				<td colspan="3">
					<textarea name="mcm.note" rows="2" style="width:90%;"/>
				</td>
			</tr>
		</table>
	</fieldset>
	
	</div>
	
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: right;"><div class="buttonActive"><div class="buttonContent"><button id="sub" name="confirm" type="submit">入库</button></div></div></li>
		</ul>
	</div>
   </form>
</div>


