<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd(function(){
		
		jd("#fullScrBtn").click(function(){
			jd(".maximize").click();
		})	
		
		var z = 0;
		for(var x=0;x<jd("table").length;x++){
			var $thisTable = jd("table").eq(x);
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
		var $optionSpans = jd("table span").not(".result");
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
		//不同节点不同显示
		if(jd("#taskName").val()=="审查组长签字"){
			jd("#review,#business,#responsible").remove();
		}
		if(jd("#taskName").val()=="事业部领导签字"){
			jd("#business,#responsible").remove();
		}
		if(jd("#taskName").val()=="产品责任人签字"){
			jd("#responsible").remove();
		}
	})
</script>
<div class="pageContent">
	<input type="hidden"  value="<s:property value='taskName' />" id="taskName"/>
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
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="padding:10px;">
									<span class="result" style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==1">
										<span style="font-size:15px;">记录准确、完整，可追溯，发现的问题已闭环</span>
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
			<div style="float:right;padding:25px 80px 50px 0;font-size:15px;">
				<s:if test="relUserList.get(1).approve != null ">
					<span style="font-size:13px;"><s:property value='relUserList.get(1).checkRole.roleName'/>签字:  </span><s:property value='relUserList.get(1).user.name'/>
					&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size:13px;">日期:  </span><s:date name="relUserList.get(1).approve.endDate" format="yyyy-MM-dd HH:mm"/>
				</s:if>
			</div>
		</fieldset>
		<fieldset id="business">
			<legend>研制总结报告审查意见</legend>
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>4 && #st.index+1<=8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="padding:10px;">
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
			<div style="float:right;padding:25px 80px 50px 0;font-size:15px;">
				<s:if test="relUserList.get(2).approve!= null ">
					<span style="font-size:13px;"><s:property value='relUserList.get(2).checkRole.roleName'/>签字:  </span><s:property value='relUserList.get(2).user.name'/>
					&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size:13px;">日期:  </span><s:date name="relUserList.get(2).approve.endDate" format="yyyy-MM-dd HH:mm"/>
				</s:if>
			</div>
		</fieldset>
		<fieldset id="responsible">
			<legend>出所结论</legend>
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>8">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td style="padding:10px;">
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
			<div style="float:right;padding:25px 80px 50px 0;font-size:15px;">
				<s:if test="relUserList.get(3).approve != null ">
					<span style="font-size:13px;"><s:property value='relUserList.get(3).checkRole.roleName'/>签字:  </span><s:property value='relUserList.get(3).user.name'/>
					&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size:13px;">日期:  </span><s:date name="relUserList.get(3).approve.endDate" format="yyyy-MM-dd HH:mm"/>
				</s:if>
			</div>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li><a class="button" id="fullScrBtn"><span>全屏查看</span></a></li>
			<li><a class="button" id="print" href="../checklist/print!printChecklist.action?checklistId=<s:property value='checklist.id'/>"><span>生成Word</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
</div>