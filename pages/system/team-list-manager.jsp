<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
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

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value='page.url'/>" method="post">
	<div class="searchBar">
		<table class="edit_table" width="95%" style="table-layout:fixed;margin:0px;">
			<tr>
				<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">隶属处室：</td>
				<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
					<input type="text" name="paramMap['m.organization.fullName like']" value="<s:property value="paramMap['m.organization.fullName like']"/>" style="width:80%;height:18px;" />
				</td>
				<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">班组名称：</td>
				<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
					<input type="text" name="paramMap['m.name like']" value="<s:property value="paramMap['m.name like']"/>" style="width:80%;height:18px;"/>
				</td>
				<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
					<button type="submit" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">查询</span></button>
				</td>
				<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
					<button id="reset" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">重置</span></button>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../fextends/team!addTeamInput.action" target="navTab" rel=""><span>添加</span></a></li>
			<li><a class="edit" href="../fextends/team!modifyTeamInput.action?num={id}" target="navTab"><span>修改</span></a></li>
			<li><a class="delete" href="../fextends/team!deleteTeam.action?num={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="115">
		<table class="list_table list" width="100%" style="table-layout:fixed;" >
			<thead>
				<tr>
					<!-- <th width="30">序号</th> -->
					<th width="10">编号</th>
					<th width="40">隶属处室</th>
					<th width="30">班组名称</th>
					<th width="30">班组长</th>
					<th width="100">班组成员</th>
					<th width="20">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value='id'/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" title="<s:property value='organization.fullName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value='organization.fullName'/></td>
					<td align="center" title="<s:property value='name'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value='name'/></td>
					<td align="center" title="<s:property value='leadNames'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value="leadNames" /></td>
					<td align="center" title="<s:property value='memberNames'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value="memberNames" /></td>
					<td align="center">
						<a href="../fextends/team!showTeamDetail.action?num=<s:property value='id' />"  height="300" width="500" target="dialog" class="details">查看</a>&nbsp;|&nbsp;
						<a href="../fextends/team!modifyTeamInput.action?num=<s:property value='id' />"  target="navTab">编辑</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<u:juipage></u:juipage>
</div>