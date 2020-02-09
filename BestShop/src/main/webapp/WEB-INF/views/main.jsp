<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
	<title>Beautycloset</title>
	<link rel="stylesheet" href="./css/bootstrap.css">
	
	<style type="text/css">
	.jumbotron {
		background-image: url('./jpg/flower.jpg');
		background-size: cover;
		text-shadow: black 0.2px 0.2px 0.2px;
		color: blue;
		font-weight: bold;
		opacity: 0.5;
		filter: alpha(opacity = 50);
	}
	.logo {
		font-family: 'Segoe Print';
		font-size: 100px;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	* a {
		text-decoration: none;
		color: black;
	}
	
	</style>

</head>
<body>

	<script>
		var msg = "${msg}";
		if (msg === "Deleted") {
			alert("회원탈퇴가 완료되었습니다.");
		}
	</script>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="">Home</a></li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="user/login">Login</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="user/logout">Logout</a>
				</sec:authorize>
			</li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="user/join">Join</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="user/mypage">Mypage</a>
				</sec:authorize>
			</li>

		</ul>
		<form class="form-inline" action="<% request.getContextPath(); %>/product/search" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input class="form-control mr-sm-2"	type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</nav>
	<div class="container">
		<div class="logo">
			<h1 class="text-center">
				<a href="">Beautycloset</a>
			</h1>
		</div>
	</div>
	
	<div class="container-fluid">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" href="top">Top</a></li>
			<li class="nav-item"><a class="nav-link" href="bottom">Bottom</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="bag">Bags &
					Shoes</a></li>
			<li class="nav-item"><a class="nav-link" href="Accesorie">Accesories</a>
			</li>
		</ul>
		</nav>

		<br> <br>
		<c:if test="${product eq null }">
			<div class="container-fluid">
				<video muted autoplay loop controls width=100%>
					<source src="./video/Woman.mp4" type="video/mp4">
				</video>
			</div>
		</c:if>

		<c:if test="${product ne null }">
			<div class="row" align=center>
				<c:forEach var="item" items="${product}">
					<div class="col-md-3">
						<a href="productDetail?id=${item.id }">
							<img class="img" width="175" height="250" src='data:image/jpg;base64,${ item.image_thumbnail }' alt="${ item.name }">
						</a>
						<a href="productDetail?id=${item.id }"><p>${ item.name }</p>
								<p>${ item.price }</p> 
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<br> <br>
		<c:if test="${product eq null && products ne null }">
			<br>
			<div class="row" align=center>
				<c:forEach var="item" items="${products}">
					<div class="col-md-3">
						<a href="productDetail?id=${item.id }">
							<img class="img" width="175" height="250" src='data:image/jpg;base64,${ item.image_thumbnail }' alt="${ item.name }">
						</a>
						<a href="productDetail?id=${item.id }"><p>${ item.name }</p>
								<p>${ item.price }</p> 
						</a>
					</div>
				</c:forEach>
				<br>
			</div>
		</c:if>
		<br> <br> <br>

		<footer style="background-color: #000000; color: #FFFFFF">
			<div class="container">
				<br>
				<div class="row">
					<div class="col col-lg-6"
						style="border: 1px solid black; text-align: left; font-family: 'ariel'">
						Copyright &copy; 2020<br>KITRI침해대응20기우리조가짱이조<br>All
						rights reserved
					</div>
					<div class="col-md auto"
						style="border: 1px solid black; text-align: left; font-family: 'ariel'">
						Contact Us<br>tel : 010-4022-3241<br>e-mail :
						wsm91@naver.com
					</div>
				</div>
			</div>
		</footer>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="../js/bootstrap.js"></script>
</body>
</html>