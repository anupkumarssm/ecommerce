<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<div class="container"> 
		<div class="row">
			
			<div class="col-md-9">
				<div class="card border-primary my-4">
					<b><div class="card-header" style="background-color: rgb(230, 237, 244)">   <div class="row align-items-center">
             <div class="col-md-8">
                  <p  id="subName"><b>${subCIDMap.cname} / </b>${subCIDMap.name} </p>
             </div>
             <div class="col-md-1"><span class="countdown"></span></div>
             
             <div class="col-md-1" style="color: green;">
                   <i class="fa fa-check" aria-hidden="true">&nbsp;<span id="correct">&nbsp;:&nbsp;0</span></i>
                   
             </div>
               <div class="col-md-1" style="color: red;"> 
                    <i class="fa fa-times" aria-hidden="true">&nbsp;<span id="wrong">&nbsp;:&nbsp;0</span></i>
             </div>
               <div class="col-md-1" style="color: blue;">
                   <i class="fa fa-trophy" aria-hidden="true">&nbsp;<span id="total">&nbsp;:&nbsp;0</span></i>
             </div>
      </div> </div></b>
					<div class="card-body"><div id="showQuestionPage"></div></div>
				</div>
			</div> 
			
			<div class="col-md-3">
			<c:forEach var="category" items="${categories}" varStatus="count">
				<div class="card border-primary my-4">
					<div class="card-header" style="background-color: rgb(230, 237, 244)">${category.name}</div>
						<ul class="list-group list-group-flush">
						<c:forEach var="subCat" items="${subCategories}" varStatus="count">
					 <c:if test="${category.id == subCat.category_id}">
						<a href="#" onclick="getName('${category.name}','${subCat.name}')"><li class="list-group-item" id="cqid${subCat.id}" data-id=${subCat.id} data-name=${subCat.name}>${subCat.name}</li></a> 
					</c:if> 
					</c:forEach>
					</ul>
				</div> 
				</c:forEach>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
	/* 	var timer2 = "0:11";
		var interval = setInterval(function() {
		  var timer = timer2.split(':'); 
		  var minutes = parseInt(timer[0], 10);
		  var seconds = parseInt(timer[1], 10);
		  --seconds;
		  minutes = (seconds < 0) ? --minutes : minutes;
		  if (minutes < 0) clearInterval(interval);
		  seconds = (seconds < 0) ? '' : seconds;
		  seconds = (seconds < 10) ? '0' + seconds : seconds;
		  //minutes = (minutes < 10) ?  minutes : minutes;
		  $('.countdown').html(minutes + ':' + seconds);
		  timer2 = minutes + ':' + seconds;
		}, 1000);
		 */
		 
		
		var status='${status}';  
		if(status == '2'){
			$.notify("You have successfully updated.", "success");
		}
		
		$("#cqid${subCIDMap.id}").addClass("active"); 
		$.get("get-question-answer-by-sub-category?subId=${subCIDMap.id}&subName=${subCIDMap.name}", function(data){
	  		  $("#showQuestionPage").html(data);
	  		});
		
	    $('.list-group-item').click(function() {
	    	 $(this).text()
	    	var subId=$(this).attr('data-id');
	    	var subName=$(this).attr('data-name');  
	        $('.list-group-item.active').removeClass("active");
	        $(this).addClass("active");
	    	$.get("get-question-answer-by-sub-category?subId="+subId+"&subName="+subName, function(data){
	  		  $("#showQuestionPage").html(data);
	  		});
	  	
	    });
	});
	
	
	function getName(catname,subcatname){
		$("#subName").html('<b>'+catname+'</b> / '+subcatname);
	}

	
	</script>
</body>
</html>