<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	function getRowObj(obj){
		var i = 0;
		while(obj.tagName.toLowerCase()!= "tr"){
			obj = obj.parentNode;
			if(obj.tagName.toLowerCase()=="table")
				return null;
		}
		return obj;
	}
	jn("[name=look]").click(function(){
		var $trObj = $(getRowObj(this));	
		$trObj.addClass("selected");
		var options={};
		 options.width = 600;
		 options.height = 500;
		var url="../inform/message!displayMsg.action?msgId="+$trObj.attr("rel")+"&flag=2";
		$.pdialog.open(url, "new_msg", "查看全部消息", options);
	}); 
</script>
<div class="pageHeader">
<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						发件人：<input type="text" name="paramMap['m.sendUser.name like']" value="<s:property value="paramMap['m.sendUser.name like']"/>" />
						标题：<input type="text" name="paramMap['m.title like']" value="<s:property value="paramMap['m.title like']"/>" />
						内容：<input type="text" name="paramMap['m.content like']" value="<s:property value="paramMap['m.content like']"/>" />
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a title="确定要删除吗?" target="selectedTodo" rel="ids"  href="../inform/message!deleteMsg.action" class="delete"><span>批量删除</span></a></li>
		</ul>
	</div>
	<div >
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="17"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="100">发件人</th>
					<th width="120">发件时间</th>
					<th width="150">标题</th>
					<th width="400">内容</th>
					<th width="40">状态</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">			
					<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="sendUser.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="createDate" format="yyyy-MM-dd HH:mm"/></td>
					<td align="center" title="<s:property value="title"/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="title"/></td>
					<td align="left" title="<s:property value="contentStr" escape="false"/>" style="word-break:break-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="contentStr" escape="false"/></td>
					<td align="center" id="replyStatus" <s:if test="replyStatus == 0">style="color:red;" </s:if><s:else>style="color:green"</s:else>>
						<s:property value="replyStatus == 0 ? '未读' : '已读'"/>
					</td>
					<td align="center"><a href="###" height="450" width="400" name="look">查看</a></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
