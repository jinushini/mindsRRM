<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
	jn("[type=submit]").click(function(){
		for(var i=0;i<jn(".tbody tr").length;i++){
			var $thisTr = jn(".tbody tr").eq(i);
			var $input = $thisTr.find("input");
			
			//input加行号
			for(var j=0;j<$input.length;j++){
				if($input.eq(j).attr("name")!=null){
					$input.eq(j).attr("name", $input.eq(j).attr("name").replace("#index", i));
				}
			}
		}
	})
</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					模型名称：<input type="text" name="paramMap['f.flowDefName like']" value="<s:property value="paramMap['f.flowDefName like']"/>" />
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
	<form method="post" enctype="multipart/form-data" action='../fextends/flowModel!updateFlowModelNodeCoin.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="115">
		<br/>
		<fieldset>
			<legend>小流程模型</legend>
			<table width="98%" class="list_table list" style="margin:5px auto">
				<thead>
					<tr align="center">
						<th width="30%">模型名称</th>
						<th width="50%">模型节点</th>
						<th width="20%">节点金币</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="list" status="st" var="a">
						<s:if test="options!='parent'">
							<tr>
								<td align="center" title="<s:property value="#attr.a.flowDefName"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" rowspan="<s:property value='#attr.a.flowModelNodes.size' />" ><s:property value="flowDefName"/></td>
								<s:iterator value="#attr.a.flowModelNodes" var="b" status="stb">
									<s:if test="#stb.index==0">
										<td align="center">
											<input type="hidden" value="<s:property value='#attr.b.id'/>" name="flowModelNodeVoList[#index].id" />
											<s:property value="#attr.b.nodesName"/>
										</td>
										<td align="center" style="width:20%">
											<input value="<s:property value='#attr.b.nodeCoin'/>" name="flowModelNodeVoList[#index].nodeCoin"/>
										</td>
									</tr>
								</s:if>
								<s:else>
									<tr>
										<td align="center">
											<input type="hidden" value="<s:property value='#attr.b.id'/>"  name="flowModelNodeVoList[#index].id" />
											<s:property value="#attr.b.nodesName"/>
										</td>
										<td align="center" style="width:20%">
											<input value="<s:property value='#attr.b.nodeCoin'/>" name="flowModelNodeVoList[#index].nodeCoin" />
										</td>
									</tr>
								</s:else>
							</s:iterator>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>大流程模型</legend>
			<table width="98%" class="list_table list" style="margin:5px auto">
				<thead>
					<tr>
						<th width="30%">模型名称</th>
						<th width="70%">模型节点</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st" var="a">
						<s:if test="options=='parent'">
							<tr target="id" rel="<s:property value="deploymentId"/>" class="tr">
								<td align="center" title="<s:property value="#attr.a.flowDefName"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="flowDefName"/></td>  						  	
								<td>
									<s:iterator value="#attr.a.flowModelNodes" var="c" status="stc">
										<s:property value="#attr.c.nodesName"/>&nbsp;
										<s:if test="!#stc.last">
											＞&nbsp;
										</s:if>
									</s:iterator>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
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

