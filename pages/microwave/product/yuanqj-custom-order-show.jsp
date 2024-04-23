<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jd(function(){
		var arriveTrack = jd("#arriveTrack .whole").text();
		var arriveTrackFinal = arriveTrack.split("㊣").pop().slice(0,-19);
		var arriveTrackWhole = "";
		var arr = arriveTrack.split('㊣');
		if(arr.length==1){
			arriveTrackWhole = arr[0];
		}else{
			for(var k=0;k<arr.length;k++){
				if(k==0){
					arriveTrackWhole = "<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
				}else if(k==arr.length-1){
					arriveTrackWhole = arriveTrackWhole+"<span style='color:#3DAB0B;font-size:15px;'>改：</span>"+arr[k];
				}else{
					arriveTrackWhole = arriveTrackWhole+"<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
				}
			}
		}
		jd("#arriveTrack .final").empty().append(arriveTrackFinal);
		jd("#arriveTrack .whole").empty().append(arriveTrackWhole);
		jd(".whole").hide();
	})

	jd("#whole").click(function(){
		jd(".whole").show();
		jd(".final").hide();
	})
	
	jd("#final").click(function(){
		jd(".final").show();
		jd(".whole").hide();
	})
	
	//全屏查看
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})

</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
			<legend>元器件详情</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center">型号名称：</td>
					<td >
						<s:property value="productOrder.productLib.modelName"/>
					</td>
					<td align="center">型号代号：</td>
					<td >
						<s:property value="productOrder.productLib.modelCode"/>
					</td>
				</tr>
				<s:if test='productOrder.parentProductOrder.parentProductOrder != null'>
					<tr>
						<td align="center">整机名称：</td>
						<td ><s:property value="productOrder.parentProductOrder.parentProductOrder.name"/></td>
						<td align="center">整机代号：</td>
						<td ><s:property value="productOrder.parentProductOrder.parentProductOrder.code"/></td>
					</tr>
					<tr>
						<s:if test='productOrder.parentProductOrder != null'>
								<td align="center">模块名称：</td>
								<td><s:property value="productOrder.parentProductOrder.name"/></td>
								<td align="center">模块代号：</td>
								<td><s:property value="productOrder.parentProductOrder.code"/></td>
						</s:if>
						<s:else>
								<td align="center">模块名称：</td>
								<td>/</td>
								<td align="center">模块代号：</td>
								<td>/</td>
						</s:else>
					</tr>
				</s:if>
				<s:else>
					<s:if test="productOrder.parentProductOrder.subType == '整机'">
						<tr>
							<td align="center">整机名称：</td>
							<td><s:property value="productOrder.parentProductOrder.name"/></td>
							<td align="center">整机代号：</td>
							<td><s:property value="productOrder.parentProductOrder.code"/></td>
						</tr>
						<tr>
							<td align="center">模块名称：</td>
							<td>/</td>
							<td align="center">模块代号：</td>
							<td>/</td>
						</tr>
					</s:if>
					<s:if test="productOrder.parentProductOrder.subType == '模块'">
						<tr>
							<td align="center">整机名称：</td>
							<td>/</td>
							<td align="center">整机代号：</td>
							<td>/</td>
						</tr>
						<tr>
							<td align="center">模块名称：</td>
							<td><s:property value="productOrder.parentProductOrder.name"/></td>
							<td align="center">模块代号：</td>
							<td><s:property value="productOrder.parentProductOrder.code"/></td>
						</tr>
					</s:if>
				</s:else>
				<tr>
					<td width="20%" align="center">元器件名称：</td>
					<td width="30%"><s:property value="productOrder.name"/></td>
					<td align="center" width="20%">元器件型号规格：</td>
					<td><s:property value="productOrder.code" /></td>
				</tr>
				<tr>
					<td align="center">技术协议：</td>
					<td style="text-align: left;">
						<s:iterator value="productDeclare.productDeclareFileSet" status="st">
							<a href='<s:property value="filePath"/>' style="color:green"><s:property value="fileName"/></a></br>
						</s:iterator>
					</td>
					<td align="center">元器件申报等级：</td>
					<td >
						<s:property value="productOrder.componentLevel"/>
					</td>
				</tr>
				<tr>
					<td align="center">申报数量：</td>
					<td >
						<s:property value="productOrder.demandNum"/>
					</td>
					<td align="center">生产厂家：</td>
					<td >
						<s:property value="productDeclare.manufacturer"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>申报详情</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td width="20%" align="center">申报人：</td>
					<td width="30%"><s:property value="productDeclare.declareUser.name"/></td>
					<td align="center" width="20%">申报时间：</td>
					<td>
						<s:date name="productDeclare.createDate" format="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<td align="center">物资经理：</td>
					<td><s:property value="productDeclare.materialManager.name"/></td>
					<td align="center" width="20%">物料编码：</td>
					<td width="30%"><s:property value="productDeclare.materialCode"/></td>	
				</tr>
				<tr>
					<td align="center">浪潮申报是否完成：</td>
					<td><s:property value="productDeclare.LangCIsFinish"/></td>
					<td align="center" width="20%">厂家联系方式：</td>
					<td width="30%"><s:property value="productDeclare.factoryLink"/></td>	
				</tr>
				<tr>
					<td align="center" width="20%">订单日期：</td>
					<td width="30%"><s:date name="productDeclare.orderDate" format="yyyy-MM-dd" /></td>	
					<td align="center">订单编号：</td>
					<td><s:property value="productDeclare.orderNum"/></td>
				</tr>
				<tr>
					<td align="center" width="20%">到货状态跟踪：<span id="whole" class="final"><a href="javascript:void(0);" style="font-size:15px;color:green;text-decoration:none;"> [≡] </a></span><span id="final" class="whole"><a href="javascript:void(0);" style="font-size:15px;color:red;text-decoration:none;"> [−] </a></span></td>
					<td width="30%" id="arriveTrack">
						<div class="final" style="padding:5px;font-size:15px;"></div>
						<div class="whole" style="padding:5px;font-size:15px;"><s:property value='productDeclare.arriveTrack'/></div>
					</td>	
					<td align="center">入库日期：</td>
					<td><s:date name="productDeclare.warehousingDate" format="yyyy-MM-dd" /></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li><a class="button" id="fullScrBtn"><span>全屏查看</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
</div>