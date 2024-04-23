<form id="pagerForm" method="post" action="${parameters.url}">
	<input type="hidden" name="pageNum" value="${parameters.pageNo}" />
	<input type="hidden" name="numPerPage" value="${parameters.pageSize}" />
	<input type="hidden" name="status" value="">
	<input type="hidden" name="orderField" value="" />
	${parameters.params}
</form>
<div class="panelBar">
	<div class="pages">
		<span>显示</span>
		<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
			<option value="2">2</option>
			<option value="20">20</option>
			<option value="25">25</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="200">200</option>
		</select>
		<span>条，共${(parameters.count).toString()}条，${parameters.totalPage}页</span>
	</div>

	<div class="pagination" targetType="dialog" totalCount="${parameters.count}" numPerPage="${parameters.pageSize}" pageNumShown="0" currentPage="${parameters.pageNo}"></div>

</div>
<script type="text/javascript">
	$(function(){
		$(".pages select",$.pdialog.getCurrent()).val('${parameters.pageSize}');
	})
</script>









