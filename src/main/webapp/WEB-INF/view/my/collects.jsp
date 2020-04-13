<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 视窗 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>收藏列表</title>
</head>
<body>

	<div class="container">

		<h1 class="text-info">我的收藏夹</h1>
		<hr>
		<ul>
			<c:forEach items="${info.list}" var="collect">
				<li>${collect.text }</li>
				<li>时间： <fmt:formatDate value="${collect.created }"
						pattern="yyyy-MM-dd HH:mm:ss" />
					<button class="btn btn-warning" onclick="unCollect(${collect.id})">删除</button></li>
				<hr>
			</c:forEach>
		</ul>
		<!-- 引入分页 -->
		<jsp:include page="/WEB-INF/view/common/pages.jsp" />

	</div>


</body>
<script type="text/javascript">
//取消收藏
  function unCollect(id){
	
	$.post("/my/unCollect",{id:id},function(flag){
		if(flag){
			//alert("取消收藏成功")
			$("#center").load("/my/collects");
		}
	})
	  
  }

function goPage(page){
	 //在中间区域加载分页
	$("#center").load("/my/collects?page="+page);
}


</script>
</html>