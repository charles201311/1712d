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

<title></title>
<link href="/resource/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/popper.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<!-- 头 -->
		<div class="row">
			<div class="col-md-12"
				style="background-color: #563D7C; height: 50px">
				<a href="/"><img alt="" src="/resource/images/logo-my.png"
					style="width: 50px" height="50px"></a> <font color="white">今日头条-个人中心</font>
				<div class="float-sm-right mt-2">
					<div class="btn-group dropleft">
						<button type="button" class="btn btn-light btn-sm dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.user.username }</button>
						<div class="dropdown-menu">
							<!-- Dropdown menu links -->
							<ul>
								<li><a href="/my">个人中心</a></li>
								<li><a href="/passport/logout">注销</a></li>
							</ul>



						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- body -->
		<div class="row" style="height: 550px; padding-top: 5px">
			<!-- 左侧菜单 -->
			<div class="col-md-2 bg-light pt-3 rounded">
				<div class="list-group text-center">
					<a href="#" data="/my/articles"
						class="list-group-item list-group-item-action active"> 我的文章</a> <a
						href="#" data="/my/publish"
						class="list-group-item list-group-item-action">发布文章</a> <a
						href="#" data="/my/collects" class="list-group-item list-group-item-action">我的收藏</a> <a
						href="#" class="list-group-item list-group-item-action">我的评论</a> <a
						href="#" data="/my/publishpic" class="list-group-item list-group-item-action"
						tabindex="-1" aria-disabled="true">发布图片</a>
				</div>

			</div>
			<!-- 内容显示区域 -->
			<div class="col-md-10 pt-3" id="center">

				<!-- 隐藏 -->
				<div style="display: none">
					<!-- 包含kindeditor的内容-->
					<jsp:include page="/resource/kindeditor/jsp/demo.jsp" />

				</div>



			</div>

		</div>

	</div>


</body>
<script type="text/javascript">
 //为菜单添加绑定点击事件
 $(function(){
	 
	//默认在中间区域加载我的文章 
	 $("#center").load("/my/articles");
	 
	$("a").click(function(){
		//获取a标签的url
		var url =$(this).attr("data");
	     //先把所有菜单选中样式去除
	     $("a").removeClass("active");
	     //为当前点击的菜单添加选中的样式
	     $(this).addClass("active");
		//在中间区域加载url
		$("#center").load(url);
	}) 
	 
	 
 })


</script>
</html>