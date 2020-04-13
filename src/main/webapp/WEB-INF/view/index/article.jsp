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
<meta name="keywords" content="${article.keywords}" />
<meta name="description" content="${article.original}" />

<title>${article.title }</title>
<link href="/resource/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<!-- 头 -->
		<div class="row" style="height: 44px">
			<div class="col-md-12 bg-dark pt-2">
				<font color="white">下载APP</font>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<!-- 文章详情 -->
			<div class="col-md-7">
				<H3>${article.title }</H3>
				<p>${article.user.username}
					<fmt:formatDate value="${article.created}"
						pattern="yyyy-MM-dd HH:mm:ss " />
				</p>
				${article.content}
				<hr>
				<div align="right">

					<c:if test="${isCollect==0 || isCollect==null}">
						<a href="javascript:collect()">☆ 收藏</a>
					</c:if>
					<c:if test="${isCollect==1}">
						<span class="text-danger">★ 已收藏</span>
					</c:if>
				</div>

				<!-- 增加评论 -->
				<c:if test="${null!=sessionScope.user}">
					<div>
						输入评论：
						<textarea rows="8" cols="110" name="content"></textarea>
						<br>

						<button class="btn btn-info" onclick="addComment()">提交评论</button>
					</div>
				</c:if>
				<hr>
				<!-- 显示评论 -->
				<div>
					<c:forEach items="${info.list}" var="comment">
				   ${comment.user.username }  <fmt:formatDate
							value="${comment.created}" pattern="yyyy-MM-dd HH:mm:ss" />
						<br>
						<p class="mt-3">${comment.content }</p>
						<hr>
					</c:forEach>


				</div>
			</div>
			<!-- 右侧 -->
			<div class="col-md-3"></div>

		</div>

	</div>

</body>
<script type="text/javascript">
	//增加评论
	function addComment() {
		var content = $("[name='content']").val();
		var articleId = '${article.id}';
		$.post("/addComment", {
			content : content,
			articleId : articleId
		}, function(flag) {
			if (flag) {
				alert("评论成功");
				window.location.reload();
			} else {
				alert("评论失败。请登录后重试")
			}
		})
	}

	//收藏
	function collect() {
		var text = '${article.title}';//获取文章标题
		var url = window.location.href;//获取文章的url

		$.post("/collect", {
			text : text,
			url : url
		}, function(flag) {
			if (flag) {
				alert("收藏成功");
				window.location.reload();
			} else {
				alert("收藏失败，请登录后再试")
			}
		})
	}
</script>
</html>