<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		build();
	})
	
	jn("#simplifyName").change(function(){
		switch(jn("#simplifyName").val()){
			case '输入多工器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='波导'>波导</option><option value='介质'>介质</option><option value='同轴'>同轴</option></select></td>");
				break;
			case '输出多工器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='介质'>介质</option><option value='温度补偿'>温度补偿</option></select></td>");
				break;
			case '输入滤波器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='介质'>介质</option><option value='超导'>超导</option><option value='微带'>微带</option></select></td>");
				break;
			case '输出滤波器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='波导'>波导</option><option value='同轴'>同轴</option><option value='介质'>介质</option></select></td>");
				break;
			case '测试耦合器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='输入十字波导'>输入十字波导</option><option value='输入同轴传输线'>输入同轴传输线</option><option value='输入耦合'>输入耦合</option><option value='输出十字波导'>输出十字波导</option><option value='输出同轴传输线'>输出同轴传输线</option><option value='输出耦合'>输出耦合</option></select></td>");
				break;
			case '混合接头':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='同轴'>同轴</option><option value='波导'>波导</option><option value='微带'>微带</option></select></td>");
				break;
			case '功分器':
				jn("#structureForm").empty().append("<td align='center' style='background-color:#E4F0FC;'>结构形式</td><td><select name='wuyProd.structureForm'><option value='同轴'>同轴</option><option value='波导'>波导</option></select></td>");
				break;
			default:
				alert("error");	
		}
	});
	
	jn(".edit_table").on("change","[name='wuyProd.simplifyName'],[name='wuyProd.freqWork'],[name='wuyProd.structureForm']",function(){
		build();
	})
	
	function build(){
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/WuyProd_buildWuySelProdCode_wuyProd.action", //发送请求的地址
			data : jn("#searchFrm").serialize(), //发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var wuyProdList = data;
				if(wuyProdList == null || wuyProdList.legnth == 0){
					alertMsg.error("命名失败！");
				}else{
					jn("[name='wuyProd.simplifyCode']").val(wuyProdList[0].simplifyCode);
					jn("[name='wuyProd.featureCode']").val(wuyProdList[0].featureCode);
					jn("[name='wuyProd.similarNumber']").val(wuyProdList[0].similarNumber);
					var selProdCodeStr = "";
					for(var i=0;i<wuyProdList.length;i++){
						selProdCodeStr = selProdCodeStr + "<option value='"+ wuyProdList[i].selProdCode +"' class='"+ i +"'>"+ wuyProdList[i].selProdCode +"</option>";
					}
					jn("[name='wuyProd.selProdCode']").html(selProdCodeStr);
					jn("[name='wuyProd.selProdCode']").change(function(){
						var classVal =  jn("[name='wuyProd.selProdCode']").find("option:selected").attr("class");
						jn("[name='wuyProd.simplifyCode']").val(wuyProdList[classVal].simplifyCode);
						jn("[name='wuyProd.featureCode']").val(wuyProdList[classVal].featureCode);
						jn("[name='wuyProd.similarNumber']").val(wuyProdList[classVal].similarNumber);
					})
				}
			}
		});
	}
	//提交按钮
	jn("[type=submit]").click(function() {
		if(jn("[name='wuyProd.selProdCode']").val()==""){
			alertMsg.error("图纸代号不能为空！");
			return false;
		}
	});
	
</script>
<div class="pageContent">
  <form id="searchFrm" action="../designInfo/WuyProd_saveNewWuyProd_wuyProd.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>无源产品</legend>
				<table width="98%" class="edit_table" style="margin:5px auto;">
					<tr>
						<td align="center" style="background-color:#E4F0FC;width:20%;">产品简称</td>
						<td>
							<select id="simplifyName" name="wuyProd.simplifyName">
								<option value="输入多工器">输入多工器</option>
								<option value="输出多工器">输出多工器</option>
								<option value="输入滤波器">输入滤波器</option>
								<option value="输出滤波器">输出滤波器</option>
								<option value="测试耦合器">测试耦合器</option>
								<option value="混合接头">混合接头</option>
								<option value="功分器">功分器</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="center" style="background-color:#E4F0FC;">工作频段</td>
						<td>
							<select name="wuyProd.freqWork">
								<option value="VHF频段（300MHz以下）">VHF频段（300MHz以下）</option>
								<option value="UHF频段（300-1000MHz）">UHF频段（300-1000MHz）</option>
								<option value="L频段">L频段</option>
								<option value="S频段">S频段</option>
								<option value="C频段">C频段</option>
								<option value="X频段">X频段</option>
								<option value="Ku频段">Ku频段</option>
								<option value="Ka频段">Ka频段</option>
								<option value="EHF频段（30-300GHz）">EHF频段（30-300GHz）</option>
								<option value="EHF频段以上">EHF频段以上</option>
							</select>
						</td>
					</tr>
					<tr id="structureForm">
						<td align="center" style="background-color:#E4F0FC;">结构形式</td>
						<td>
							<select name="wuyProd.structureForm">
								<option value="波导">波导</option>
								<option value="介质">介质</option>
								<option value="同轴">同轴</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="center" style="background-color:#E4F0FC;">可选择的图纸代号</td>
						<td>
							<select name='wuyProd.selProdCode' style='color:red;font-size:18px;font-weight:bold;height:30px;width:150px;'></select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="wuyProd.simplifyCode" />
				<input type="hidden" name="wuyProd.featureCode" />
				<input type="hidden" name="wuyProd.similarNumber" />
		</fieldset>
		<br/>
		<fieldset>
			<legend>其他信息</legend>
			<table width="98%" class="edit_table" style="margin:5px auto;">
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">产品代号/单机代号</td>
					<td>
						<input type="text" name="wuyProd.code">
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">产品名称</td>
					<td>
						<input type="text" name="wuyProd.name">
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">型号代号</td>
					<td>
						<input type="text" name="wuyProd.libCode">
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">分系统名称</td>
					<td>
						<input type="text" name="wuyProd.subSystem">
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;">设计师</td>
					<td>
						<input type="hidden" name="wuyProd.singleHead.id" class="required">
						<input type="text" name="wuyProd.singleHead.name" class="required" readonly="readonly" onclick="$(this).next().click()" >
						<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;">备注</td>
					<td>
						<textarea name="wuyProd.note" rows="2" style="width:90%;"/>
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


