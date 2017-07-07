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

<!-- ürünler listelenecek..
	stoğunu gör dediğinde altta bir listede stok bilgilerini görecek.
 --> 

<h3>Ürün Listesi</h3>
	<c:if test="${!empty listOfProducts}">
		<table class="tg">
			<tr>
				<th width="50">Id</th>
				<th width="150">ÜrünAdı</th>
				<th width="80">Stok</th>
				<th width="60">Fiyat</th>
				<th width="140">Stok İşlemleri</th>
			</tr>
			
			<c:forEach items="${listOfProducts}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.unitsInStock}   kg</td> 
					<td>${product.price}</td>
					<td><a href="<c:url value='/showStock/${product.id}' />">Stok İşlemlerini Gör</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
<br>
<br>


	<c:if test="${!empty listOfStocks}">
	
	<h3>${listOfStocks[0].product.name} Ürününe Ait Stok İşlemleri</h3>
	
		<table class="tg">
			<tr>
				<th width="130">Tarih</th>
				<th width="150">İşlem</th>
				<th width="150">İşlem Yapan</th>				
				<th width="50">Miktar</th>
			</tr>
			
			<c:forEach items="${listOfStocks}" var="stock">
				<tr>				
					<td>${stock.date}</td>
					<td>${stock.operation}</td>
					<td>${stock.user.userName}</td>
					<td>${stock.stock}   kg</td>	
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>

