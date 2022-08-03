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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<div class="container">
	<div class="card border-primary">
	 <div class="card-header textstyle" style="background: rgb(230, 237, 244)"><b>Questions</b></div>
	 <div class="card-body" style="background-color: rgb(230, 237, 244)">
	 <div class="card border-primary">
			<form action="/add-subjects" method="post" id="questionForm">
		<div class="card-body"> 
			<div class="col-sm-12 nopadding">
	<div class="form-row">
						<div class="col-md-6 mb-3">
							<div class="form-group">
								<div class="input-group">
									<select id="categoryId" class="form-control" name="categoryid"
										style="width: 100%;" required="required">
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
						<div class="col-md-6 mb-3">
							<div class="form-group">
								<div class="input-group">
									<select id="subCategory" class="form-control"
										name="subcategoryid" style="width: 100%;" required="required">
										<option value="">Select Sub Category</option>
									</select>
								</div>
							</div>
							<div class="valid-feedback">Looks good!</div>
						</div>
					</div>
    
    
    
			
				<div class="form-group">
					<div class="input-group">
						<button class="row-id">1.</button><input type="text" class="form-control"
							name="question" placeholder="Question" required="required">
						<div class="input-group-btn">
						
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-2">(A).</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="text" class="form-control" name="q_answer_a"
								value="" placeholder=" " required="required">
						</div>
					</div>
					<div class="col-sm-1"> <div class="form-group"><input class="form-control" type="checkbox" name="answer_a" value="1"></div></div>
				</div>
				<div class="row">
					<div class="col-sm-2">(B).</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="text" class="form-control"  name="q_answer_b"
								value="" placeholder=" " required="required">
						</div>
					</div>
					<div class="col-sm-1"><div class="form-group"><input class="form-control" type="checkbox" name="answer_b" value="1"></div></div>
				</div>
				<div class="row">
					<div class="col-sm-2">(C).</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="text" class="form-control" name="q_answer_c"
								value="" placeholder=" " required="required">
						</div>
					</div>
					<div class="col-sm-1"><div class="form-group"><input class="form-control" type="checkbox" name="answer_c" value="1"></div></div>
				</div>
				<div class="row">
					<div class="col-sm-2">(D).</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="text" class="form-control"  name="q_answer_d"
								value="" placeholder=" " required="required">
						</div>
					</div>
					<div class="col-sm-1"> <div class="form-group"><input class="form-control" type="checkbox" name="answer_d" value="1"></div></div>
				</div>
			</div>
			<div class="clear"></div> 
			<div id="education_fields"></div>
		</div>
		 <div class="card-footer text-right" style="background: rgb(230, 237, 244)">
		 
		 <div class="row"> <div class="form-group col-sm-4">
		 <button class="btn btn-info form-control" type="button"
								onclick="education_fields();"><i class="fa fa-plus" aria-hidden="true"></i></button>
		 </div><div class="col-sm-4"></div>
		 <div class="form-group col-sm-4">
		<input type="submit" class="btn btn-sm btn-success form-control"
									value="Submit">
		 </div>
		 
		 </div>
		 </div>
</form>
	</div>
	</div>
	</div>
</div>


		<link rel="stylesheet" href="resources/css/bootstrapValidator.min.css" />
		<script type="text/javascript" src="resources/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
    // when page is ready
    $(document).ready(function() {
    	
    	var status='${status}'; 
		if(status == '1'){
			$.notify("You have successfully created.", "success");
		}
		 
         // on form submit
        $("#questionForm").on('submit', function() {
        	$(this).find('input[type=checkbox]:not(:checked)').prop('checked', true).val(0)
          
        });
    })
</script>


	<script type="text/javascript">
		var room = 1;
		function education_fields() {

			room++;
			var objTo = document.getElementById('education_fields')
			var divtest = document.createElement("div");
			divtest.setAttribute("class", "form-group removeclass" + room);
			var rdiv = 'removeclass' + room;
			divtest.innerHTML = '<hr><div class="col-sm-12 nopadding"><div class="form-group"> <div class="input-group"><button class="row-id">'+(room)+'.</button><input type="text" class="form-control" name="question" placeholder="Question" required="required"><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_education_fields('
					+ room
					+ ');"> <i class="fa fa-minus" aria-hidden="true"></i></button></div></div></div><div class="row"><div class="col-sm-2">(A).</div><div class="col-sm-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_a" placeholder="" required="required"></div></div><div class="col-sm-1"><div class="form-group"><input class="form-control" type="checkbox" name="answer_a"  value="1"></div></div></div><div class="row"><div class="col-sm-2">(B).</div><div class="col-sm-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_b"  placeholder="" required="required"></div></div><div class="col-sm-1"><div class="form-group"><input class="form-control" type="checkbox" name="answer_b"  value="1"></div></div></div><div class="row"><div class="col-sm-2">(C).</div><div class="col-sm-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_c" placeholder="" required="required"></div></div><div class="col-sm-1"><div class="form-group"><input class="form-control" type="checkbox" name="answer_c"  value="1"></div></div></div><div class="row"><div class="col-sm-2">(D).</div><div class="col-sm-4"><div class="form-group"><input type="text" class="form-control"   name="q_answer_d"  placeholder="" required="required"></div></div><div class="col-sm-1"> <div class="form-group"><input class="form-control" type="checkbox" name="answer_d" value="1"></div></div></div></div> <div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"><div class="input-group-btn"> </div></div></div></div><div class="clear"></div>';

			objTo.appendChild(divtest)
			 $(".row-id").each(function (i){
		           $(this).text(i+1);
		        }); 
		}
		function remove_education_fields(rid) {
			$('.removeclass' + rid).remove();
			 $(".row-id").each(function (i){
		           $(this).text(i+1);
		        }); 
		}
	</script>
	
	<script>
            $(document).ready(function() { 


            	 $('#categoryId').on('change', function() { 
                     $("#subCategory").empty();
               	  $.ajax({
               		  url: "get-sub-category",
               		  type: "get", //send it through get method
               		  data: { 
               		    categoryId: this.value, 
               		  },
               		  success: function(response) { 
               		   $.each(response, function(key, value) {   
                 		     $('#subCategory')
                 		         .append($("<option value="+value.id+"></option>")
                 		                    .attr("value", key.id)
                 		                    .text(value.name)); 
                 		}); 
               		  },
               		  error: function(xhr) {
               		   alert("ERROR")
               		  }
               		}); 
               	});
            }); 
        </script>
</body>
</html>