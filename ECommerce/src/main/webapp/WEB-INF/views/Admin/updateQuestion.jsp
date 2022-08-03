<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
<body>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<div class="container">
		<div class="card border-primary">
			<div class="card-header textstyle"
				style="background: rgb(230, 237, 244)">
				<b>Questions</b>
			</div>
			<div class="card-body" style="background-color: rgb(230, 237, 244)">
				<div class="card border-primary">
					<div class="card-body">
						<div class="col-sm-12 nopadding">
							<div class="form-row">
								<div class="col-md-5 mb-3">
									<div class="form-group">
										<div class="input-group">
											<select id="categoryId" class="form-control"
												name="categoryid" style="width: 100%;" required="required">
												<option value="">Select Category</option>
												<c:forEach var="categories" items="${categories}">
													<option value="${categories.id}">${categories.name}</option>
												</c:forEach>
											</select>
										</div>
										<!-- input-group.// -->
									</div>
									<div class="valid-feedback">Looks good!</div>
								</div>
								<div class="col-md-5 mb-3">
									<div class="form-group">
										<div class="input-group">
											<select id="subCategory" class="form-control"
												name="subcategoryid" style="width: 100%;"
												required="required">
												<option value="">Select Sub Category</option>
											</select>
										</div>
									</div>
									<div class="valid-feedback">Looks good!</div>
								</div>
								<div class="col-md-2 mb-3">
									<div class="form-group">
										<div class="input-group">
											<button class="btn btn-info form-control" id="findQuestions">Find</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<div id="showSelectedQuestion"></div>
</div>

		<link rel="stylesheet" href="resources/css/bootstrapValidator.min.css" />
		<script type="text/javascript"
			src="resources/js/bootstrapValidator.min.js"></script>
		<script type="text/javascript">
			// when page is ready
			$(document)
					.ready(
							function() {

								var status = '${status}';
								if (status == '1') {
									$.notify("You have successfully created.",
											"success");
								}

								// on form submit
								$("#questionForm")
										.on(
												'submit',
												function() {
													$(this)
															.find(
																	'input[type=checkbox]:not(:checked)')
															.prop('checked',
																	true)
															.val(0)

												})
							})
		</script>


		<script type="text/javascript">
		$(document).ready(function() {
			
			$("#findQuestions").click(function(){
				 var catId = $("#categoryId").children(":selected").val();
				 var subCatId = $("#subCategory").children(":selected").val();
				// alert("======"+catId)
				 // alert("======"+subCatId)
				  $.get("get-question-list?subCatId="+subCatId+"&catId="+catId, function(data){
			  		  $("#showSelectedQuestion").html(data);
			  		});
				});
			}); 
		</script>

		<script>
			$(document)
					.ready(
							function() {

								$('#categoryId')
										.on(
												'change',
												function() {
													$("#subCategory").empty();
													$
															.ajax({
																url : "get-sub-category",
																type : "get", //send it through get method
																data : {
																	categoryId : this.value,
																},
																success : function(
																		response) {
																	$
																			.each(
																					response,
																					function(
																							key,
																							value) {
																						$(
																								'#subCategory')
																								.append(
																										$(
																												"<option value="+value.id+"></option>")
																												.attr(
																														"value",
																														key.id)
																												.text(
																														value.name));
																					});
																},
																error : function(
																		xhr) {
																	alert("ERROR")
																}
															});
												});

								/* $('#addQuestionAnswerForm')
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
														subcategoryid : {
															validators : {
																notEmpty : {
																	message : '<div class="text-center text-danger">Sub Category name is required and cannot be empty</div>'
																},
															}
														},	question[] : {
															validators : {
																notEmpty : {
																	message : '<div class="text-center text-danger">Tita name is required and cannot be empty</div>'
																},
															}
														}
													}
												}); */

							});
		</script>
</body>
</html>