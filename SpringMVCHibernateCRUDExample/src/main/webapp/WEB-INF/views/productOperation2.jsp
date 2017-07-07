<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


			<!-- stok için hangi işlemi yaparken bilgi verme amaçlı -->
			<h2>${information}</h2>
			<h1>${activeUserName}
				kullanıcısı
				</h2>

				<form:form method="post" modelAttribute="pStock"
					action="/SpringMVCHibernateCRUDExample/addStock">
					<table>
						<tr>
							<th colspan="2">Stok</th>
						</tr>
						<tr>
							<form:hidden path="id" />
							<form:hidden path="productId" />
							<form:hidden path="operationType" />
							<td><form:label path="quantity">Adet:</form:label></td>
							<td><form:input path="quantity" size="30" maxlength="30"></form:input></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" class="blue-button" /></td>
						</tr>
					</table>
				</form:form>
				</br>
				<h3>Urun Listesi</h3>
				<c:if test="${!empty listOfProducts}">
					<table class="tg">
						<tr>
							<th width="30">Id</th>
							<th width="120">Ad</th>
							<th width="100">Stok Miktari</th>
							<th width="50">Fiyat</th>
							<th width="80">Stok Girişi</th>
							<th width="80">Stok Çıkışı</th>
						</tr>
						<c:forEach items="${listOfProducts}" var="product">
							<tr>
								<td>${product.id}</td>
								<td>${product.name}</td>
								<td>${product.unitsInStock}kg</td>
								<td>${product.price}</td>
								<td><a href="<c:url value='/entryStock/${product.id}' />">Stok
										Gir</a></td>
								<td><a href="<c:url value='/exitStock/${product.id}' />">Stok
										Çıkar </a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>


</body>
</html>