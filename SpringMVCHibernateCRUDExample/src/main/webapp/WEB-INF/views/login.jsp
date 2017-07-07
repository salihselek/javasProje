<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="<c:url value="/template/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value="/template/bower_components/font-awesome/css/font-awesome.min.css"/>">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<c:url value="/template/bower_components/Ionicons/css/ionicons.min.css"/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/template/dist/css/AdminLTE.min.css"/>">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value="/template/plugins/iCheck/square/blue.css"/>">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<c:if test="${user.id==0}">
			<div class="login-box-body">
				<p class="login-box-msg">Lütfen Giriş Yapın</p>
				<form:form action="/SpringMVCHibernateCRUDExample/tryLogin"
					method="post" modelAttribute="user">

					<div class="form-group has-feedback">
						<form:input path="userName" class="form-control"
							placeholder="Kullanıcı Adı" />
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">

						<form:input type="password" path="password" class="form-control"
							placeholder="Şifre" />
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-xs-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox"> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-xs-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">Giriş</button>
						</div>
						<!-- /.col -->
					</div>


				</form:form>


			</div>


			<!-- /.login-box-body -->


		</c:if>
		<c:if test="${user.id>0}">
			<center>
				<h1>Aktif Kullanıcı</h1>
				<br>
				<h1>${user.userName}</h1>
				<h1>
					<a href="<c:url value='/logout' />">Çıkış</a>
				</h1>
				<br>
				<h1>
					<a href="<c:url value='/dashboard' />">Anasayfa</a>
				</h1>
			</center>
		</c:if>
	</div>


	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script
		src="<c:url value="/template/bower_components/jquery/dist/jquery.min.js"/>"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="<c:url value="/template/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
	<!-- iCheck -->
	<script src="<c:url value="/template/plugins/iCheck/icheck.min.js"/>"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
