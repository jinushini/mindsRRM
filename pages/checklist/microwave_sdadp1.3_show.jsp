<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd(function(){
		
		jd("#fullScrBtn").click(function(){
			jd(".maximize").click();
		})	
		
		var z = 0;
		for(var i=0;i<jd(".tbody tr").length;i++){
			
			//合并单元格
			var $referCol = jd(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jd(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
		}
		
		//展示检查结果的显示形式为在设计师选择的结果前打对钩
		for(var i=0;i<jd(".tbody tr").length;i++){
			var $firstCheck = jd(".tbody tr").eq(i).find("span");
			if(jd(".tbody tr").eq(i).find("input[type='radio']").length!=0){
				for(var j=0;j<jd(".tbody tr").eq(i).find("input[type='radio']").length;j++){
					var $thisRadio = jd(".tbody tr").eq(i).find("input[type='radio']").eq(j);
					if($thisRadio.val()==$firstCheck.text()){
						$("<span style='font-size:17px;'>☑    </span>").insertBefore($thisRadio);
					}else{
						$("<span style='font-size:17px;'>☐   </span>").insertBefore($thisRadio);
					}
				}
			}else{
				if($firstCheck.text()!=""){
					$firstCheck.show();
					$("<span style='font-size:17px;'>☑    </span>").insertBefore($firstCheck);
				}
			}
			jd(".tbody tr").eq(i).find("input[type='radio'],input[type='text']").remove();
			if(i==3){
				//在“数据一致性及正确性”这一行，如果正确答案是前两个答案的某个，则在这两个预设答案后输出默认固定字段作为第三个预设答案，并正常给正确答案选中打钩；如果正确答案不是前两个预设，则在前两个预设答案后直接输出正确答案作为第三个答案，并在其前面打钩
				if($firstCheck.text()!="测试、试验前后及试验过程数据一致性较好，性能稳定" && $firstCheck.text()!="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）"){
					jd(".tbody tr").eq(i).find(".firstCheck").append("<span style='font-size:17px;'>☑    </span>"+$firstCheck.text());
				}else{
					jd(".tbody tr").eq(i).find(".firstCheck").append("<span style='font-size:17px;'>☐    </span>经数据分析确认__________过程发生异常，需分析处理");
				}
			}
		}
	})
</script>
<div class="pageContent">
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
		<fieldset>
			<legend>交付数据包审查意见</legend>
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td class="firstCheck">
									<span style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==1">
										<input type="radio" name="checkResultList[0].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="记录准确、完整，可追溯，发现的问题已闭环">记录准确、完整，可追溯，发现的问题已闭环
									</s:if>
									<s:if test="#st.index+1==2">
										<input type="radio" name="checkResultList[1].firstCheck" value="与总体要求相符合">与总体要求相符合 <br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，已得到卫星总体认可（见附页）">不满足总体要求，已得到卫星总体认可（见附页）<br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，需进行再试验">不满足总体要求，需进行再试验
									</s:if>
									<s:if test="#st.index+1==3">
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%">测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100% <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页）">测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页） <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="不满足测试覆盖性分析报告的要求，需进行补充测试">不满足测试覆盖性分析报告的要求，需进行补充测试
									</s:if>
									<s:if test="#st.index+1==4">
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程数据一致性较好，性能稳定">测试、试验前后及试验过程数据一致性较好，性能稳定 <br/>
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）">测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页） <br/>
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
		<fieldset>
			<legend>研制总结报告审查意见</legend>
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>4 && #st.index+1<=7">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==5">
										<input type="radio" name="checkResultList[4].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="研制总结内容覆盖全面">研制总结内容覆盖全面
									</s:if>
									<s:if test="#st.index+1==6">
										<input type="radio" name="checkResultList[5].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="所有超差项分析到位">所有超差项分析到位
									</s:if>
									<s:if test="#st.index+1==7">
										<input type="radio" name="checkResultList[6].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致">机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致
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
		<fieldset>
			<legend>出所结论</legend>
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>7">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td >
									<span style="display:none;padding:5px;font-size:15px;white-space:normal;word-break:break-all;word-wrap:break-word;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==8">
										<input type="radio" name="checkResultList[7].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求">该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求
									</s:if>
									<s:if test="#st.index+1==9">
										<input type="text" name="checkResultList[8].firstCheck" value="<s:property value='firstCheck'/>"/>
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