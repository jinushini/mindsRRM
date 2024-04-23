<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	/* jn(function(){
		build();
	}) */
	jn("#simplifyName").change(function(){
		switch(jn("#simplifyName").val()){
			case '输入多工器':
				jn("#simplifyCode").val("SRDG");
				break;
			case '输出多工器':
				jn("#simplifyCode").val("SCDG");
				break;
			case '输入滤波器':
				jn("#simplifyCode").val("SRLB");
				break;
			case '输出滤波器':
				jn("#simplifyCode").val("SCLB");
				break;
			case '测试耦合器':
				jn("#simplifyCode").val("CSOH");
				break;
			case '混合接头':
				jn("#simplifyCode").val("HHJT");
				break;
			case '功分器':
				jn("#simplifyCode").val("GFQ");
				break;
			case '微波开关':
				jn("#simplifyCode").val("WBKG");
				break;
			default:
				alert("error");	
		}
	});
	
	/* jn(".edit_table").on("change","select,[type=radio]",function(){
		build();
	})
	
	function build(){
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/WuyProd_buildWuyProdCode_wuyProd.action", //发送请求的地址
			data : jn("#searchFrm").serialize(), //发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				
				var wuyProdList = data.list;
				if(wuyProdList == null || wuyProdList.legnth == 0){
					alertMsg.error("命名失败！");
				}else{
					jn("[name='wuyProd.simplifyCode']").val(wuyProdList[0].simplifyCode);
					jn("[name='wuyProd.featureCode']").val(wuyProdList[0].featureCode);
					jn("[name='wuyProd.similarNumber']").val(wuyProdList[0].similarNumber);
					var codeStr = "<option value='"+ wuyProdList[0].code +"' class='0' selected>"+ wuyProdList[0].code +"</option>";
					for(var i=1;i<wuyProdList.length;i++){
						codeStr = codeStr + "<option value='"+ wuyProdList[i].code +"' class='"+ i +"'>"+ wuyProdList[i].code +"</option>";
					}
					jn("#select").html("<select id='wuyProdCode' style='color:red;font-size:18px;font-weight:bold;height:30px;width:150px;'>"+ codeStr +"</select>");
					jn("#wuyProdCode").change(function(){
						var classVal =  jn("#wuyProdCode").find("option:selected").attr("class");
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
		if(jn("#wuyProdCode").val()==""){
			alertMsg.error("产品信息选择有误！");
			return false;
		}
		if(jn("#addInfo").val() == ""){
			alertMsg.error("缺失型号信息或开关信息！");
			return false;
		}
		jn("[name='wuyProd.code']").val(jn("#wuyProdCode").val() + jn("#addInfo").val());
		if(jn("[name='wuyProd.code']").val()==""){
			alertMsg.error("合成产品代号时出错！");
			return false;
		}
	}); */
	
</script>
<div class="pageContent">
  <form id="searchFrm" action="../designInfo/WuyProd_saveNewWuyProd_wuyProd.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>无源产品命名</legend>
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
								<option value="微波开关">微波开关</option>
							</select>
						</td>
						<td align="center" style="background-color:#E4F0FC;width:20%;">产品简号</td>
						<td>
							<input type="text" name="wuyProd.simplifyCode" class="required" id="simplifyCode" readonly="readonly" >
						</td>
					</tr>
					<tr id="freqWork">
						<td align="center" style="background-color:#E4F0FC;">工作频段</td>
						<td>
							<input type="text" name="wuyProd.freqWork" class="required">
						</td>
						<td align="center" style="background-color:#E4F0FC;">工作频段对应标识</td>
						<td>
							<input type="text" name="wuyProd.freqWorkCode" class="required">
						</td>
					</tr>
					<tr id="structureForm">
						<td align="center" style="background-color:#E4F0FC;">结构形式</td>
						<td>
							<input type="text" name="wuyProd.structureForm" class="required">
						</td>
						<td align="center" style="background-color:#E4F0FC;">结构形式对应标识</td>
						<td>
							<input type="text" name="wuyProd.structureFormCode" class="required">
						</td>
					</tr>
					<tr id="structureForm">
						<td align="center" style="background-color:#E4F0FC;">可选择的产品命名</td>
						<td colspan="3">
							<div id="select" style="width:10px;"></div>
							<input type="text" class="required" id="addInfo" placeholder="型号/开关信息" style="text-align:center;width:100px;height:24px;margin-left:10px;" />
						</td>
					</tr>
				</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>其他信息</legend>
			<table width="98%" class="edit_table" style="margin:5px auto;">
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">产品名称</td>
					<td>
						<input type="text" name="wuyProd.name" class="required">
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


