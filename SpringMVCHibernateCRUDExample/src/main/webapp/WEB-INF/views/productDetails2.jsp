<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style>
.blue-button {
	background: #25A6E1;
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',
		endColorstr='#188BC0', GradientType=0);
	padding: 3px 5px;
	color: #fff;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 4px;
	border: 1px solid #1A87B9
}

table {
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	width: 50%;
}

th {
	background: SteelBlue;
	color: white;
}

td, th {
	border: 1px solid gray;
	width: 25%;
	text-align: left;
	padding: 5px 10px;
}
</style>
</head>
<body>

			<form:form method="post" modelAttribute="product"
				action="/SpringMVCHibernateCRUDExample/addProduct">
				<table>
					<tr>
						<th colspan="2">Urun Ekle</th>
					</tr>
					<tr>
						<form:hidden path="id" />
						<td><form:label path="name">Ad:</form:label></td>
						<td><form:input path="name" size="30" maxlength="30"></form:input></td>
					</tr>
					<tr>
						<td><form:label path="price">Fiyat:</form:label></td>
						<td><form:input path="price"></form:input></td>
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
						<th width="80">Id</th>
						<th width="120">Ad</th>
						<th width="120">Stok Miktari</th>
						<th width="120">Fiyat</th>
						<th width="60">Duzenle</th>
						<th width="60">Sil</th>
					</tr>
					<c:forEach items="${listOfProducts}" var="product">
						<tr>
							<td>${product.id}</td>
							<td>${product.name}</td>
							<td>${product.unitsInStock}</td>
							<td>${product.price}</td>
							<td><a href="<c:url value='/updateProduct/${product.id}' />">Duzenle</a></td>
							<td><a href="<c:url value='/deleteProduct/${product.id}' />">Sil</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>


</body>
</html>
