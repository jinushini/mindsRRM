<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		//合并单元格
		var z = 0;
		for(i=0;i<jn(".tbody tr").length;i++){
			var $referCol = jn(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jn(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
		}
		for(var i=0;i<jn(".tbody").length;i++){
			var $thisBody = jn(".tbody").eq(i);
			if($thisBody.find("td").length==1){
				$thisBody.find("td").attr("colspan",2);
				$thisBody.find("td img").css("width", "30%");
			}
		}
	})
</script>
<div class="pageContent">
  	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend style="font-size:16px;">无源产品基本信息</legend>
			<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">产品代号</td>
					<td><s:property value="wuyProd.code"/></td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">产品名称</td>
					<td><s:property value='wuyProd.name'/></td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">主管设计师</td>
					<td>
						<s:property value="wuyProd.singleHead.name"/>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">入库时间</td>
					<td>
						<s:date name="wuyProd.createDate" format="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">接口形式</td>
					<td>
						<s:property value="wuyProd.interfaceForm"/>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">产品简介</td>
					<td><s:property value='wuyProd.introduction'/></td>
				</tr>
			</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">原理框图</legend>
		<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="30%" style="font-size:17px;" colspan="2">原理框图</th>
				</tr>
			</thead>
			<tbody class="tbody">
					<s:iterator value="wuyProd.designFileSet" status="st">
						<s:if test="type=='原理框图'">
							<s:if test="num%2==1 ">
								<tr align="center">
							</s:if>
								<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
									<img src="<s:property value="filePathVisit"/>" style="width: 60%;"/>
									<br/><br/>
									<span><s:property value="explain"/></span>
								</td>
							<s:if test="num%2==0">      
	            				</tr>          
	        				</s:if>
						</s:if>
					</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<%-- <br/>
	<fieldset>
		<legend style="font-size:16px;">性能特点<span style="color:red;font-size:14px;">（前10项被用于生成产品手册）</span></legend>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="90%" style="font-size:17px;">特点</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<s:iterator value="wuyProd.performFeatureSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td><s:property value="num"/></td>
						<td><s:property value='feature' /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">主要电参数</legend>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<tr>
				<td align="center" width="20%" style="background-color:#E4F0FC;font-weight: bold;">电参数条件</td>
				<td><s:property value='wuyProd.eleParamCondition' /></td>
			</tr>
		</table>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead align="center" style="background-color:#E4F0FC;">
				<tr>
					<th width="5%" rowspan="2" style="font-size:17px;">序号</th>
					<th width="30%" rowspan="2" style="font-size:17px;">技术指标</th>
					<th width="10%" rowspan="2" style="font-size:17px;">符号</th>
					<th width="40%" colspan="3" style="font-size:17px;">测试值</th>
					<th width="10%" rowspan="2" style="font-size:17px;">单位</th>
				</tr>
				<tr>
					<th width="10%" style="font-size:17px;">最小</th>
					<th width="10%" style="font-size:17px;">典型</th>
					<th width="10%" style="font-size:17px;">最大</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<s:iterator value="wuyProd.eleParamSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td><s:property value='num' /></td>
						<td class="item"><s:property value='techItem' /></td>
						<td><s:property value='sign' /></td>
						<td><s:property value='testvalueMin' /></td>
						<td><s:property value='testvalueTypical' /></td>
						<td><s:property value='testvalueMax' /></td>
						<td><s:property value='unit' /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">极限参数</legend>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="50%" style="font-size:17px;">参数</th>
					<th width="40%" style="font-size:17px;">数值</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<s:iterator value="wuyProd.limitParamSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td><s:property value='num' /></td>
						<td><s:property value='param' /></td>
						<td><s:property value='value' /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset> --%>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">性能指标</legend>
		<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="30%" style="font-size:17px;" colspan="2">性能指标</th>
				</tr>
			</thead>
			<tbody class="tbody">
					<s:iterator value="wuyProd.designFileSet" status="st">
						<s:if test="type=='性能指标'">
							<s:if test="num%2==1 ">
								<tr align="center">
							</s:if>
								<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
									<img src="<s:property value="filePathVisit"/>" style="width: 60%;"/>
									<br/><br/>
									<span><s:property value="explain"/></span>
								</td>
							<s:if test="num%2==0">      
	            				</tr>          
	        				</s:if>
						</s:if>
					</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">仿真模型</legend>
		<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="30%" style="font-size:17px;" colspan="2">仿真模型</th>
				</tr>
			</thead>
			<tbody class="tbody">
					<s:iterator value="wuyProd.designFileSet" status="st">
						<s:if test="type=='仿真模型'">
							<s:if test="num%2==1 ">
								<tr align="center">
							</s:if>
								<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
									<img src="<s:property value="filePathVisit"/>" style="width: 60%;"/>
									<br/><br/>
									<span><s:property value="explain"/></span>
								</td>
							<s:if test="num%2==0">      
	            				</tr>          
	        				</s:if>
						</s:if>
					</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">性能曲线</legend>
		<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="30%" style="font-size:17px;" colspan="2">性能曲线</th>
				</tr>
			</thead>
			<tbody class="tbody">
					<s:iterator value="wuyProd.designFileSet" status="st">
						<s:if test="type=='性能曲线'">
							<s:if test="num%2==1 ">
								<tr align="center">
							</s:if>
								<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
									<img src="<s:property value="filePathVisit"/>" style="width: 60%;"/>
									<br/><br/>
									<span><s:property value="explain"/></span>
								</td>
							<s:if test="num%2==0">      
	            				</tr>          
	        				</s:if>
						</s:if>
					</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">外形图片</legend>
		<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="30%" style="font-size:17px;" colspan="2">外形图片</th>
				</tr>
			</thead>
			<tbody class="tbody">
					<s:iterator value="wuyProd.designFileSet" status="st">
						<s:if test="type=='外形图片'">
							<s:if test="num%2==1 ">
								<tr align="center">
							</s:if>
								<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
									<img src="<s:property value="filePathVisit"/>" style="width: 60%;"/>
									<br/><br/>
									<span><s:property value="explain"/></span>
								</td>
							<s:if test="num%2==0">      
	            				</tr>          
	        				</s:if>
						</s:if>
					</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<%-- <br/>
	<fieldset>
		<legend style="font-size:16px;">引脚定义</legend>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="25%" style="font-size:17px;">引出端序号</th>
					<th width="15%" style="font-size:17px;">符号</th>
					<th width="50%" style="font-size:17px;">功能</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<s:iterator value="wuyProd.pinSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td><s:property value='num' /></td>
						<td><s:property value='ordernum' /></td>
						<td><s:property value='sign' /></td>
						<td><s:property value='function' /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">使用说明</legend>
		<table width="99%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="90%" style="font-size:17px;">使用说明</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<s:iterator value="wuyProd.attentionSet" status="st">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="wuyProdAttentionVoList[#index].id" /></td>
						<td><s:property value='num' /></td>
						<td><s:property value='attention' /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset> --%>
	</div>
	
	<div class="formBar" style="text-align:center;">
		<ul style="">
			<li><a class="button" href="../designInfo/WuyProd_exportNewWord_wuyProd.action?num=<s:property value='wuyProd.id'/>"><span style="font-size: 15px;">生成Word</span></a></li>
		</ul>
	</div>
</div>


