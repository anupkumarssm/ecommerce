<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
<body>
	<div class="card card-primary">
	 <div class="card-header"><b>Questions</b></div>
		<div class="card-body"> 
			<div class="col-sm-12 nopadding">
				<div class="form-group">
					<div class="input-group">
						<button>1.</button><input type="text" class="form-control"
							name="question" value="" placeholder="Question">
						<div class="input-group-btn">
							<button class="btn btn-success" type="button"
								onclick="education_fields();">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-1">(A).</div>
					<div class="col-4">
						<div class="form-group">
							<input type="text" class="form-control" name="q_answer_a"
								value="" placeholder="Major">
						</div>
					</div>
					<div class="col-1"> <input type="checkbox" name="answer_a"></div>
				</div>
				<div class="row">
					<div class="col-sm-1">(B).</div>
					<div class="col-4">
						<div class="form-group">
							<input type="text" class="form-control"  name="q_answer_b"
								value="" placeholder="Major">
						</div>
					</div>
					<div class="col-1"> <input type="checkbox" name="answer_b"></div>
				</div>
				<div class="row">
					<div class="col-sm-1">(C).</div>
					<div class="col-4">
						<div class="form-group">
							<input type="text" class="form-control" name="q_answer_c"
								value="" placeholder="Major">
						</div>
					</div>
					<div class="col-1"> <input type="checkbox" name="answer_c"></div>
				</div>
				<div class="row">
					<div class="col-sm-1">(D).</div>
					<div class="col-4">
						<div class="form-group">
							<input type="text" class="form-control"  name="q_answer_d"
								value="" placeholder="Major">
						</div>
					</div>
					<div class="col-1"> <input type="checkbox" name="answer_d"></div>
				</div>
			</div>
			<div class="clear"></div> 
			<div id="education_fields"></div>
			
		</div>
		 <div class="card-footer text-right"><button type="submit" class="btn btn-sm btn-primary"> Submit</button></div>

	</div>


	<script type="text/javascript">
		var room = 1;
		function education_fields() {

			room++;
			var objTo = document.getElementById('education_fields')
			var divtest = document.createElement("div");
			divtest.setAttribute("class", "form-group removeclass" + room);
			var rdiv = 'removeclass' + room;
			divtest.innerHTML = '<hr><div class="col-sm-12 nopadding"><div class="form-group"> <div class="input-group"><button>'+(room)+'.</button><input type="text" class="form-control" name="name" placeholder="Question"><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_education_fields('
					+ room
					+ ');"> <i class="fa fa-minus" aria-hidden="true"></i></button></div></div></div><div class="row"><div class="col-sm-1">(A).</div><div class="col-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_a" placeholder=""></div></div><div class="col-1"> <input type="checkbox" name="answer_a"></div></div><div class="row"><div class="col-sm-1">(B).</div><div class="col-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_b"  placeholder=""></div></div><div class="col-1"> <input type="checkbox" name="answer_b"></div></div><div class="row"><div class="col-sm-1">(C).</div><div class="col-4"><div class="form-group"><input type="text" class="form-control" name="q_answer_c" placeholder=""></div></div><div class="col-1"> <input type="checkbox" name="answer_c"></div></div><div class="row"><div class="col-sm-1">(D).</div><div class="col-4"><div class="form-group"><input type="text" class="form-control"   name="q_answer_d"  placeholder=""></div></div><div class="col-1"> <input type="checkbox" name="answer_d"></div></div></div> <div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"><div class="input-group-btn"> </div></div></div></div><div class="clear"></div>';

			objTo.appendChild(divtest)
		}
		function remove_education_fields(rid) {
			$('.removeclass' + rid).remove();
		}
	</script>
</body>
</html>