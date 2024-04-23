<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		
		var z = 0;
		for(var x=0;x<jn("table").length;x++){
			var $thisTable = jn("table").eq(x);
			var $Trs = $thisTable.find(".tbody tr");
			for(var i=0;i<$Trs.length;i++){
				
				//合并单元格
				var $referCol = $Trs.eq(i-z).find(".item");
				var $itemCol = $Trs.eq(i+1).find(".item");
				if($itemCol.text() == $referCol.text() ){
					$itemCol.hide();
					z = z+1;
				}else{
					$referCol.attr("rowspan",z+1);
					z = 0;
				}
			}
		}
		
		//展示检查结果的显示形式为在正确结果的选项前打对钩
		var $optionSpans = jn(".display span").not(".result");
		for(var i=0;i<$optionSpans.length;i++){
			var $optionSpan = $optionSpans.eq(i);
			var $resultSpan = $optionSpan.parent().find(".result");
			if($optionSpan.text() != ""){
				if($optionSpan.text()==$resultSpan.text()){
					$("<span style='font-size:17px;:10px;'>☑   </span>").insertBefore($optionSpan);
				}else{
					$("<span style='font-size:17px;'>☐   </span>").insertBefore($optionSpan);
				}
			}
		}
		
		if(jn("#taskName").val()=="审查组长签字"){
			jn("#review .display,#business,#responsible").remove();
		}
		if(jn("#taskName").val()=="事业部领导签字"){
			jn("#review .edit,#business .display,#responsible").remove();
		}
		if(jn("#taskName").val()=="产品责任人签字"){
			jn("#review .edit,#business .edit,#responsible .display").remove();
		}
		
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
	})
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!sdadpCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId'/>"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</div></td>
				</tr>
				<tr>
					<td align="left">
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">型号代号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 20%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 20%;">产品代号：<s:property value="checklist.productCode"/></label>
							<label style="width: 20%;">所属分系统：<s:property value="checklist.subSystem"/></label>
						</div>
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">阶段标志：<s:property value="checklist.stage"/></label>
							<label style="width: 20%;">产品编号：<s:property value="checklist.productNum"/></label>
							<label style="width: 20%;">审查文件名称：<s:property value="checklist.docName"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset id="review">
			<legend>交付数据包审查意见</legend>
			<table width="98%" class="edit_table edit" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="line-height:2em;">
									<s:if test="#st.index+1==1">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[0].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="记录准确、完整，可追溯，发现的问题已闭环" class="check" />记录准确、完整，可追溯，发现的问题已闭环
										</span>
									</s:if>
									<s:if test="#st.index+1==2">
										<input type="radio" name="checkResultList[1].firstCheck" value="与总体要求相符合" checked>与总体要求相符合 <br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，已得到卫星总体认可（见附页）">不满足总体要求，已得到卫星总体认可（见附页）<br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，需进行再试验">不满足总体要求，需进行再试验
									</s:if>
									<s:if test="#st.index+1==3">
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%" checked>测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100% <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页）">测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页） <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="不满足测试覆盖性分析报告的要求，需进行补充测试">不满足测试覆盖性分析报告的要求，需进行补充测试
									</s:if>
									<s:if test="#st.index+1==4">
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程数据一致性较好，性能稳定" checked>测试、试验前后及试验过程数据一致性较好，性能稳定 <br/>
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）">测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页） <br/>
										<input type="radio" name="checkResultList[3].firstCheck" value="" style="position:relative;z-index:5;top:5px;float:left;" class="merge">
										<span style="position:relative;z-index:4;top:8px;float:left;font-size:15px;word-break:break-all;display:inline-block;" class="mergeSub">经数据分析确认</span>
										<input type="text" name="abnormal" style="position:relative;z-index:3;top:-2px;width:145px;border-widht:5px;border-top:none #FFFFFF;border-left:none #FFFFFF;border-right:none #FFFFFF;background:transparent;text-align: center;"/>
										<span style="position:relative;z-index:2;top:8px;left:2px;font-size:15px;word-break:break-all;display:inline-block;" class="mergeSub">过程发生异常，需分析处理</span>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
			<table width="98%" class="edit_table display" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span class="result" style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==1">
										<span style="font-size:15px;line-height:2em;">记录准确、完整，可追溯，发现的问题已闭环</span>
									</s:if>
									<s:if test="#st.index+1==2">
										<span style="font-size:15px;line-height:2em;">与总体要求相符合</span><br/>
										<span style="font-size:15px;line-height:2em;">不满足总体要求，已得到卫星总体认可（见附页）</span><br/>
										<span style="font-size:15px;line-height:2em;">不满足总体要求，需进行再试验</span>
									</s:if>
									<s:if test="#st.index+1==3">
										<span style="font-size:15px;line-height:2em;">测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%</span><br/>
										<span style="font-size:15px;line-height:2em;">测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页）</span><br/>
										<span style="font-size:15px;line-height:2em;">不满足测试覆盖性分析报告的要求，需进行补充测试</span>
									</s:if>
									<s:if test="#st.index+1==4">
										<span style="font-size:15px;line-height:2em;">测试、试验前后及试验过程数据一致性较好，性能稳定</span><br/>
										<span style="font-size:15px;line-height:2em;">测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）</span><br/>
										<s:if test="firstCheck != '测试、试验前后及试验过程数据一致性较好，性能稳定' && firstCheck != '测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）'">
											<span style="font-size:15px;line-height:2em;"><s:property value='firstCheck'/></span>
										</s:if>
										<s:else>
											<span style="font-size:15px;line-height:2em;">经数据分析确认_______________过程发生异常，需分析处理</span>
										</s:else>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		
		<fieldset id="business">
			<legend>研制总结报告审查意见</legend>
			<table width="98%" class="edit_table edit" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>4 && #st.index+1<=8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="line-hight:2em;">
									<s:if test="#st.index+1==5">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[4].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="研制总结内容覆盖全面" class="check" />研制总结内容覆盖全面
										</span>
									</s:if>
									<s:if test="#st.index+1==6">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[5].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="所有超差项分析到位" class="check" />所有超差项分析到位
										</span>
									</s:if>
									<s:if test="#st.index+1==7">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[6].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致" class="check" />机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致
										</span>
									</s:if>
									<s:if test="#st.index+1==8">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[7].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="交付文件齐套、完整" class="check" />交付文件齐套、完整
										</span>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
			<table width="98%" class="edit_table display" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>4 && #st.index+1<=8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span class="result" style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==5">
										<span style="font-size:15px;line-height:2em;">研制总结内容覆盖全面</span>
									</s:if>
									<s:if test="#st.index+1==6">
										<span style="font-size:15px;line-height:2em;">所有超差项分析到位</span>
									</s:if>
									<s:if test="#st.index+1==7">
										<span style="font-size:15px;line-height:2em;">机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致</span>
									</s:if>
									<s:if test="#st.index+1==8">
										<span style="font-size:15px;line-height:2em;">交付文件齐套、完整</span>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset id="responsible">
			<legend>出所结论</legend>
			<table width="98%" class="edit_table edit" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="line-hight:2em;">
									<span style="display:none;font-size:15px;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==9">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[8].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求" class="check" />该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求
										</span>
									</s:if>
									<s:if test="#st.index+1==10">
										<input type="text" name="checkResultList[9].firstCheck" value="<s:property value='firstCheck'/>" style="width:98%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" />
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
			<table width="98%" class="edit_table display" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span class="result" style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==9">
										<span style="font-size:15px;line-height:2em;">该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求</span>
									</s:if>
									<s:if test="#st.index+1==10">
										<span style="font-size:15px;line-height:2em;"><s:property value='firstCheck'/></span>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset id="approve" style="display:none;">
			<legend>任务处理</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过" id="pass" checked>通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过">不通过
						</span>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="relUserList" status="st">      
				  	<s:if test="#st.odd||#st.first">      
             	 		<tr>          
         			</s:if>      
        			<td width="50%">
						<span style="font-size:15px"><s:property value='checkRole.roleName'/></span>：
						<s:property value='user.name'/>
						<s:if test="approve != null ">
							&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size:14px">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
						</s:if>
						
					</td> 
        			<s:if test="#st.even||#st.last">      
            			</tr>          
        			</s:if>      
        		</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align:center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>