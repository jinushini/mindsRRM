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
			//动态添加结果表内secondCheck输入框的name
			jn(".tbody tr").eq(i).find(".secondCheck input").attr("name","checkResultList["+i+"].secondCheck");
		}
		
		//动态添加relUser表格内人员输入框的name
		var k = 0;
		for(var i=0;i<jn("#relUser tr").length;i++){
			for(var j=0;j<jn("#relUser tr").eq(i).find("[type='text']").length;j++){
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).prev().attr("name","relUserList["+k+"].user.id");
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).attr("name","relUserList["+k+"].user.name");
				k = k+1;
			}
		}
	})
	
	jn("#submitBtn").click(function(){
		var $merges = jn(".merge");
		for(var i=0;i<$merges.length;i++){
			var $thisMerge = $merges.eq(i);
			$thisAbnormal = $thisMerge.parent().find("[name='abnormal']");
			if($thisMerge.is(":checked")){
				$thisAbnormal.val($thisAbnormal.val().trim());
				$thisAbnormal.addClass("required");
				var $thisMergeSub = $thisMerge.parent().find(".mergeSub");
				var thisMergeVal = $thisMergeSub.eq(0).text() + $thisAbnormal.val().trim() + $thisMergeSub.eq(1).text();
				$thisMerge.val(thisMergeVal);
			}else{
				$thisAbnormal.removeClass("required");
			}
		}
	})
	
	
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklist!checklistBuildSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="checklist.checklistType" value="<s:property value='checklistType'/>"/>
	<input type="hidden" name="checklist.version" value="<s:property value='version'/>"/>
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<div style="font-size:23px;margin:10px;text-align:center;"><s:property value="headline"/></div>
			<table width="98%" class="edit_table" style="margin:5px auto;table-layout:fixed;">
				<s:if test="checklist.productOrder == null">
					<tr style="text-align:center;">
						<td>型号代号</td>
						<td><input type="text" name="checklist.modelCode" value="<s:property value="checklist.modelCode"/>" style="width:120px;"></td>
						<td>产品名称</td>
						<td><input type="text" name="checklist.productName" value="<s:property value="checklist.productName"/>" style="width:120px;"></td>
						<td>产品代号</td>
						<td><input type="text" name="checklist.productCode" value="<s:property value="checklist.productCode"/>" style="width:120px;"></td>
						<td>所属分系统</td>
						<td><input type="text" name="checklist.subSystem" value="<s:property value="checklist.subSystem"/>" style="width:120px;"></td>
					</tr>
					<tr style="text-align:center;">
						<td>阶段标志</td>
						<td><input type="text" name="checklist.modelCode" value="<s:property value="checklist.stage"/>" style="width:120px;"></td>
						<td>产品编号</td>
						<td><input type="text" name="checklist.productName" value="<s:property value="checklist.productNum"/>" style="width:120px;"></td>
						<td>产品类别</td>
						<td><input type="text" name="checklist.productCode" value="<s:property value="checklist.productType"/>" style="width:120px;"></td>
						<td>数量</td>
						<td><input type="text" name="checklist.subSystem" value="<s:property value="checklist.productSum"/>" style="width:120px;"></td>
					</tr>
				</s:if>
				<s:else>
					<tr style="text-align:center;">
						<td>型号代号</td>
						<td><s:property value="checklist.productOrder.productLib.modelCode"/></td>
						<td>产品名称</td>
						<td><s:property value="checklist.productOrder.name"/></td>
						<td>产品代号</td>
						<td><s:property value="checklist.productOrder.code"/></td>
						<td>所属分系统</td>
						<td><s:property value="checklist.productOrder.type"/></td>
					</tr>
					<tr style="text-align:center;">
						<td>阶段标志</td>
						<td><s:property value="checklist.productOrder.phase"/></td>
						<td>产品编号</td>
						<td><s:property value="checklist.productOrder.productNum"/></td>
						<td>产品类别</td>
						<td><s:property value="checklist.productOrder.selectType"/></td>
						<td>数量</td>
						<td><input type="text" name="checklist.subSystem" value="<s:property value="checklist.productSum"/>" style="width:120px;"></td>
					</tr>
				</s:else>
			</table>
		</fieldset>
		<fieldset>
			<legend>自查内容</legend>
			<table width="98%" class="edit_table" style="margin:5px auto" id="item">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th width="15%" style="font-weight:bold;font-size:18px;" colspan="2">交验自查项目</th>
						<th width="15%" style="font-weight:bold;font-size:18px;">自查结果</th>
						<th width="20%" style="font-weight:bold;font-size:18px;">备注</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkItemList" status="st">
						<tr>
							<s:if test="#st.index+1==9 || #st.index+1==10 || #st.index+1==11">
								<td align="center" class="item" width="7%"><s:property value='item'/></td>
								<td align="center" width="8%" ><s:property value='demand'/></td>
							</s:if>
							<s:else>
								<td align="center" class="item" colspan="2"><s:property value='item'/></td>
							</s:else>
							<td style="line-height:2em;">
								<s:if test="#st.index+1==1">
									<input type="radio" value="齐全" name="checkResultList[0].firstCheck" checked />齐全<br/>
									<input type="radio" value="未齐全" name="checkResultList[0].firstCheck" />未齐全
								</s:if>
								<s:if test="#st.index+1==2">
									<input type="radio" value="齐备" name="checkResultList[1].firstCheck" checked />齐备<br/>
									<input type="radio" value="未齐备" name="checkResultList[1].firstCheck" />未齐备
								</s:if>
								<s:if test="#st.index+1==3">
									<input type="radio" value="齐备" name="checkResultList[2].firstCheck" checked />齐备<br/>
									<input type="radio" value="未齐备" name="checkResultList[2].firstCheck" />未齐备
								</s:if>
								<s:if test="#st.index+1==4">
									<input type="radio" value="过程记录签署完整" name="checkResultList[3].firstCheck" checked />过程记录签署完整<br/>
									<input type="radio" value="过程记录签署不完整" name="checkResultList[3].firstCheck" />过程记录签署不完整
								</s:if>
								<s:if test="#st.index+1==5">
									<input type="radio" value="有，已完成关键检验点项目检查" name="checkResultList[4].firstCheck" checked />有，已完成关键检验点项目检查<br/>
									<input type="radio" value="有，未完成关键检验点项目检查" name="checkResultList[4].firstCheck" />有，未完成关键检验点项目检查<br/>
									<input type="radio" value="无" name="checkResultList[4].firstCheck" />无
								</s:if>
								<s:if test="#st.index+1==6">
									<input type="radio" value="有，已完成强制检验点项目检查" name="checkResultList[5].firstCheck" checked />有，已完成强制检验点项目检查<br/>
									<input type="radio" value="有，未完成强制检验点项目检查" name="checkResultList[5].firstCheck" />有，未完成强制检验点项目检查<br/>
									<input type="radio" value="无" name="checkResultList[5].firstCheck" />无
								</s:if>
								<s:if test="#st.index+1==7">
									<input type="radio" value="无设计偏离" name="checkResultList[6].firstCheck" checked />无设计偏离<br/>
									<input type="radio" value="偏离项已办理申请，并获得批准" name="checkResultList[6].firstCheck" />偏离项已办理申请，并获得批准<br/>
									<input type="radio" value="偏离项已办理申请，正在分系统总体审批中" name="checkResultList[6].firstCheck" />偏离项已办理申请，正在分系统总体审批中
								</s:if>
								<s:if test="#st.index+1==8">
									<input type="radio" value="无生产超差" name="checkResultList[7].firstCheck" checked/>无生产超差<br/>
									<input type="radio" value="超差项已办理申请，并获得批准" name="checkResultList[7].firstCheck" />超差项已办理申请，并获得批准<br/>
									<input type="radio" value="超差项已办理申请，正在分系统总体审批中" name="checkResultList[7].firstCheck" />超差项已办理申请，正在分系统总体审批中
								</s:if>
								<s:if test="#st.index+1==9">
									<input type="radio" value="无技术状态更改" name="checkResultList[8].firstCheck" checked />无技术状态更改<br/>
									<input type="radio" name="checkResultList[8].firstCheck" value="" style="position:relative;top:5px;z-index:5;float:left;" class="merge"><span style="position:relative;z-index:4;top:8px;float:left;font-size:15px;display:inline-block;word-break:break-all;" class="mergeSub">技术状态更改已落实，并有检查单。共</span><input type="text" name="abnormal" style="position:relative;z-index:3;top:-2px;width:35px;border-top:none #FFFFFF;border-left:none #FFFFFF;border-right:none #FFFFFF;background:transparent;text-align: center;"/><span style="position:relative;z-index:2;top:-16px;text-indent:21em;font-size:15px;word-break:break-all;display:inline-block;" class="mergeSub">份技术状态更改单，实物、图纸均已经落实</span>
								</s:if>
								<s:if test="#st.index+1==10">
									<input type="radio" value="无不合格品处理" name="checkResultList[9].firstCheck" checked />无不合格品处理<br/>
									<input type="radio" name="checkResultList[9].firstCheck" value="" style="position:relative;top:5px;z-index:5;float:left;" class="merge"><span style="position:relative;z-index:4;top:8px;float:left;font-size:15px;display:inline-block;word-break:break-all;" class="mergeSub">不合格品处理单均签署完整。共</span><input type="text" name="abnormal" style="position:relative;z-index:3;top:-2px;width:35px;border-top:none #FFFFFF;border-left:none #FFFFFF;border-right:none #FFFFFF;background:transparent;text-align: center;"/><span style="position:relative;z-index:2;top:-16px;text-indent:18em;font-size:15px;word-break:break-all;display:inline-block;" class="mergeSub">份不合格品处理单，均签署完成</span>
								</s:if>
								<s:if test="#st.index+1==11">
									<input type="radio" value="无特殊问题处理" name="checkResultList[10].firstCheck" checked />无特殊问题处理<br/>
									<input type="radio" name="checkResultList[10].firstCheck" value="" style="position:relative;top:5px;z-index:5;float:left;" class="merge"><span style="position:relative;z-index:4;top:8px;float:left;font-size:15px;display:inline-block;word-break:break-all;" class="mergeSub">特殊问题处理单均已闭环。共</span><input type="text" name="abnormal"style="position:relative;z-index:3;top:-2px;width:35px;border-top:none #FFFFFF;border-left:none #FFFFFF;border-right:none #FFFFFF;background:transparent;text-align: center;"/><span style="position:relative;z-index:2;top:-16px;margin-bottom:-8px;text-indent:17em;font-size:15px;word-break:break-all;display:inline-block;" class="mergeSub">份特殊问题处理单，均已闭环</span>
								</s:if>
								<s:if test="#st.index+1==12">
									<input type="radio" value="无质量问题" name="checkResultList[11].firstCheck" checked />无质量问题<br/>
									<input type="radio" value="有质量问题，已归零" name="checkResultList[11].firstCheck" />有质量问题，已归零<br/>
									<input type="radio" value="有质量问题，未归零" name="checkResultList[11].firstCheck" />有质量问题，未归零
								</s:if>
								<s:if test="#st.index+1==13">
									<input type="radio" value="生产阶段产保要素已落实，研制总结中提供了落实记录" name="checkResultList[12].firstCheck" checked />生产阶段产保要素已落实，研制总结中提供了落实记录<br/>
									<input type="radio" value="生产阶段产保要素未落实" name="checkResultList[12].firstCheck" />生产阶段产保要素未落实
								</s:if>
								<s:if test="#st.index+1==14">
									<input type="radio" value="产品实物与IDS一致" name="checkResultList[13].firstCheck" checked />产品实物与IDS一致<br/>
									<input type="radio" value="产品实物与IDS不一致" name="checkResultList[13].firstCheck" />产品实物与IDS不一致
								</s:if>
								<s:if test="#st.index+1==15">
									<input type="text" name="checkResultList[14].firstCheck" style="border:0;width:95%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" >
								</s:if>
							</td>
							<td class="secondCheck" style="line-height:2em;"><input type="text" style="border:0;width:95%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>	
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="checkRoleList" status="st">      
				  	<s:if test="#st.index>0">  
					  	<s:if test="#st.even||#st.first">      
	             	 		<tr>          
	         			</s:if>      
	         			<td align="center" width="20%"><s:property value='roleName'/></td>
	        			<td colspan="1">
							<input type="hidden" class="required" id="relUserId">
							<input type="text" class="required" id="relUserName" readonly="readonly" onclick="$(this).next().click()">
							<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
	        			<s:if test="#st.odd||#st.last">      
	            			</tr>          
	        			</s:if>
        			</s:if>
        		</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>