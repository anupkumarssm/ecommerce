<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width">
</head> 
<body>  
 <link rel="stylesheet" type="text/css" href="resources/css/datatables.min.css" />
<script type="text/javascript" src="resources/js/datatables.min.js"></script>
 <script src="resources/js/notify.js"></script>
	<div class="card border-primary">
		<div class="card-body" style="background-color: rgb(230, 237, 244)">
			<table id="example"
				class="table table-striped table-bordered display nowrap bg-info table-hover table-responsive"
				style="width: 100%">
				<thead>
					<tr style="background: #338D36" align="center">  
						<th class="text-white">Question</th>
						<th class="text-white">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="question" items="${questions}" varStatus="count">
						<tr  class="text-white">  
							<td style="width: 900px;">${question.name}</td>
							<td style="width: 100px;"><a class="btn btn-sm btn-success" href="#"
								onclick="updateQuestionFunc('${question.id}','${question.subcategoryid}')">Update</a>
                            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div> 


	<!-- The Modal -->
	<div class="modal" id="updateQuestionyModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="background-color: rgb(230, 237, 244)">
				 Update Question 
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="/update-question-form" method="post" class="needs-validation"
					id="updateQuestionForm" novalidate>
					<div class="modal-body">
						<div class="card"> 
							<div class="card-body"> 
							<div id="showQuestionData"></div>

							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer" style="background-color: rgb(230, 237, 244)">
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
		<script type="text/javascript" src="resources/js/bootstrapValidator.min.js"></script>
<script
	src="resources/js/bootstrap4-toggle.min.js"></script>

	<script>
		$(document).ready(
				function() { 
					  $("#updateQuestionForm").on('submit', function() {
				        	$(this).find('input[type=checkbox]:not(:checked)').prop('checked', true).val(0)
				          
				        });
					  
					  
					var status='${status}';  
					if(status == '1'){
						$.notify("You have successfully created.", "success");
					}
					if(status == '0'){
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

		function updateQuestionFunc(id,subCatId) { 
			$.get("get-question-modal?id="+id+"&subCatId="+subCatId, function(data){
		  		  $("#showQuestionData").html(data);
		  		$("#updateQuestionyModal").modal().show();
		  		});
		}
	</script>


</body>
</html>