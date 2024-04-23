<form action="${parameters.url}" id="_${parameters.pageName}_page_frm" method="post">
	<input type="hidden" name="${parameters.pageName}.pageNo" id="_${parameters.pageName}pageNo" value="${parameters.pageNo.toString()}">
	${parameters.params}
	<table border="0" cellpadding="0" cellspacing="0" class="page-table" align="right">
		<tr>
			<td>
				<#if parameters.table?if_exists!="">
					<a href="###" id="_${parameters.pageName}_show_columns_select">列</a>
				</#if>
				<input type="hidden" name="${parameters.pageName}.pageAccess" value="true" />
				第 ${parameters.pageNo}页/共${parameters.totalPage}页 (共${parameters.count} 条记录) &nbsp;
				<a href="###" onclick="_${parameters.pageName}_firstPage();">首页</a>
				<a href="###" onclick="_${parameters.pageName}_prePage();">上一页</a>
				<a href="###" onclick="_${parameters.pageName}_nextPage();">下一页</a>
				<a href="###" onclick="_${parameters.pageName}_lastPage();">尾页</a>
				<input id="_${parameters.pageName}_input_pageNo" value="${parameters.pageNo.toString()}" type="text" size="1"><input value="转到" type="button" onclick="_${parameters.pageName}_goto();">
				<span <#if parameters.showPageSize=="false">style="display:none;"</#if>>每页显示
					<select id="_${parameters.pageName}pageSize" onchange="_${parameters.pageName}_changePageSize();" name="${parameters.pageName}.pageSize">
						<option value='10'>10</option>
						<option value='15' selected >15</option>
						<option value='20'>20</option>
						<option value='25'>25</option>
						<option value='30'>30</option>
						<option value='50'>50</option>
						<option value='100'>100</option>
						<option value='500'>500</option>
					</select></span>
			</td>
		</tr>
	</table>
</form>
<style type="text/css">
	#page_columns{
		position:absolute;
		border:1px solid #333;
		background:#f7f5d1;
		padding:1px;
		color:#333;
		width:300px;
		display:none;
	}
</style>

<script type="text/javascript">
	var _${parameters.pageName}_pageNo=parseInt(_getObj("_${parameters.pageName}pageNo").value);
	var _${parameters.pageName}_pageNoObj=_getObj("_${parameters.pageName}pageNo");
	var _${parameters.pageName}_totalPage=${parameters.totalPage.toString()};
	var _${parameters.pageName}_pageSize=${parameters.pageSize.toString()};
	var _${parameters.pageName}_pageSizeObj=_getObj("_${parameters.pageName}pageSize");
	var i;
	
	for(i=0;i<_${parameters.pageName}_pageSizeObj.options.length;i++){
		if(_${parameters.pageName}_pageSize==_${parameters.pageName}_pageSizeObj.options[i].value){
			_${parameters.pageName}_pageSizeObj.selectedIndex=i;
			break;
		}
	}
	
	function _getObj(objId){
		return window.document.getElementById(objId);
	}
	function _${parameters.pageName}_getDataOfPageNo(pageNo){
		_${parameters.pageName}_pageNoObj.value=pageNo;
		_getObj("_${parameters.pageName}_page_frm").submit();
	}
	function _${parameters.pageName}_firstPage(){
		_${parameters.pageName}_getDataOfPageNo(1);
	}
	function _${parameters.pageName}_prePage(){
		if(_${parameters.pageName}_pageNo-1>=1)
			_${parameters.pageName}_getDataOfPageNo(_${parameters.pageName}_pageNo-1);
		else
			alert("这是第一页")
	}
	function _${parameters.pageName}_nextPage(){
		
		if(_${parameters.pageName}_pageNo+1<=_${parameters.pageName}_totalPage)
			_${parameters.pageName}_getDataOfPageNo(_${parameters.pageName}_pageNo+1);
		else
			alert("这是最后一页")
	}
	function _${parameters.pageName}_lastPage(){
		_${parameters.pageName}_getDataOfPageNo(_${parameters.pageName}_totalPage);
	}
	function _${parameters.pageName}_goto(){
		var _input_pageNo_value=_getObj("_${parameters.pageName}_input_pageNo").value;
		if(_input_pageNo_value<=_${parameters.pageName}_totalPage&&_${parameters.pageName}_totalPage>=1)
			_${parameters.pageName}_getDataOfPageNo(_input_pageNo_value);
		else
			alert("不存在此页");
	}
	function _${parameters.pageName}_changePageSize(){
		_getObj("_${parameters.pageName}_page_frm").submit();
	}
	
	<#if parameters.table?if_exists!="">
		var _table="#${parameters.table}";
		var _hide_indexes=',${parameters.hideIndexes?default("")}';
		var _page_aceess=${parameters.pageAccess};
		
		$(function(){
		
			$(document).ready(function(){
				//alert($("[colspan]",_table).length);
			
				//得到url地址
				url=window.location.href
				url=url.substring(url.lastIndexOf("/")+1,url.indexOf(".")).replace("!","");
				
				//初始化
				if($.cookies.get(url)==null){
					if(_hide_indexes.length>1&&!_page_aceess)
						$.cookies.set(url,_hide_indexes);
				}
				
				//得到此页面对应的cookie值（以“,”分割）
				var indexes=$.cookies.get(url);
				if(indexes==null)
					return;
				//
				var index=indexes.split(",");
				var i=1;
				for(i;i<index.length;i++){
					$("td:eq("+index[i]+"),th:eq("+index[i]+")",_table+" tr").hide();
				}
			});
			
			//列选择 按钮的事件
			$("#_show_columns_select").click(function(e){
				
				if($("#page_columns").length==0){
					//得到thead中的所有th
					var _th_objs=$("thead th",_table);
					
					if(_th_objs.eq(0).attr("title")==""){
						alert('请设置标题<th>的"title"属性！');
						return;
					};
					
					//添加列选择的DIV
					$("body").append(get__page_columns_select_div(_th_objs));
					
					//为列选择的DIV添加事件
					$("#page_columns").mouseout(function(){
						$("#page_columns").hide();
					}).mouseover(function(){
						$("#page_columns").show();
					})
					
					//为列选择的DIV中的checkbox添加事件
					$("input","#page_columns").click(function(){
						
						var index=$(this).val();
						if(!$(this).attr("checked")){
							$("td:eq("+index+"),th:eq("+index+")",_table+" tr").hide();
							save_table_index(index);
						}else{
							$("td:eq("+index+"),th:eq("+index+")",_table+" tr").show();
							del_table_index(index);
						}
					});
				}
				
				//初始化DIV
				_init_div();
				//显示列选择DIV
				$("#page_columns").css({
								"top":e.pageY-20,
								"left":e.pageX-20
							}).show();
				
			});
			
			function save_table_index(index){
				url=window.location.href
				url=url.substring(url.lastIndexOf("/")+1,url.indexOf(".")).replace("!","");
				
				var indexes=$.cookies.get(url);
				indexes=indexes==null?"":indexes;
				$.cookies.set(url,indexes+","+index);
				
			}
			function del_table_index(index){
				url=window.location.href
				url=url.substring(url.lastIndexOf("/")+1,url.indexOf(".")).replace("!","");
				
				var indexes=$.cookies.get(url);
				indexes=indexes==null?"":indexes;
				indexes=indexes.replace(","+index,"");
				$.cookies.set(url,indexes);
			}
			
			function _init_div(){
				//得到url地址
				url=window.location.href
				url=url.substring(url.lastIndexOf("/")+1,url.indexOf(".")).replace("!","");
				
				//得到此页面对应的cookie值（以“,”分割）
				var indexes=$.cookies.get(url);
				indexes=indexes==null?"":indexes;
				
				//
				var _checkBoxes=$("input","#page_columns");
				var i=0;
				for(i;i<_checkBoxes.length;i++){
					if(indexes.indexOf(_checkBoxes.eq(i).val())!=-1)
						_checkBoxes.eq(i).attr("checked",false);
				}
			}
		});
		//创建DIV
		function get__page_columns_select_div(_th_objs){
			var __page_columns_select_div='<div id="page_columns"><table class="page-table">';
			
			for(i=0;i<_th_objs.length;i++){
				if(i%3==0&&i!=0){
					__page_columns_select_div=__page_columns_select_div+"</tr>"
				}
				if(i%3==0){
					__page_columns_select_div=__page_columns_select_div+"<tr>"
				}
				__page_columns_select_div=__page_columns_select_div+"<td><input type='checkbox' checked value='"+i+"'/>"+_th_objs.eq(i).attr("title")+"</td>"
			}
			
			__page_columns_select_div=__page_columns_select_div+"</table></div>";
			return __page_columns_select_div;
		}
	</#if>
</script>