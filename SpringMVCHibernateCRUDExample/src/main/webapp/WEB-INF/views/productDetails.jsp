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
			Ürün İşlemleri <small></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-laptop"></i> Ürün</a></li>
			<li class="active">Giriş Çıkış</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box-body">
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target="#modal-default">Yeni Ürün Ekle</button>
		</div>

		<!-- ürün silme modal  sil butonuna basıldığında açılır -->
		<div class="modal modal-danger fade" id="modal-danger">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Danger Modal</h4>
					</div>
					<div class="modal-body">
						<p>One fine body&hellip;</p>

						<p>
							<label id="deleteProductInformation"></label>
						</p>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline pull-left"
							data-dismiss="modal">Close</button>

						<a id="deleteLink" href="#" class="btn btn-outline">Sil</a>

						<!-- 
						<button type="button" class="btn btn-outline">Sil</button> -->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!-- ürün ekleme ve düzenleme modalı  yeni ürün yada düzenle butonuna basıldığında açılır -->
		<div class="modal fade" id="modal-default">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Yeni Ürün</h4>
					</div>
					<div class="modal-body">

						<!-- copyy -->
						<div class="box box-warning">

							<div class="box-body">

								<form:form role="form" method="post" modelAttribute="product"
									action="/SpringMVCHibernateCRUDExample/addProduct">
									<!-- text input -->
									<div class="form-group">

										<form:hidden path="id" id="productId" />
										<form:hidden path="unitsInStock" id="productStock" />
										<label>Ad</label>
										<form:input type="text" class="form-control"
											placeholder="Ürün Adı ..." path="name" size="30"
											id="productName" />
									</div>
									<div class="form-group">
										<label>Fiyat</label>
										<form:input path="price" type="text" class="form-control"
											placeholder="Fiyat ..." id="productPrice" />
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
									<th>Stok Miktarı</th>
									<th>Fiyat</th>
									<th>Düzenle</th>
									<th>Sil</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listOfProducts}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.name}</td>
										<td>${product.unitsInStock}</td>
										<td>${product.price}</td>
										<!-- 
										<td><a
											href="<c:url value='/updateProduct/${product.id}' />">Düzenle</a></td>
 
 <c:url value='/updateProduct/${product.id}' />
 
 -->
										<td><input type="button"
											class="btn btn-success  updateProduct"
											data-id="${product.id}" data-price="${product.price}"
											data-stock="${product.unitsInStock}"
											data-name="${product.name}" value="Düzenle"
											onclick="updateClick(this)"></td>

										<td><input type="button"
											class="btn btn-danger  deleteProduct" data-id="${product.id}"
											data-name="${product.name}" value="Sil"
											onclick="deleteClick(this)"></td>
										<!--  
										<td><a href="<c:url value='/deleteProduct/${product.id}' />">Sil</a></td>
									-->
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


<style>
.updateProduct












(
)
.deleteProduct












(
)
</style>

<script type="text/javascript">
	function updateClick(identifier) {
		$("#modal-default").modal("show");
		
		materialStockEntryHolder = $(identifier);
		var id = $(identifier).attr("data-id");
		var price = $(identifier).data("price");
		var stock = $(identifier).data("stock");
		var name = $(identifier).data("name");

		$("#productId").val(id);
		$("#productPrice").val(price);
		$("#productStock").val(stock);
		$("#productName").val(name);
	};

	function deleteClick(identifier) {
		var status = confirm("Ürünü Silmek İstediğinize Eminmisiniz ?");
		
		if (status) {
			var id = $(identifier).attr("data-id");
			var href = "/SpringMVCHibernateCRUDExample/deleteProduct/" + id;
			document.location.href = href;
		}
		return status;
	};
</script>

<!-- page script -->

<jsp:include page="shared/footer.jsp" />