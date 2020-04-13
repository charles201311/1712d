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
<title>今日头条</title>
<link href="/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="/resource/css/index.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/popper.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<style type="text/css">
.ex {
	width: 180px;
	white-space: nowrap; /*不换行的*/
	overflow: hidden; /*超出范围隐藏*/
	text-overflow: ellipsis; /*超出用省略号 */
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 头 -->
		<div class="row" style="height: 44px">
			<div class="col-md-12 bg-dark pt-2">
				<font color="white">下载app</font>
				<div class="float-sm-right">
					<!-- 如果没有登录 -->
					<c:if test="${sessionScope.user==null }">
						<button class="btn btn-link btn-sm text-decoration-none "
							data-toggle="modal" data-target="#exampleModal" onclick="reg()">
							<font color="white">注册</font>
						</button>
						<button class="btn btn-link btn-sm text-decoration-none"
							data-toggle="modal" data-target="#exampleModal" onclick="login()">
							<font color="white">登录</font>
						</button>
					</c:if>
					<!-- 如果登录 -->
					<c:if test="${sessionScope.user!=null }">
						<div class="btn-group dropleft">
							<button type="button" class="btn btn-dark btn-sm dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">${sessionScope.user.username }</button>
							<div class="dropdown-menu">
								<!-- Dropdown menu links -->
								<ul> 
									<li><a href="/my">个人中心</a></li>
									<li><a href="/passport/logout">注销</a></li>
								</ul>
								
							</div>
						</div>


					</c:if>
				</div>
			</div>
		</div>
		<!-- 内容 -->
		<div class="row mt-3">
			<!-- 左 -->
			<div class="col-md-2">
				<ul>
					<li class="mb-2"><a href="/"><img alt=""
							src="/resource/images/logo-index.png" width="108px" height="27px"></a></li>
					<li><a
						class="channel-item ${article.channelId==null? 'active':'' }"
						href="/">热点</a></li>
					<c:forEach items="${channels }" var="channel">
						<li><a
							class="channel-item ${article.channelId==channel.id? 'active':'' }"
							href="/?channelId=${channel.id }">${channel.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 中 -->
			<div class="col-md-7">
				<!-- 栏目为null显示热点文章 广告 -->
				<c:if test="${article.channelId==null }">
					<!--广告  -->
					<div>
						<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<c:forEach items="${slides }" var="s" varStatus="i">
									<li data-target="#carouselExampleCaptions"
										data-slide-to="${i.index }" class="active"></li>
								</c:forEach>
							</ol>
							<div class="carousel-inner">
								<c:forEach items="${slides }" var="s" varStatus="i">
									<div class="carousel-item ${i.count==1?'active':'' }">
										<img style="height: 250px" src="/pic/${s.picture }"
											class="d-block w-100 rounded" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>${s.title }</h5>
											<p></p>
										</div>
									</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleCaptions"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<!-- 热点文章 -->
					<div class="pt-3 section">

						<c:forEach items="${info.list }" var="article">
							<li class="media"><img style="width: 156px; height: 101.8px"
								src="/pic/${article.picture }" class="mr-3 rounded" alt="...">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="/detail?id=${article.id }" target="_blank">${article.title }</a>
									</h5>
									<span class="pt-5 ml-4">${article.user.username } <fmt:formatDate
											value="${article.created }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
								</div></li>
							<hr>
						</c:forEach>
						<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
					</div>
				</c:if>
				<!-- 如果栏目文章不为null显示文章 -->
				<c:if test="${article.channelId!=null }">
					<!-- 文章的分类 -->
					<ul class="subchannel">
						<li
							class="sub-item ${article.categoryId==null? 'sub-selected':'' }"><a
							href="/?channelId=${article.channelId }" style="color: black">全部</a></li>
						<c:forEach items="${categorys }" var="category">
							<li
								class="sub-item ${article.categoryId==category.id? 'sub-selected':'' }"><a
								href="/?channelId=${article.channelId }&categoryId=${category.id}"
								style="color: black">${category.name }</a></li>
						</c:forEach>
					</ul>
					<!-- 栏目 分类下的文章 -->
					<div>
						<c:forEach items="${info.list }" var="article">
							<li class="media"><img style="width: 156px; height: 101.8px"
								src="/pic/${article.picture }" class="mr-3 rounded" alt="...">
								<div class="media-body">
									<h5 class="mt-2 mb-1 ml-4">
										<a href="/detail?id=${article.id }" target="_blank">${article.title }</a>
									</h5>
									<span class="pt-5 ml-4">${article.user.username } <fmt:formatDate
											value="${article.created }" pattern="yyyy-MM-dd HH:mm:ss" />
										 ${article.commentNum}条评论	
											</span>
								</div></li>
							<hr>
						</c:forEach>
						<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
					</div>
				</c:if>
			</div>
			<!-- 右 -->
			<div class="col-md-3">
			  <!-- 最新图片集 -->
			  <div class="card" style="width: 18rem;">
					<div class="card-header">最新图片集</div>
					<div class="card-body">
						<ul class="list-unstyled">
							<c:forEach items="${picArticles.list }" var="article">
								<li class="media"><img style="width: 60px; height: 60px"
									src="/pic/${article.picture }" class="mr-3 rounded" alt="...">
									<div class="media-body ex">
										<a href="/detailPic?id=${article.id }" target="_blank">${article.title }</a>
									</div></li>
								<hr>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 显示最新的5篇文章 -->
				<div class="card" style="width: 18rem;">
					<div class="card-header">最新文章</div>
					<div class="card-body">
						<ul class="list-unstyled">
							<c:forEach items="${lastArticles.list }" var="article">
								<li class="media"><img style="width: 60px; height: 60px"
									src="/pic/${article.picture }" class="mr-3 rounded" alt="...">
									<div class="media-body ex">
										<a href="/detail?id=${article.id }" target="_blank">${article.title }</a>
									</div></li>
								<hr>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 注册 -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<span id="title"></span>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="passport"></div>

			</div>
		</div>
	</div>


</body>





<script type="text/javascript">
	//注册
	function reg() {
		$("#title").text("用户注册");
		$("#passport").load("/passport/reg");
	}
	function login() {
		$("#title").text("用户登录");
		$("#passport").load("/passport/login");
	}

	//分页
	function goPage(pageNum) {
		var channelId = '${article.channelId}';
		var categoryId = '${article.categoryId}';
		var url = "?pageNum=" + pageNum;
		if (channelId != '') {
			url += "&channelId=" + channelId
		}
		if (categoryId != '') {
			url += "&categoryId=" + categoryId;
		}
		location.href = url;
	}
</script>
</html>