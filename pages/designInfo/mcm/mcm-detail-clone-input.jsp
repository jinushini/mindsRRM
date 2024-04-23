<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	jd("#cancelBtn").click(function(){
		jd(".close").click();
	})
	
	//点击增加新数据
	jd(".addBtn").click(function(){
		var $thisTbody = jd("table").find(".tbody");
		//新一行(新加一行)
		var $newTr = jd("table").find(".modelTr").clone();
		$newTr.removeAttr("style");
		$newTr.attr("class","newTr");
		$newTr.find("input").attr("class", "required");
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		$thisTbody.append($newTr);
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)在进行删除时，直接删除该行
		jd(".delBtn").click(function(){
			jd(this).parent().parent().remove();
			//阻止事件冒泡
			event.stopPropagation();
		});
	});
	
	//在没有点击“新增一行”之前的行，即原本存在的“展示行”在删除时
	jd(".delBtn").click(function(){
		var $thisTr = jd(this).parent().parent();
		$thisTr.remove();
	});
	
	//提交按钮
	jd("[type=submit]").click(function() {
		for(var i=0;i<jd(".tbody").length;i++){
			var $thisTbody = jd(".tbody").eq(i);
			//给新增的“输入行”数据加name
			var $newTrs = $thisTbody.find(".newTr");
			for(var j=0;j<$newTrs.length;j++){
				$newTrs.eq(j).find("input").attr("name", "data");
			}
		}
	});
</script>
<div class="pageHeader">
	<div class="searchBar">	
	</div>
</div>
<div class="pageContent" layoutH="20">
	<form action="../designInfo/Mcm_funClone_mcm.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<input type="hidden" name="num" value="<s:property value="mcm.id"/>" />
		<div layoutH="70" style="margin:30px 30px -25px; font-size:16px;line-height: 28px;">		
			请在下面输入框中填写有效产品代号（每行填一个，无效产品代号被忽略）<br/>
			提交成功后，<span style="color:red;font-size:20px"><s:property value="mcm.code"/></span>的各项性能将被复制到输入框中的每个产品上
			<table width="100%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th style="width:80%;font-weight:bolder;font-size:16px;">产品代号&nbsp;&nbsp;&nbsp;<a class="addBtn" href="javascript:;" style="color:green;font-weight:border;font-size:14px;">增加一行</a></th>
						<th style="width:20%;font-weight:bolder;font-size:16px;">操作</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<tr class="modelTr" align="center" style="display:none;">
						<td><input type="text" style="width:99%;text-align:center;" /></td>
						<td><a href="javascript:;" class="delBtn" style="color:red;" >删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>	
		<div class="formBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li> -->
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>