<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--

//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value='page.url'/>" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					登录名：<input type="text" name="paramMap['u.loginName like']" value="<s:property value="paramMap['u.loginName like']"/>" />
				</td>
				<td>
					用户名：<input type="text" name="paramMap['u.name like']" value="<s:property value="paramMap['u.name like']"/>" />
				</td>
				<td>
					所在部门：<input type="text" name="paramMap['u.organization.fullName like']" value="<s:property value="paramMap['u.organization.fullName like']"/>" />
				</td>
			</tr>
			
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../fextends/user!inputAdd.action" target="navTab" rel=""><span>添加</span></a></li>
			<li><a class="edit" href="../fextends/user!inputAdd.action?userId={id}" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../fextends/user!deleteUser.action?userId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="../fextends/role!findAllRole.action?userId={id}" target="navTab" rel="currentNavTab"><span>设置角色</span></a></li>
		</ul>
	</div>
	<div layoutH="115">
		<table class="list_table list" width="100%" style="table-layout:fixed;" >
			<thead>
				<tr>
					<!-- <th width="30">序号</th> -->
					<th width="40">编号</th>
					<th width="80">登录名</th>
					<th width="100">用户名</th>
					<th width="80">工号</th>
					<th width="200">角色</th>
					<th width="200">部门</th>
					<th width="80">职务</th>
					<th width="80">职称</th>
					<th width="200">擅长领域</th>
					<th width="80">用户类型</th>	
					<th width="80">工作负荷值</th>
					<th width="90">工作难度系数</th>
					<th width="80">收益值</th>
					<th width="80">经验值</th>					
					<th width="80">专业素养值</th>				
					<th width="80">威望值</th>
					<th width="200">个性签名 </th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value='id'/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<%-- <td align="center"><s:property value='id'/></td> --%>
					<td align="center" title="<s:property value='loginName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value='loginName'/></td>
					<td align="center" title="<s:property value='name'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value='name'/></td>
					<td align="center"><s:property value='staffId'/></td>
					<td align="center" title="<s:iterator value='roles'><s:property value='name'/>;</s:iterator>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:iterator value="roles" status="r"><s:property value='name'/>;</s:iterator></td>
					<td align="left" title="<s:property value='organization.fullName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ><s:property value='organization.fullName'/></td>
					<td align="center"><s:property value='duty'/></td>
					<td align="center"><s:property value='position'/></td>
					<td align="center" title="<s:property value='skilledField'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='skilledField'/></td>
					<td align="center"><s:property value='sysCode'/></td>	
					<td align="center"><s:property value='workLoad'/></td>
					<td align="center"><s:property value='difficult_degree'/></td>
					<td align="center"><s:property value='gainVal'/></td>
					<td align="center"><s:property value='expVal'/></td>
					<td align="center"><s:property value='professionVal'/></td>
					<td align="center"><s:property value='prestigeVal'/></td>
					<td align="center" title="<s:property value='signature'/>" style="padding-left:6px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='signature'/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<u:juipage></u:juipage>
</div>