<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		for(var i=0;i<jn(".tbody").length;i++){
			var $thisTbody = jn(".tbody").eq(i);
			sortThis($thisTbody);
		}
	})
	//点击增加新数据
	jn(".dataAdd").click(function(){
		var $thisLegend = jn(this).parent();
		var $thisTbody = jn(this).parent().parent().find(".tbody");
		if($thisLegend.attr("id")=="kuangtu" && $thisTbody.find("tr:visible").length>0){
			alertMsg.error("最多上传一张功能框图！");
			return false;
		}
		if($thisLegend.attr("id")=="quxian" && $thisTbody.find("tr:visible").length>3){
			alertMsg.error("最多上传四张典型曲线图！");
			return false;
		}
		if($thisLegend.attr("id")=="chicun" && $thisTbody.find("tr:visible").length>0){
			alertMsg.error("最多上传一张外形尺寸图！");
			return false;
		}
		
		//新一行(新加一行)
		var $newTr=jn(this).parent().parent().find(".modelTr").clone();
		$newTr.removeAttr("style");
		$newTr.attr("class","newTr");
		$newTr.find("input[type=text]").not(".explain").attr("class", "required");
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		$thisTbody.append($newTr);
		sortThis($thisTbody);
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)在进行删除时，直接删除该行
		$newTr.find(".delBtn").click(function(){
			jn(this).parent().parent().remove();
			sortThis($thisTbody);
			//阻止事件冒泡
			event.stopPropagation();
		});
	});
	
	//在没有点击“新增一行”之前的行，即原本存在的“展示行”在删除时
	jn(".delBtn").click(function(){
		var $thisTr = jn(this).parent().parent();
		var $thisTbody = $thisTr.parent();
		$thisTr.remove();
		sortThis($thisTbody);
	});
	   
	//提交按钮
	jn("[type=submit]").click(function() {
		for(var i=0;i<jn(".tbody").length;i++){
			var $thisTbody = jn(".tbody").eq(i);
			//给新增的“输入行”数据加name
			var $newTrs = $thisTbody.find(".newTr");
			addNames($newTrs);
			
			//给修改的“展示行”数据加name
			var $modifyTrs = $thisTbody.find(".modifyTr");
			addNames($modifyTrs);
		}
		//对于非文件类型的修改行，每个tbody分别从1开始命名，而文件类型的修改行统一从1开始命名
		addNames(jn(".modifyFileTr"));
	});
	
	function addNames($Trs){
		for(var i = 0; i < $Trs.length; i++){
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
	
	//对表格中的行序号进行自动排序并赋值
	function sortThis($thisTbody){
		var $thisTrs = $thisTbody.find("tr");
		for(var i=1;i<$thisTrs.length;i++){
			$thisTrs.eq(i).find(".num div").text(i);
			$thisTrs.eq(i).find(".num input").val(i);
		}
	}
</script>
<style type="text/css">
	.inputLeft{
		width:97%;
		background-color:#F0F0F0;
	}
	
	.inputCenter{
		width:97%;
		background-color:#F0F0F0;
		text-align:center;
	}
</style>
<div class="pageContent">
  <form action="../designInfo/Mcm_ModifyMcmDetail_mcm.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
  	<input type="hidden" name="mcm.id" value="<s:property value="mcm.id"/>" />
	<br/>
	<fieldset>
		<legend style="font-size:16px;">MCM基本信息</legend>
			<table border="0" width="97%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">模块编号</td>
					<td><s:property value="mcm.code"/></td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">模块名称</td>
					<td>
						<input type="text" class="required" style="width:97%;background-color:#F0F0F0;" value="<s:property value='mcm.name'/>" name="mcm.name" />
						<%-- <s:property value='mcm.name'/> --%>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">主管设计师</td>
					<td>
						<s:property value="mcm.singleHead.name"/>
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">封装形式</td>
					<td>
						<input type="text" class="required" style="width:97%;background-color:#F0F0F0;" value="<s:property value='mcm.packageForm'/>" name="mcm.packageForm" />
					</td>
				</tr>
				<tr>
					<td align="center" style="width:20%;background-color:#E4F0FC;font-size:17px;">产品简介</td>
					<td><textarea name="mcm.introduction" rows="3" class="required"style="width:97%;background-color:#F0F0F0;" ><s:property value='mcm.introduction'/></textarea></td>
				</tr>
			</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;" id="kuangtu">功能框图&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行<span style="color:red;font-size:14px;">（仅支持上传jpg和png格式的图片）</span></a></legend>
		<table border="0" width="97%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="50%" style="font-size:17px;">功能框图</th>
					<th width="40%" style="font-size:17px;">图片说明</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" style="display:none;" align="center">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="designFileListA[#index].num" />
					</td>
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
						<input type="hidden" name="designFileListA[#index].type" value="功能框图" />
						<input type="file" name="fileA" accept="image/jpeg,image/png" />
					</td>
					<td>
						<input type="text" class="explain" name="designFileListA[#index].explain" style="width:97%;background-color:#F0F0F0;text-align:center;" />
					</td>
					<td><a class="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.designFileSet" status="st">
					<s:if test="type=='功能框图'">
						<tr class="modifyFileTr" align="center">
							<td class="num">
								<div style="font-size:15px;margin:8px auto;"></div>
								<input type="hidden" name="designFileVoList[#index].num" />
							</td>
							<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
								<input type="hidden" value="<s:property value="id"/>" name="designFileVoList[#index].id" />	
								<a href="<s:property value='filePathVisit'/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右击下载</a></br>
							</td>
							<td>
								<input type="text" name="designFileVoList[#index].explain" value="<s:property value='explain' />" style="width:97%;background-color:#F0F0F0;text-align:center;" />
							</td>
							<td align="center"><a class="delBtn" href="javascript:;" style="color:red;">删除</a></td>
						</tr>
					</s:if>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">性能特点&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;" >增加一行<span style="color:red;font-size:14px;">（前10项被用于生成产品手册）</span></a></legend>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="90%" style="font-size:17px;">特点</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" align="center" style="display:none;">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="performFeatureList[#index].num" />
					</td>
					<td><input type="text" name="performFeatureList[#index].feature" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.performFeatureSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="performFeatureVoList[#index].id" /></td>
						<td class="num">
							<div style="font-size:15px;margin:8px auto;"></div>
							<input type="hidden" name="performFeatureVoList[#index].num" />
						</td>
						<td><input type="text" name="performFeatureVoList[#index].feature" value="<s:property value='feature' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><a class="delBtn" href="###" style="color:red;">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">主要电参数&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行</a></legend>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<tr align="center">
				<td width="20%" style="background-color:#E4F0FC;font-weight: bold;">电参数条件</td>
				<td><input type="text" name="mcm.eleParamCondition" value="<s:property value='mcm.eleParamCondition' />" style="width:97%;background-color:#F0F0F0;align:center;" /></td>
			</tr>
		</table>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead align="center" style="background-color:#E4F0FC;">
				<tr>
					<th width="5%" rowspan="2" style="font-size:17px;">序号</th>
					<th width="30%" rowspan="2" style="font-size:17px;">技术指标</th>
					<th width="10%" rowspan="2" style="font-size:17px;">符号</th>
					<th width="40%" colspan="3" style="font-size:17px;">测试值</th>
					<th width="10%" rowspan="2" style="font-size:17px;">单位</th>
					<th width="5%" rowspan="2" style="font-size:17px;">操作</th>
				</tr>
				<tr>
					<th width="10%" style="font-size:17px;">最小</th>
					<th width="10%" style="font-size:17px;">典型</th>
					<th width="10%" style="font-size:17px;">最大</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" align="center" style="display:none;">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="eleParamList[#index].num" />
					</td>
					<td><input type="text" name="eleParamList[#index].techItem" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="eleParamList[#index].sign" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="eleParamList[#index].testvalueMin" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="eleParamList[#index].testvalueTypical" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="eleParamList[#index].testvalueMax" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="eleParamList[#index].unit" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.eleParamSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="eleParamVoList[#index].id" /></td>
						<td class="num">
							<div style="font-size:15px;margin:8px auto;"></div>
							<input type="hidden" name="eleParamVoList[#index].num" />
						</td>
						<td><input type="text" name="eleParamVoList[#index].techItem" value="<s:property value='techItem' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="eleParamVoList[#index].sign" value="<s:property value='sign' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="eleParamVoList[#index].testvalueMin" value="<s:property value='testvalueMin' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="eleParamVoList[#index].testvalueTypical" value="<s:property value='testvalueTypical' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="eleParamVoList[#index].testvalueMax" value="<s:property value='testvalueMax' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="eleParamVoList[#index].unit" value="<s:property value='unit' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><a class="delBtn" href="###" style="color:red;">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">极限参数&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行</a></legend>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="50%" style="font-size:17px;">参数</th>
					<th width="40%" style="font-size:17px;">数值</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" align="center" style="display:none;">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="limitParamList[#index].num" />
					</td>
					<td><input type="text" name="limitParamList[#index].param" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="limitParamList[#index].value" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.limitParamSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="limitParamVoList[#index].id" /></td>
						<td class="num">
							<div style="font-size:15px;margin:8px auto;"></div>
							<input type="hidden" name="limitParamVoList[#index].num" />
						</td>
						<td><input type="text" name="limitParamVoList[#index].param" value="<s:property value='param' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="limitParamVoList[#index].value" value="<s:property value='value' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><a class="delBtn" href="###" style="color:red;">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;" id="quxian">典型曲线&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行<span style="color:red;font-size:14px;">（仅支持上传jpg和png格式的图片）</span></a></legend>
		<table border="0" width="97%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="50%" style="font-size:17px;">典型曲线图</th>
					<th width="40%" style="font-size:17px;">图片说明</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" style="display:none;" align="center">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="designFileListB[#index].num" />
					</td>
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
						<input type="hidden" name="designFileListB[#index].type" value="典型曲线图" />
						<input type="file" name="fileB" accept="image/jpeg,image/png" />
					</td>
					<td>
						<input type="text" class="explain" name="designFileListB[#index].explain" style="width:97%;background-color:#F0F0F0;text-align:center;" />
					</td>
					<td><a class="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.designFileSet" status="st">
					<s:if test="type=='典型曲线图'">
						<tr class="modifyFileTr" align="center">
							<td class="num">
								<div style="font-size:15px;margin:8px auto;"></div>
								<input type="hidden" name="designFileVoList[#index].num" />
							</td>
							<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
								<input type="hidden" value="<s:property value="id"/>" name="designFileVoList[#index].id" />	
								<a href="<s:property value='filePathVisit'/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右击下载</a></br>
							</td>
							<td>
								<input type="text" name="designFileVoList[#index].explain" value="<s:property value='explain' />" style="width:97%;background-color:#F0F0F0;text-align:center;" />
							</td>
							<td align="center"><a class="delBtn" href="javascript:;" style="color:red;">删除</a></td>
						</tr>
					</s:if>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;" id="chicun">外形尺寸&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行<span style="color:red;font-size:14px;">（仅支持上传jpg和png格式的图片）</span></a></legend>
		<table border="0" width="97%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="50%" style="font-size:17px;">外形尺寸图</th>
					<th width="40%" style="font-size:17px;">图片说明</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" style="display:none;" align="center">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="designFileListC[#index].num" />
					</td>
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
						<input type="hidden" name="designFileListC[#index].type" value="外形尺寸图" />
						<input type="file" name="fileC" accept="image/jpeg,image/png" />
					</td>
					<td>
						<input type="text" class="explain" name="designFileListC[#index].explain" style="width:97%;background-color:#F0F0F0;text-align:center;" />
					</td>
					<td><a class="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.designFileSet" status="st">
					<s:if test="type=='外形尺寸图'">
						<tr class="modifyFileTr" align="center">
							<td class="num">
								<div style="font-size:15px;margin:8px auto;"></div>
								<input type="hidden" name="designFileVoList[#index].num" />
							</td>
							<td title="<s:property value='fileName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
								<input type="hidden" value="<s:property value="id"/>" name="designFileVoList[#index].id" />	
								<a href="<s:property value='filePathVisit'/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右击下载</a></br>
							</td>
							<td>
								<input type="text" name="designFileVoList[#index].explain" value="<s:property value='explain' />" style="width:97%;background-color:#F0F0F0;text-align:center;" />
							</td>
							<td align="center"><a class="delBtn" href="javascript:;" style="color:red;">删除</a></td>
						</tr>
					</s:if>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">引脚定义&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行</a></legend>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="25%" style="font-size:17px;">引出端序号</th>
					<th width="15%" style="font-size:17px;">符号</th>
					<th width="50%" style="font-size:17px;">功能</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" align="center" style="display:none;">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="pinList[#index].num" />
					</td>
					<td><input type="text" name="pinList[#index].ordernum" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="pinList[#index].sign" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td><input type="text" name="pinList[#index].function" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.pinSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="pinVoList[#index].id" /></td>
						<td class="num">
							<div style="font-size:15px;margin:8px auto;"></div>
							<input type="hidden" name="pinVoList[#index].num" />
						</td>
						<td><input type="text" name="pinVoList[#index].ordernum" value="<s:property value='ordernum' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="pinVoList[#index].sign" value="<s:property value='sign' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><input type="text" name="pinVoList[#index].function" value="<s:property value='function' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><a class="delBtn" href="###" style="color:red;">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	<br/>
	<fieldset>
		<legend style="font-size:16px;">使用说明&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行</a></legend>
		<table width="97%" class="edit_table" style="margin:15px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
			<thead>
				<tr align="center" style="background-color:#E4F0FC;">
					<th width="5%" style="font-size:17px;">序号</th>
					<th width="90%" style="font-size:17px;">使用说明</th>
					<th width="5%" style="font-size:17px;">操作</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="modelTr" align="center" style="display:none;">
					<td class="num">
						<div style="font-size:15px;margin:8px auto;" ></div>
						<input type="hidden" name="attentionList[#index].num" />
					</td>
					<td><input type="text" name="attentionList[#index].attention" style="width:97%;background-color:#F0F0F0;text-align:center;"/></td>
					<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
				</tr>
				<s:iterator value="mcm.attentionSet" status="st" var="a">
					<tr class="modifyTr" align="center">
						<td style="display:none;"><input value="<s:property value='id' />" name="attentionVoList[#index].id" /></td>
						<td class="num">
							<div style="font-size:15px;margin:8px auto;"></div>
							<input type="hidden" name="attentionVoList[#index].num" />
						</td>
						<td><input type="text" name="attentionVoList[#index].attention" value="<s:property value='attention' />" class="required" style="width:97%;background-color:#F0F0F0;text-align:center;" /></td>
						<td><a class="delBtn" href="###" style="color:red;">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</fieldset>
	</div>
	
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: right;"><div class="buttonActive"><div class="buttonContent"><button style="width:50px;padding-top:2px;font-size: 16px;" type="submit">提交</button></div></div></li>
		</ul>
	</div>
   </form>
</div>


