<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	jn(function(){
		for(var i=0;i<jn(".tbody tr").length;i++){
			var $thisTr = jn(".tbody tr").eq(i);
			var arriveTrack = $thisTr.find(".arriveTrack input").val();
			var arriveTrackFinal = arriveTrack.split("㊣").pop().slice(0,-19);
			var arriveTrackWhole = "";
			var arr = arriveTrack.split('㊣');
			if(arr.length==1){
				arriveTrackWhole = arr[0];
			}else{
				for(var k=0;k<arr.length;k++){
					if(k==0){
						arriveTrackWhole = "<span style='color:red;font-size:15px;margin-left:-7px;'>原：</span>"+arr[k]+"<br/><br/>";
					}else if(k==arr.length-1){
						arriveTrackWhole = arriveTrackWhole+"<span style='color:#3DAB0B;font-size:15px;'>改：</span>"+arr[k];
					}else{
						arriveTrackWhole = arriveTrackWhole+"<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
					}
				}
			}
			$thisTr.find(".arriveTrack input").val(arriveTrackFinal);
			$thisTr.find(".arriveTrack .final").empty().append(arriveTrackFinal);
			$thisTr.find(".arriveTrack .whole").empty().append(arriveTrackWhole);
		}
		jn(".edit").hide();
		jn(".whole").hide();
	})
	
	jn("#whole").click(function(){
		jn(".whole").show();
		jn(".final").hide();
	})
	
	jn("#final").click(function(){
		jn(".final").show();
		jn(".whole").hide();
	})
	
	jn("#edit").click(function(){
		jn(".edit").show();
		jn(".look").hide();
	})
	
	jn("#look").click(function(){
		jn(".look").show();
		jn(".edit").hide();
		jn(".whole").hide();
	})
	
	//提交按钮
	jn("[type=submit]").click(function() {
		//给新增的“输入行”数据加name
		var $Trs = jn(".tbody tr");
		addNames($Trs);
	});
	
	function addNames($Trs){
		for(var i=0; i<$Trs.length; i++){
			var $thisTr = $Trs.eq(i);
			var $input = $thisTr.find("input");
			//input加行号
			for(var j=0;j<$input.length;j++){
				if($input.eq(j).attr("name")!=null){
					$input.eq(j).attr("name", $input.eq(j).attr("name").replace("#index", i));
				}
			}
		}
	}
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li class="look"><a class="icon" id="edit"><span>编辑模式</span></a></li>
			<li class="edit"><a class="icon" id="look"><span>查看模式</span></a></li>
		</ul>
	</div>
	<form method="post" action='../microwave/product_ProductDeclare_trackCustomYuanqjDeclare_yuanqj-custom-declare-track-input.action' class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" value="<s:property value="data"/>" name="data" />
		<div class="pageFormContent" layoutH="80">
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;" >
				<thead>
					<tr>
						<th width="100">型号名称</th>
						<th width="100">型号代号</th>
						<th width="100">整机名称</th>
						<th width="100">整机代号</th>
						<th width="100">模块名称</th>
						<th width="100">模块代号</th>
						<th width="100">元器件名称</th>
						<th width="120">元器件型号规格</th>
						<th width="100">申报人</th>
						<th width="100">技术协议</th>
						<th width="100">元器件等级</th>
						<th width="100">申报数量</th>
						<th width="100">生产厂家</th>
						<th width="100">物资经理</th>
						<th width="120">物料编码</th>
						<th width="120">浪潮申报是否完成</th>
						<th width="100">厂家联系方式</th>
						<th width="120">订单日期</th>
						<th width="120">订单编号</th>
						<th width="220">到货状态跟踪<span id="whole" class="look final"><a href="javascript:void(0);" style="font-size:15px;color:green;text-decoration:none;"> [≡] </a></span><span id="final" class="look whole"><a href="javascript:void(0);" style="font-size:15px;color:red;text-decoration:none;"> [−] </a></span></th>
						<th width="120">入库日期</th>
						<!-- <th width="40">操作</th> -->
					</tr>
				</thead>
				<tbody class="tbody" style="align:center">
					<s:iterator value="list" status="st">
						<tr target="id" rel="<s:property value="id"/>">
							<td style="display:none;"><input name="productDeclareList[#index].id" value="<s:property value='id'/>" /></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.productLib.modelName"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.productLib.modelCode"/></td>
							<s:if test='productOrder.parentProductOrder.parentProductOrder != null'>
								<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.parentProductOrder.name"/></td>
								<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.parentProductOrder.code"/></td>
								<s:if test='productOrder.parentProductOrder != null'>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.code"/></td>
								</s:if>
								<s:else>
									<td align="center">/</td>
									<td align="center">/</td>
								</s:else>
							</s:if>
							<s:else>
								<s:if test="productOrder.parentProductOrder.subType == '整机'">
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.code"/></td>
									<td align="center">/</td>
									<td align="center">/</td>
								</s:if>
								<s:if test="productOrder.parentProductOrder.subType == '模块'">
									<td align="center">/</td>
									<td align="center">/</td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.parentProductOrder.code"/></td>
								</s:if>
							</s:else>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.name"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.code"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="declareUser.name"/></td>
							<td style="text-align: left;">
								<s:iterator value="productDeclareFileSet" status="st">
									<a href='<s:property value="filePath"/>' style="color:green"><s:property value="fileName"/></a></br>
								</s:iterator>
							</td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.componentLevel"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productOrder.demandNum"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="manufacturer"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="materialManager.name"/></td>
							<td align="center">
								<div class="look" style="padding:5px;font-size:15px;"><s:property value='materialCode'/></div>
								<input type="text" class="edit" style="width:85%;text-align:center;margin:4px 0 4px 4px;padding:5px;" name="productDeclareList[#index].materialCode" value="<s:property value="materialCode"/>">
							</td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="LangCIsFinish"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="factoryLink"/></td>
							<td align="center">
								<div class="look" style="padding:5px;font-size:15px;"><s:date name="orderDate" format="yyyy-MM-dd" /></div>
								<input type="text" class="edit" style="width:85%;text-align:center;margin:4px 0 4px 4px;padding:5px;" name="productDeclareList[#index].orderDate" value='<s:date name="orderDate" format="yyyy-MM-dd" />' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true })" readonly="readonly">
							</td>
							<td align="center">
								<div class="look" style="padding:5px;font-size:15px;"><s:property value='orderNum'/></div>
								<input type="text" class="edit" style="width:85%;text-align:center;margin:4px 0 4px 4px;padding:5px;" name="productDeclareList[#index].orderNum" value="<s:property value="orderNum"/>">
							</td>
							<td align="center" class="arriveTrack">
								<div class="look final" style="padding:5px;font-size:15px;"></div>
								<div class="look whole" style="padding:5px;font-size:15px;"></div>
								<input type="text" class="edit" style="width:90%;text-align:center;margin:4px 0 4px 4px;padding:5px;" name="productDeclareList[#index].arriveTrack" value="<s:property value='arriveTrack'/>">
							</td>
							<td align="center">
								<div class="look" style="padding:5px;font-size:15px;"><s:date name="warehousingDate" format="yyyy-MM-dd" /></div>
								<input type="text" class="edit" style="width:85%;text-align:center;margin:4px 0 4px 4px;padding:5px;" name="productDeclareList[#index].warehousingDate" value='<s:date name="warehousingDate" format="yyyy-MM-dd" />' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true })" readonly="readonly">
							</td>
						</tr>
					</s:iterator>
				 </tbody>
			</table>
		</div>
		<div class="formBar" style="text-align center;">
			<ul style="">
				<li class="edit" style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">保存</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>			
		</div>
	</form>
</div>
