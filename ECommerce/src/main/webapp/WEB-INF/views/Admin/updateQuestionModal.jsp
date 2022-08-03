<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<div class="input-group">
		<input type="hidden" name="subcategoryid" value="${subCatId}">
		<input type="hidden" name="questionid" value="${questions.id}">
			<input type="hidden" name="q_answer_id" value="${qAnswer.id}">
			<input type="hidden" name="answer_id" value="${questionAnswer.id}">
			<input type="text" class="form-control" name="question"
				value="${questions.name}" placeholder="Question" required="required">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">(A).</div>
		<div class="col-sm-4">
			<div class="form-group">
				<input type="text" class="form-control" name="q_answer_a"
					value="${qAnswer.q_answer_a}" placeholder=" " required="required">
			</div>
		</div>
		<div class="col-sm-1">
			<div class="form-group">

				<c:if test="${questionAnswer.answer_a == '1'}">
					<input class="form-control" type="checkbox" name="answer_a"
						value="${questionAnswer.answer_a}" checked="checked">
				</c:if>
				<c:if test="${questionAnswer.answer_a == '0'}">
					<input class="form-control" type="checkbox" name="answer_a"
						value="1">
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">(B).</div>
		<div class="col-sm-4">
			<div class="form-group">
				<input type="text" class="form-control" name="q_answer_b"
					value="${qAnswer.q_answer_b}" placeholder=" " required="required">
			</div>
		</div>
		<div class="col-sm-1">
			<div class="form-group">
				<c:if test="${questionAnswer.answer_b == '1'}">
					<input class="form-control" type="checkbox" name="answer_b"
						value="${questionAnswer.answer_b}" checked="checked">
				</c:if>
				<c:if test="${questionAnswer.answer_b == '0'}">
					<input class="form-control" type="checkbox" name="answer_b"
						value="1">
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">(C).</div>
		<div class="col-sm-4">
			<div class="form-group">
				<input type="text" class="form-control" name="q_answer_c"
					value="${qAnswer.q_answer_c}" placeholder=" " required="required">
			</div>
		</div>
		<div class="col-sm-1">
			<div class="form-group">
				<c:if test="${questionAnswer.answer_c == '1'}">
					<input class="form-control" type="checkbox" name="answer_c"
						value="${questionAnswer.answer_c}" checked="checked">
				</c:if>
				<c:if test="${questionAnswer.answer_c == '0'}">
					<input class="form-control" type="checkbox" name="answer_c"
						value="1">
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">(D).</div>
		<div class="col-sm-4">
			<div class="form-group">
				<input type="text" class="form-control" name="q_answer_d"
					value="${qAnswer.q_answer_d}" placeholder=" " required="required">
			</div>
		</div>
		<div class="col-sm-1">
			<div class="form-group">
				<c:if test="${questionAnswer.answer_d == '1'}">
					<input class="form-control" type="checkbox" name="answer_d"
						value="${questionAnswer.answer_d}" checked="checked">
				</c:if>
				<c:if test="${questionAnswer.answer_d == '0'}">
					<input class="form-control" type="checkbox" name="answer_d"
						value="1">
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>