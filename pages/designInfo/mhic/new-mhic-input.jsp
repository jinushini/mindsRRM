<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("[name='mhic.simplifyName']").change(function(){
		var $simplifyCode = jn("[name='mhic.simplifyCode']");
		switch(jn("[name='mhic.simplifyName']").val()){
			case '通用放大器':
				$simplifyCode.val("M-FDQ");
				break;
			case '低噪声放大器':
				$simplifyCode.val("M-DZF");
				break;
			case '功率放大器':
				$simplifyCode.val("M-GF");
				break;
			case '增益可调放大器':
				$simplifyCode.val("M-ZTF");
				break;
			case '移相衰减器':
				$simplifyCode.val("M-YXSJ");
				break;
			case '倍频器':
				$simplifyCode.val("M-BPQ");
				break;
			case '混频器':
				$simplifyCode.val("M-HPQ");
				break;
			case '自动增益控制放大器':
				$simplifyCode.val("M-AGC");
				break;
			case '线性化器':
				$simplifyCode.val("M-XXHQ");
				break;
			case '开关':
				$simplifyCode.val("M-KG");
				break;
			case '调制器':
				$simplifyCode.val("M-TZQ");
				break;
			case '噪声源':
				$simplifyCode.val("M-ZSY");
				break;
			case '功分合成器':
				$simplifyCode.val("M-GFHC");
				break;
			default:
				alert("error");	
		}
	})
	jn("[type='submit']").click(function(){
		var code = jn("[name='mhic.simplifyCode']").val() + jn("[name='mhic.code']").val();
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			async : true,
			url : "../designInfo/Mhic_validcode_mhic.action", //发送请求的地址
			data : {
				data : code
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var mhicList = data.list;
				if(mhicList.length != 0){
					alertMsg.error("产品代号已存在！");
				}else{
					jn("#searchFrm").submit();
				}
			}
		});
	})
	
</script>
<div class="pageContent">
  <form id="searchFrm" action="../designInfo/Mhic_saveNewMhic_mhic.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
	<br/>
		<fieldset>
			<legend>MHIC微波部件命名</legend>
				<table width="98%" class="edit_table" style="table-layout:fixed;margin:5px auto;">
					<tr width="30">
						<td colspan="1" align="center" style="background-color:#E4F0FC;width:20%;">产品简称：</td>
						<td colspan="10">
							<select name="mhic.simplifyName">
								<option value="通用放大器">通用放大器</option>
								<option value="低噪声放大器">低噪声放大器</option>
								<option value="功率放大器">功率放大器</option>
								<option value="增益可调放大器">增益可调放大器</option>
								<option value="移相衰减器">移相衰减器</option>
								<option value="倍频器">倍频器</option>
								<option value="混频器">混频器</option>
								<option value="自动增益控制放大器">自动增益控制放大器</option>
								<option value="线性化器">线性化器</option>
								<option value="开关">开关</option>
								<option value="调制器">调制器</option>
								<option value="噪声源">噪声源</option>
								<option value="功分合成器">功分合成器</option>
							</select>
						</td>
					</tr>
					<tr id="port">
						<td align="center" style="background-color:#E4F0FC;">产品代号：</td>
	 					<td colspan="1" style="padding-right:0px;border-right:hidden;" >
							<input type="text" name="mhic.simplifyCode" value="M-FDQ" style="float:right;text-align:right;font-size:16px;border: none;" readonly="readonly" >
						</td>
						<td colspan="3" style="padding-left:0px;">
							<input type="text" name="mhic.code" class="required" style="float:left;text-align:left;font-size:16px;">
						</td>
						<td colspan="3" align="center" style="background-color:#E4F0FC;">产品名称：</td>
						<td colspan="3" ><input type="text" name="mhic.name" class="required" style="width:90%;"></td>
					</tr>
				</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>基本信息</legend>
			<table width="98%" class="edit_table" style="table-layout:fixed;margin:5px auto;">
				<tr>
					<td align="center" style="background-color:#E4F0FC;width:20%;">设计师</td>
					<td >
						<input type="hidden" name="mhic.singleHead.id" class="required">
						<input type="text" name="mhic.singleHead.name" class="required" readonly="readonly" onclick="$(this).next().click()" >
						<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>
					</td>
				</tr>
				<tr>
					<td align="center" style="background-color:#E4F0FC;">备注</td>
					<td>
						<textarea name="mhic.note" rows="2" style="width:90%;"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: right;"><div class="buttonActive"><div class="buttonContent"><button id="sub" name="confirm" type="submit" onclick="return false;">入库</button></div></div></li>
		</ul>
	</div>
   </form>
</div>


