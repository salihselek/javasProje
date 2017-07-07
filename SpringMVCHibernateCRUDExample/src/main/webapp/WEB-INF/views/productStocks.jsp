<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="shared/header.jsp" />
<jsp:include page="shared/aside.jsp" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Ürün Stok Bilgileri <small></small>
		</h1>
			<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Stok</a></li>
			<li class="active">Görüntüleme</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Ürünler</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">

				<form:form action="/SpringMVCHibernateCRUDExample/showStock"
					method="post" modelAttribute="prd">
					<div class="input-group">
						<select class="form-control" id="id" name="id" onchange="submit()">
							<option value="0">Ürün Seçiniz.</option>
							<c:forEach items="${listOfProducts}" var="product">
								<option value="${product.id}">${product.id}-
									${product.name} - ${product.unitsInStock} kg</option>
							</c:forEach>
						</select>
					</div>

				</form:form>

			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->


		<div class="row">
			<div class="col-xs-12">

				<!-- .box stok bilgileri için -->

				<c:if test="${!empty listOfStocks}">

					<div class="box">
						<div class="box-header">
							<h3 class="box-title">${stockOfProductInformation}</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Tarih</th>
										<th>İşlem</th>
										<th>İşlem Yapan</th>
										<th>Miktar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listOfStocks}" var="stock">
										<tr>

											<td>${stock.date}</td>
											<td>${stock.operation}</td>
											<td>${stock.user.userName}</td>
											<td>${stock.stock}kg</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th>Tarih</th>
										<th>İşlem</th>
										<th>İşlem Yapan</th>
										<th>Miktar</th>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

				</c:if>

			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script>
	$(function() {
		$('#example1').DataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true
		})
	});
</script>

<!-- page script -->

<jsp:include page="shared/footer.jsp" />