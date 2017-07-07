<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
body {
	padding-top: 120px;
	padding-bottom: 40px;
	background-color: #eee;
}

.btn {
	outline: 0;
	border: none;
	border-top: none;
	border-bottom: none;
	border-left: none;
	border-right: none;
	box-shadow: inset 2px -3px rgba(0, 0, 0, 0.15);
}

.btn:focus {
	outline: 0;
	-webkit-outline: 0;
	-moz-outline: 0;
}

.fullscreen_bg {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: 50% 50%;
	background-image:
		url('http://cleancanvas.herokuapp.com/img/backgrounds/color-splash.jpg');
	background-repeat: repeat;
}

.form-signin {
	max-width: 280px;
	padding: 15px;
	margin: 0 auto;
	margin-top: 50px;
}

.form-signin .form-signin-heading, .form-signin {
	margin-bottom: 10px;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: solid;
	border-color: #000;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-color: rgb(0, 0, 0);
	border-top: 1px solid rgba(0, 0, 0, 0.08);
}

.form-signin-heading {
	color: #fff;
	text-align: center;
	text-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
}
</style>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<body>

	<div id="fullscreen_bg" class="fullscreen_bg" />




	<div class="container">
		<form:form method="post" modelAttribute="user"
			action="/SpringMVCHibernateCRUDExample/tryLogin" class="form-signin">
			<h1 class="form-signin-heading text-muted">Giriş</h1>
			<center>
				<c:if test="${user.id==0}">
					<form:hidden path="id" />
					<form:input path="userName" class="form-control"
						placeholder="Kullanıcı Adı" required="" autofocus="" />
					<form:input path="password" type="password" class="form-control"
						placeholder="Şifre" required="" autofocus="" />


					<button class="btn btn-lg btn-primary btn-block" type="submit">
						Giriş Yap</button>
				</c:if>
				<c:if test="${user.id>0}">
					<h1>Aktif Kullanıcı ${user.userName}</h1>
					<a href="<c:url value='/logout' />">Çıkış</a>
				</c:if>

			</center>
		</form:form>

	</div>

</body>
</html>