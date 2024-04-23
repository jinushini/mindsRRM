<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	
	jn("tbody tr").dblclick(function(){
		jn(this).find(".details").click();
	})
	
	jn(function(){
		//获取列表行被双击事件
		jn("tbody tr").dblclick(function(){
			jn(this).find(".details").click();
		})
		//当点击“重置”按钮时将查询输入框全部置空
		jn("#reset").click(function(){
			jn("input").val("");
		})
	})
	
</script>
<div class="pageHeader" >
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post" id="searchFrm">
		<div class="searchBar" layoutH="770">
			<table class="edit_table" width="95%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品简号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<select name="data" id="type" style="width:80%;">
							<option value="MCM-R">MCM-R</option>
							<option value="MCM-T" selected>MCM-T</option>
							<option value="MCM-TR">MCM-TR</option>
							<option value="MCM-FS">MCM-FS</option>
						</select>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品代号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品名称：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.name like']" value="<s:property value="paramMap['m.name like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button type="submit" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">封装形式：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<input type="text" name="paramMap['m.packageForm like']" value="<s:property value="paramMap['m.packageForm like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">设计师名称：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.name like']" value="<s:property value="paramMap['m.singleHead.name like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">设计师工号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.staffId like']" value="<s:property value="paramMap['m.singleHead.staffId like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button id="reset" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">重置</span></button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	<div class="panelBar">
		<ul class="toolBar">
			<li><a title="添加角色" href="../fextends/role!showRoleList.action" class="icon" target="dialog" height="680" width="600"><span>添加</span></a></li>
			<li><a title="修改角色" href="../fextends/role!showRoleList.action" class="icon" target="dialog" height="680" width="600"><span>添加</span></a></li>
			<li><a title="删除角色" href="../fextends/role!showRoleList.action" class="icon" target="dialog" height="680" width="600"><span>添加</span></a></li>
			<li><a title="角色" href="../fextends/role!showRoleList.action" class="icon" target="dialog" height="680" width="600"><span>添加</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="145" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="20">序号</th>
					<th width="100">角色名称</th>
					<th width="100">角色顺序(GHz)</th>
					<th width="100">系统标识(GHz)</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<td align="center"><u:index value="#st.index+1"/></td>		
					<td align="center"><s:property value="name"/></td>	
					<td align="center"><s:property value="train"/></td>
					<td align="center"><s:property value="sysCode"/></td>
					<td align="center">
						<a href="../designInfo/Mcm_showMcm_mcm_mcm-detail-show.action?num=<s:property value='id' />"  height="600" width="500" name="look" target="navTab" class="details">查看</a>&nbsp;|&nbsp;
						<a href="###" class="detailModify">编辑</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
