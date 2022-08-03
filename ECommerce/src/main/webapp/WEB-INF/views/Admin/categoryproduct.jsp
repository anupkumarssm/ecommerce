<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width">
</head>
<body>
	<link rel="stylesheet" type="text/css"
		href="resources/css/datatables.min.css" />
	<script type="text/javascript" src="resources/js/datatables.min.js"></script>
	<script src="resources/js/notify.js"></script>
	<div class="container">
		<div class="card border-primary">
			<div class="card-body" style="background-color: rgb(230, 237, 244)">
				<div class="card border-primary">
					<form action="/add-sub-category" method="post"
						class="needs-validation" id="subCategoryForm" novalidate>
						<input type="hidden" name="id" value="0">
						<div class="card-header textstyle"
							style="background: rgb(230, 237, 244)">
							<b>Products</b>
						</div>
						<div class="card-body">
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group">
											<!-- <div class="input-group-prepend">
									<span class="input-group-text"> <i class="fa fa-user">
											Category Name : </i>
									</span>
								</div> -->
											<select id="categoryId" class="form-control"
												name="category_id" required>
												<option value="">Select</option>
												<c:forEach var="categories" items="${allCategories}">
													<option value="${categories.id}">${categories.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group"> 
											<input type="text" class="form-control"
												placeholder="Product Name" autocomplete="off"
												name="name" required>
										</div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group"> 
											<input type="number" class="form-control"
												placeholder="Price" autocomplete="off"
												name="price" required>
										</div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group"> 
											<input type="text" class="form-control"
												placeholder="Description" autocomplete="off"
												name="description" required>
										</div>
									</div>
								</div>
							</div>

							<div class="text-center">
								<!-- <input type="submit"
						class="btn btn-sm btn-success form-control col-sm-4"
						value="Submit"> -->
							</div>
						</div>
						<div class="card-footer text-right"
							style="background: rgb(230, 237, 244)">
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="form-group col-sm-4">
									<input type="submit"
										class="btn btn-sm btn-success form-control" value="Submit">
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body" style="background-color: rgb(230, 237, 244)">
				<table id="example"
					class="table table-striped table-bordered display nowrap bg-info table-hover"
					style="width: 100%">
					<thead>
						<tr style="background: #338D36" align="center">
							<th class="text-white">S.No</th>
							<th class="text-white">Category</th>
							<th class="text-white">Product</th>
							<th class="text-white">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sbcat" items="${subcategories}" varStatus="count">
							<tr align="center" class="text-white">
								<td>${count.count}</td>
								<td>${sbcat.categoryname}</td>
								<td>${sbcat.name}</td>
								<td><a class="btn btn-sm btn-success" href="#"
									onclick="updateSubCategoryFunc('${sbcat.id}','${sbcat.name}','${sbcat.category_id}','${sbcat.price}','${sbcat.description}')">Update</a>&nbsp;<a
									class="btn btn-sm btn-danger"
									href="/delete-sub-category?id=${sbcat.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- The Modal -->
	<div class="modal" id="updateSubCategoryModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="/add-sub-category" method="post"
					class="needs-validation" id="updateSubCategoryForm" novalidate>
					<input type="hidden" name="id" id="updateSubCatId">
					<div class="modal-body">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title text-center mb-4 mt-1">Update Product</h4>
								<hr>
								<div class="form-row">
									<div class="col-md-12 mb-3">
										<div class="form-group">
											<div class="input-group">
												<!-- 	<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"> Category Name : </i>
													</span>
												</div> -->
												<select id="categoryId"
													class="form-control updateCategoryId" name="category_id"
													required>
													<option value="">Select</option>
													<c:forEach var="categories" items="${allCategories}">
														<option value="${categories.id}">${categories.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<div class="input-group">
												<!-- 	<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"> Sub Category Name : </i>
													</span>
												</div> -->
												<input type="text" class="form-control"
													id="updateSubCatName" placeholder="Product name"
													autocomplete="off" name="name" required>
											</div>
										</div>
									</div>
									<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group"> 
											<input type="number" class="form-control"
												placeholder="Price" autocomplete="off" id="Pprice"
												name="price" required>
										</div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<div class="input-group"> 
											<input type="text" class="form-control"
												placeholder="Description" autocomplete="off" id="Desc"
												name="description" required>
										</div>
									</div>
								</div>
									 
								</div>
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
						<input type="submit"
							class="btn btn-sm btn-success form-control col-sm-2"
							value="Update">
					</div>
				</form>
			</div>
		</div>
	</div>


	<link rel="stylesheet" href="resources/css/bootstrapValidator.min.css" />
	<script type="text/javascript"
		src="resources/js/bootstrapValidator.min.js"></script>
	<script src="resources/js/bootstrap4-toggle.min.js"></script>
	<script>
		$(document).ready(function() {
			var status = '${status}';
			if (status == '1') {
				$.notify("You have successfully created.", "success");
			}
			if (status == '0') {
				$.notify("You have Deleted.", "error");
			}
			var table = $('#example').DataTable({
				rowReorder : {
					selector : 'td:nth-child(2)'
				},
				responsive : true
			});
		});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							// $('#categoryId').select2();
							$('#subCategoryForm')
									.bootstrapValidator(
											{
												fields : {
													categoryid : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Category name is required and cannot be empty</div>'
															},
														}
													},
													name : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Sub Category name is required and cannot be empty</div>'
															},
														}
													}
												}
											});

							$('#updateSubCategoryForm')
									.bootstrapValidator(
											{
												fields : {
													categoryid : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Category name is required and cannot be empty</div>'
															},
														}
													},
													name : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Sub Category name is required and cannot be empty</div>'
															},
														}
													}
												}
											});
						});

		function updateSubCategoryFunc(id, name, categoryid,price ,desc) {
			$("#updateSubCatId").val(id);
			$(".updateCategoryId").val(categoryid);
			$("#updateSubCatName").val(name);
			$("#Pprice").val(price);
			$("#Desc").val(desc);
			$("#updateSubCategoryModal").modal().show();
		}
	</script>


</body>
</html>
