<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//增加检查项目and在点击过其链接的基础上再增加项目要求
	jn(".itemAdd").click(function(){ 
		$newDemand = $(this).parent().parent().clone();
		$newDemand.find("td:eq(0)").attr("rowspan","1");
		$newDemand.find("input").val("");
		$newDemand.find("a:eq(0)").replaceWith("<a href='javascript:;' class='itemDel' style='color:red;margin-right:-25px;'>[-]</a>")
		$newDemand.appendTo(jn("#item").last());
		for(var i=1;i<jn("#item tr").length+1;i++){
			jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
		}
		
		//删除检查项目
		jn(".itemDel").click(function(){
			for(var i=0;i<$(this).parent().attr("rowspan");i++){
				jn("#item tr").eq(parseInt($(this).parent().next().text())).remove();
			}
			for(var i=1;i<jn("#item tr").length+1;i++){
				jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
			}
			//阻止事件冒泡
			event.stopPropagation();
		});
		
		//增加某个检查项目的项目要求
		jn(".demandAdd").click(function(){
			$thisTr = $(this).parent().parent();
			var $checkItemTd = $thisTr.find("td:eq(0)");
			
			var $newDemand = $thisTr.clone();
			$newDemand.find("input").val("");
			$newDemand.find("td:eq(0)").hide();
			$newDemand.find("a:eq(1)").replaceWith("<a href='javascript:;' class='demandDel' style='color:red;margin-right:-25px;'>[-]</a>");
			var rowspan = parseInt($checkItemTd.attr("rowspan"));
			$newDemand.insertAfter(jn("#item tr").eq(parseInt($thisTr.find("td:eq(1)").text()-1)+rowspan));
			$checkItemTd.attr("rowspan",parseInt($checkItemTd.attr("rowspan"))+1);
			
			for(var i=1;i<jn("#item tr").length+1;i++){
				jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
			}
			
			//删除某个检查项目的项目要求
			jn(".demandDel").click(function(){
				for(var i=parseInt($(this).parent().prev().text());i>0;i--){
					//alert(i);
					if(jn("#item tr").eq(i).find("td:eq(0)").is(":visible")){
						jn("#item tr").eq(i).find("td:eq(0)").attr("rowspan",parseInt($checkItemTd.attr("rowspan"))-1);
						$(this).parent().parent().remove();
						break;
					}
				}
				
				for(var i=1;i<jn("#item tr").length+1;i++){
					jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
				}
				//阻止事件冒泡
				event.stopPropagation();
			});
			//阻止事件冒泡
			event.stopPropagation();
		});
		event.stopPropagation();
	});
	
	
	//没有点击过增加检查项目链接的情况下增加项目要求
	jn(".demandAdd").click(function(){
			$thisTr = $(this).parent().parent();
			var $checkItemTd = $thisTr.find("td:eq(0)");
			
			var $newDemand = $thisTr.clone();
			$newDemand.find("input").val("");
			$newDemand.find("td:eq(0)").hide();
			$newDemand.find("a:eq(1)").replaceWith("<a href='javascript:;' class='demandDel' style='color:red;margin-right:-25px;'>[-]</a>");
			var rowspan = parseInt($checkItemTd.attr("rowspan"));
			$newDemand.insertAfter(jn("#item tr").eq(parseInt($thisTr.find("td:eq(1)").text()-1)+rowspan));
			$checkItemTd.attr("rowspan",parseInt($checkItemTd.attr("rowspan"))+1);
			
			for(var i=1;i<jn("#item tr").length+1;i++){
				jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
			}
			//删除某个检查项目的项目要求
			jn(".demandDel").click(function(){
				for(var i=parseInt($(this).parent().prev().text());i>0;i--){
					//alert(i);
					if(jn("#item tr").eq(i).find("td:eq(0)").is(":visible")){
						jn("#item tr").eq(i).find("td:eq(0)").attr("rowspan",parseInt($checkItemTd.attr("rowspan"))-1);
						$(this).parent().parent().remove();
						break;
					}
				}
				for(var i=1;i<jn("#item tr").length+1;i++){
					jn("#item tr").eq(i).find("#num").empty().append(i+"<input type='hidden' name='' value='' /> ");
				}
				//阻止事件冒泡
				event.stopPropagation();
			});
			event.stopPropagation();
		});
		
		//点击过“继续增加”按钮的前提下，点击“删除”按钮删除当前行，如果是最后一个输入行则仅清空输入框内容
		jn("#checkRoleAdd").click(function(){
			var $newCheckRole = jn("#checkRole tr:eq(1)").clone();
			$newCheckRole.find("input:eq(1)").val("");
			jn("#checkRole").append($newCheckRole);
			
			jn(".checkRoleDel").click(function(){
				if(jn("#checkRole tr").length>2){
					$(this).parent().parent().remove();
				}else{
					$(this).parent().parent().find("input:eq(1)").val("");
				}
				//阻止事件冒泡
				event.stopPropagation();
			})
		})
		
		
		jn(".checkRoleDel").click(function(){
				$(this).parent().parent().find("input:eq(1)").val("");
			})
		
		jn("#submitBtn").click(function(){
		
			//提交前给item的各个input输入框动态添加name
			var checkItem = "";
			for(var i=1;i<jn("#item tr").length;i++){
				if(jn("#item tr").eq(i).find("td:eq(0) input").is(":visible")){
					checkItem = jn("#item tr").eq(i).find("td:eq(0) input").val();
				}else{
					jn("#item tr").eq(i).find("td:eq(0) input").val(checkItem);
				}
				jn("#item tr").eq(i).find("td:eq(0) input").attr("name","checkItemList["+(i-1)+"].item");
				jn("#item tr").eq(i).find("td:eq(1) input").val(i);
				jn("#item tr").eq(i).find("td:eq(1) input").attr("name","checkItemList["+(i-1)+"].num");
				jn("#item tr").eq(i).find("td:eq(2) input").attr("name","checkItemList["+(i-1)+"].demand");
			}
			//提交前给checkRole的各个input输入框动态添加name
			for(var j=1;j<jn("#checkRole tr").length;j++){
				jn("#checkRole tr").eq(j).find("td input:eq(0)").val(j-1);
				jn("#checkRole tr").eq(j).find("td input:eq(0)").attr("name","checkRoleList["+(j-1)+"].num");
				jn("#checkRole tr").eq(j).find("td input:eq(1)").attr("name","checkRoleList["+(j-1)+"].roleName");
			}
		})
		
		
		
		
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklist!checkItemSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto">
				<tr >
					<td align="center" width="30%">
						<label>检查单标题：</label>
						<input type="text" name="checkTitle.headline" >
					</td>
					<td width="30%">
						<label>检查单类型：</label>
						<input type="text" name="checklistType" >
					</td>
					<td align="center"  width="30%">
						<label>版本号：</label>
						<input type="text" name="version" >
					</td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto" id="item">
				<tr align="center">
					<td width="11%">
						检查项目
					</td>
					<td width="5%">序号</td>
					<td width="40%">项目要求</td>
				</tr>
				<tr align="center">
					<td rowspan="1">
						<input name="" value="" />
						<a href="javascript:;" class="itemAdd" style="color:green;margin-right:-25px;">[+]</a>
					</td>
					<td id="num">
						1
						<input type="hidden" value="1" name="" />
					</td>
					<td>
						<input name="" value="" style="width:90%" />
						<a href="javascript:;" class="demandAdd" style="color:green;margin-right:-25px;">[+]</a>
					</td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto" id="checkRole">
				<tr align="center">
					<td colspan="2">
						相关审批人员角色名称&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:;" id="checkRoleAdd" style="color:green;">继续增加</a>
					</td>
				</tr>
				<tr align="center">
					<td colspan="1" >
						<input type="hidden" name="" />
						<input type="text" name="" />
					</td>
					<td colspan="1">
						<a href="javascript:;" class="checkRoleDel" style="color:red;">删除</a>
					</td>
				</tr>
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