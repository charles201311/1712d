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
<title>今日头条-管理员中心</title>
<link href="/resource/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>



</head>
<body>

	<div class="container-fluid">

		<div class="row bg-dark">
			<div class="col-md-12" style="height: 50px">
				<img alt="" class="rounded-circle"
					src="/resource/images/logo-admin.jpg"
					style="width: 111px; height: 44px"> <font color="white">管理员中心</font>
			</div>


		</div>
		<div class="row mt-1">

			<div class="col-md-2 bg-light rounded " style="height: 550px">
				<div class="list-group mt-2 text-center">
					<a href="#" data="/admin/articles" class="list-group-item list-group-item-action active">
						审核文章 </a> <a href="#" data="/admin/users"  class="list-group-item list-group-item-action">管理用户</a>
					<a href="#" class="list-group-item list-group-item-action">管理栏目</a>
					<a href="#" class="list-group-item list-group-item-action">系统设置</a>
				</div>
			</div>

			<div class="col-md-10" id="center">中间</div>

		</div>




	</div>



</body>

<script type="text/javascript">
	//为菜单添加绑定点击事件
	$(function() {

		//默认在中间区域加载我的文章 
		$("#center").load("/admin/articles");

		$("a").click(function() {
			//获取a标签的url
			var url = $(this).attr("data");
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