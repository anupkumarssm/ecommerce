<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width">
</head>
<style>
</style>
<body>

	<style>
</style>

	<link rel="stylesheet" type="text/css"
		href="resources/css/datatables.min.css" />
	<script type="text/javascript" src="resources/js/datatables.min.js"></script>
	<script src="resources/js/notify.js"></script>


	<div class="container">
		<div class="card border-primary">
			<div class="card-body" style="background-color: rgb(230, 237, 244)">

				<div class="card border-primary">
					<form action="/add-category" method="post" class="needs-validation" enctype="multipart/form-data"
						id="categoryForm" novalidate>
						<div class="card-header textstyle"
							style="background: rgb(230, 237, 244)">
							<b>Category</b>
						</div>
						<div class="card-body">
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<div class="form-group">
										<div class="input-group">
											<!-- <div class="input-group-prepend">
									<span class="input-group-text"> <i class="fa fa-user">
											Category Name : </i>
									</span>
								</div> -->
											<input type="text" class="form-control"
												placeholder="Category Name" autocomplete="off" name="name"
												required="required">
												
												<input id="productImage" name="productImage" class="form-control input-md" required="required" type="file" />
										</div>
									</div>
								</div>
							<!-- 	<div class="col-md-4 mb-3">

										<input type="submit" class="btn btn-sm btn-success form-control"
									value="Submit">
								</div> -->
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
							<th class="text-white">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cat" items="${categories}" varStatus="count">
							<tr align="center" class="text-white">
								<td>${count.count}</td>
								<td>${cat.name}</td>
								<td><a class="btn btn-sm btn-success" href="#"
									onclick="updateCategoryFunc('${cat.id}','${cat.name}')">Update</a>&nbsp;<a
									class="btn btn-sm btn-danger"
									href="/delete-category?id=${cat.id}">Delete</a><%--  <c:if
										test="${cat.status eq 0}">
										<input class="enbaleDidableToggle" type="checkbox" checked
											data-id="${cat.id}" data-name="${cat.name}"
											data-toggle="toggle" data-on="Ready" data-off="Not Ready"
											data-onstyle="success" data-offstyle="danger">

									</c:if> <c:if test="${cat.status eq 1}">
										<input class="enbaleDidableToggle" type="checkbox"
											data-id="${cat.id}" data-name="${cat.name}"
											data-toggle="toggle" data-on="Ready" data-off="Not Ready"
											data-onstyle="success" data-offstyle="danger">

									</c:if> --%></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<!-- The Modal -->
	<div class="modal" id="updateCategoryModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="/add-category" method="post" class="needs-validation"
					id="updateCategoryForm" novalidate>
					<div class="modal-body">
						<div class="card">
							<input type="hidden" id="updateCatId" name="id">
							<div class="card-body">
								<h4 class="card-title text-center mb-4 mt-1">Update
									Category</h4>
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
												<input type="text" class="form-control" id="updateCatName"
													placeholder="Category Name" autocomplete="off" name="name"
													required>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<!-- 	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
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
		$(document).ready(
				function() {
					var status = '${status}';
					if (status == '1') {
						$.notify("You have successfully created.", "success");
					}
					if (status == '0') {
						$.notify("You have Deleted.", "error");
					}
					//	$.notify("You have successfully created <br> a plotting .", "success");

					$(".enbaleDidableToggle").change(
							function() {
								//alert("OK==");
								var id = $(this).attr("data-id");
								var name = $(this).attr("data-name");
								var status = 0;
								if ($(this).is(":checked")) {
									status = 0;
								} else {
									status = 1;
								}
								$.post("add-category?id=" + id + "&name="
										+ name + "&status=" + status, function(
										data) {
									bootbox.alert("Successfully updated")
								});
							});

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
							$('#categoryForm')
									.bootstrapValidator(
											{
												fields : {
													name : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Category name is required and cannot be empty</div>'
															},
														}
													}
												}
											});
							$('#updateCategoryForm')
									.bootstrapValidator(
											{
												fields : {
													name : {
														validators : {
															notEmpty : {
																message : '<div class="text-center text-danger">Category name is required and cannot be empty</div>'
															},
														}
													}
												}
											});
						});

		function updateCategoryFunc(id, name) {
			$("#updateCatId").val(id);
			$("#updateCatName").val(name);
			$("#updateCategoryModal").modal().show();
		}
	</script>


</body>
</html>