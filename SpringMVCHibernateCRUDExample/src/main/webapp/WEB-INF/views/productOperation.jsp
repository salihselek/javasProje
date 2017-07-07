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
			Stok İşlemleri <small>Giriş ve Çıkış</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Stok</a></li>
			<li class="active">Giriş Çıkış</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- ürün giriş ve çıkışı için -->
		<div class="modal fade" id="modal-default">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							<label id="information">İşlem</label>
						</h4>
					</div>
					<div class="modal-body">

						<!-- copyy -->
						<div class="box box-warning">

							<div class="box-body">
								<form:form role="form" method="post" modelAttribute="pStock"
									action="/SpringMVCHibernateCRUDExample/addStock">
									<!-- text input -->
									<div class="form-group">

										<form:hidden path="id" id="id" />
										<form:hidden path="productId" id="productId" />
										<form:hidden path="operationType" />
										<label>Adet</label>
										<form:input type="text" class="form-control"
											placeholder="Ürün Adedi ..." path="quantity" size="30"
											id="quantity" />
									</div>

									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Gönder" />
									</div>
								</form:form>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- copyy -->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->





		<div class="row">
			<div class="col-xs-12">

				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Ürünler</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Id</th>
									<th>Ad</th>
									<th>Stok Miktari</th>
									<th>Fiyat</th>
									<th>Stok Girişi</th>
									<th>Stok Çıkışı</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listOfProducts}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.name}</td>
										<td>${product.unitsInStock}</td>
										<td>${product.price}</td>

										<td><input type="button"
											class="btn btn-success  entryStock" data-id="${product.id}"
											value="Stok Girişi" onclick="operationStockClick(this,1)"></td>

										<td><input type="button"
											class="btn btn-danger  exitStock" data-id="${product.id}"
											value="Stok Çıkışı" onclick="operationStockClick(this,2)"></td>
									</tr>
								</c:forEach>

							</tbody>
							<tfoot>
								<tr>
									<th>Id</th>
									<th>Ad</th>
									<th>Stok Miktarı</th>
									<th>Fiyat</th>
									<th>Düzenle</th>
									<th>Sil</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- page script -->



<style>
.entryStock(
)
.exitStock(
)
</style>

<script type="text/javascript">
	function operationStockClick(identifier, operationType) {
		$("#modal-default").modal("show");

		var productId = $(identifier).data("id");

		$("#productId").val(productId);
		$("#operationType").val(operationType);
		if (operationType == 1) {
			$("#information").text('Ürün Girişi');
		} else if (operationType == 2) {
			$("#information").text('Ürün Çıkışı');
		}
		// action="/SpringMVCHibernateCRUDExample/addStock"	
	};
</script>

<!-- page script -->


<jsp:include page="shared/footer.jsp" />