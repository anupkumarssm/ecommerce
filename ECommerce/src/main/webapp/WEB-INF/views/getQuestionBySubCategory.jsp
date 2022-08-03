<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
 .btn, .btn-xs {
  padding: .25rem .4rem;
  font-size: .875rem;
  line-height: .5;
  border-radius: .2rem;
}

.myButton {
	box-shadow: 0px 1px 0px 0px #1c1b18;
	background:linear-gradient(to bottom, #eae0c2 5%, #ccc2a6 100%);
	background-color:#eae0c2;
	border-radius:10px;
	border:2px solid #333029;
	display:inline-block;
	cursor:pointer;
	color:#505739;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:5px 06px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #ccc2a6 5%, #eae0c2 100%);
	background-color:#ccc2a6;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>

<style>
.new-container {
  width: 50%;
  margin: 0 auto;
  text-align: center;
  display:none;
}

.new-container h2, .modal-content {
  font-size: 1.5em;
  position: relative;
  background: #ccccff;
  padding: .3em;
  -moz-box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3);
  font-family: Baskerville;
  font-style: italic;
}

.new-container h2:before, .modal-content:before, .new-container h2:after, .modal-content:after {
  content: "";
  position: absolute;
  display: block;
  bottom: -1em;
  border: 1em solid #ccccff;
  z-index: -1; 
}

.new-container h2:before, .modal-content:before {
  left: -1em;
  border-right-width: 1em;
  border-right-color: #ccccff;
  border-left-color: transparent;
  -moz-box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.new-container h2:after, .modal-content:after {
  right: -1em;
  border-left-width: 1em;
  border-left-color: #ccccff;
  border-right-color: transparent;
  -moz-box-shadow: -2px 2px 4px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: -2px 2px 4px rgba(0, 0, 0, 0.3);
  box-shadow: -2px 2px 4px rgba(0, 0, 0, 0.3);
}

.my-popup .modal-footer{
padding:10px;
border-top: none;
text-align:center;
}
.my-popup .modal-body{
 padding: 10px;
 color:#ccccff;
 }

</style>
<body>
	<div class="container" id="jar">
		<c:forEach var="question" items="${questions}" varStatus="counter">

			<div class="row mx-auto content"> 
				<div class="col-sm-12 nopadding addCardEveryAfter5Div">
					<div class="form-group">
						<div class="input-group">
							<b>${counter.count}.&nbsp;&nbsp;${question.name}</b>
						</div>
					</div>
					<c:forEach var="qans" items="${qAnswer}" varStatus="counter">
						<c:if test="${question.id == qans.question_id}">
							<div class="row">
							<div class="col-sm-6 checkAnswer checkAnswer0${qans.question_id}" data-sno=0 data-sid='${qans.question_id}'><span>(A)&nbsp;&nbsp;&nbsp;${qans.q_answer_a}</span></div>
							<div class="col-sm-6 checkAnswer checkAnswer1${qans.question_id}" data-sno=1 data-sid='${qans.question_id}'><span>(B)&nbsp;&nbsp;&nbsp;${qans.q_answer_b}</span></div>
							<div class="col-sm-6 checkAnswer checkAnswer2${qans.question_id}" data-sno=2 data-sid='${qans.question_id}'><span>(C)&nbsp;&nbsp;&nbsp;${qans.q_answer_c}</span></div>
							<div class="col-sm-6 checkAnswer checkAnswer3${qans.question_id}" data-sno=3 data-sid='${qans.question_id}'><span>(D)&nbsp;&nbsp;&nbsp;${qans.q_answer_d}</span></div>
							 <button class="myButton btn btn-xs btn-info getAnswer" data-sid='${qans.question_id}'>Answer</button> 
							</div>
						</c:if>
					</c:forEach>
					<hr>
				</div>
      </div>
		</c:forEach>
	</div>

	<nav style="margin-bottom: 50px; margin-top: 20px;">
		<ul class="pagination justify-content-center pagination-sm">
		</ul>
	</nav>

	<script type="text/javascript">
function getPageList(totalPages, page, maxLength) {
if (maxLength < 5) throw "maxLength must be at least 5";

function range(start, end) {
 return Array.from(Array(end - start + 1), (_, i) => i + start);
}

var sideWidth = maxLength < 9 ? 1 : 2;
var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
var rightWidth = (maxLength - sideWidth * 2 - 2) >> 1;
if (totalPages <= maxLength) {
 // no breaks in list
 return range(1, totalPages);
}
if (page <= maxLength - sideWidth - 1 - rightWidth) {
 // no break on left of page
 return range(1, maxLength - sideWidth - 1)
   .concat([0])
   .concat(range(totalPages - sideWidth + 1, totalPages));
}
if (page >= totalPages - sideWidth - 1 - rightWidth) {
 // no break on right of page
 return range(1, sideWidth)
   .concat([0])
   .concat(
     range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages)
   );
}
// Breaks on both sides
return range(1, sideWidth)
 .concat([0])
 .concat(range(page - leftWidth, page + rightWidth))
 .concat([0])
 .concat(range(totalPages - sideWidth + 1, totalPages));
}

$(function() {
// Number of items and limits the number of items per page
var numberOfItems = $("#jar .content").length;
var limitPerPage = 10;
// Total pages rounded upwards
var totalPages = Math.ceil(numberOfItems / limitPerPage);
// Number of buttons at the top, not counting prev/next,
// but including the dotted buttons.
// Must be at least 5:
var paginationSize = 7;
var currentPage;

function showPage(whichPage) {
 if (whichPage < 1 || whichPage > totalPages) return false;
 currentPage = whichPage;
 $("#jar .content")
   .hide()
   .slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage)
   .show();
 // Replace the navigation items (not prev/next):
 $(".pagination li").slice(1, -1).remove();
 getPageList(totalPages, currentPage, paginationSize).forEach(item => {
   $("<li>")
     .addClass(
       "page-item " +
         (item ? "current-page " : "") +
         (item === currentPage ? "active " : "")
     )
     .append(
       $("<a>")
         .addClass("page-link")
         .attr({
           href: "javascript:void(0)"
         })
         .text(item || "...")
     )
     .insertBefore("#next-page");
 });
 return true;
}

// Include the prev/next buttons:
$(".pagination").append(
 $("<li>").addClass("page-item").attr({ id: "previous-page" }).append(
   $("<a>")
     .addClass("page-link")
     .attr({
       href: "javascript:void(0)"
     })
     .text("Prev")
 ),
 $("<li>").addClass("page-item").attr({ id: "next-page" }).append(
   $("<a>")
     .addClass("page-link")
     .attr({
       href: "javascript:void(0)"
     })
     .text("Next")
 )
);
// Show the page links
$("#jar").show();
showPage(1);

// Use event delegation, as these items are recreated later
$(
 document
).on("click", ".pagination li.current-page:not(.active)", function() {
 return showPage(+$(this).text());
});
$("#next-page").on("click", function() {
 return showPage(currentPage + 1);
});

$("#previous-page").on("click", function() {
 return showPage(currentPage - 1);
});
$(".pagination").on("click", function() {
 $("html,body").animate({ scrollTop: 0 }, 0);
});

$('.checkAnswer').click(function() {
 
	 console.log('===='+ $('.countdown').text());
	 var countDownId = $('.countdown').text();
	 if(countDownId == ''){
		 var timer2 = "0:11";
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
			  
			  var countDownId1 = $('.countdown').text();
			  console.log("----"+countDownId1)
			  if(countDownId1 == '-1:0'){
				  $.get("challengetime?totaltime=5", function(data){
					  bootbox.confirm({
						    message: "Your time has been completed.<br> Total Time is : "+data.time+" Minutes",
						    buttons: {
						        confirm: {
						            label: 'Ok',
						            className: 'btn-success'
						        },
						        cancel: {
						            label: 'Cancel',
						            className: 'btn-danger'
						        }
						    },
						    callback: function (result) {
						    	if(result == true){
							        location.reload();
						    	}else{
						    		
						    	}
						    }
						});
		    		});
				  
				  /*   bootbox.confirm({
					  message: "Your time has been completed.",
					    buttons: {
					        confirm: {
					            label: 'Ok',
					            className: 'btn-success'
					        },
					        cancel: {
					            label: 'Cancel',
					            className: 'btn-danger'
					        }
					    },
					    callback: function (result) {
					    	if(result == true){
						        location.reload();
					    	}
					    }
					}); */
					 $('.countdown').html('over');
			  }
			}, 1000);
	 }else  if(countDownId == 'over'){
		 var timer2 = "0:11";
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
			  
			  var countDownId1 = $('.countdown').text();
			  console.log("----"+countDownId1)
			  if(countDownId1 == '-1:0'){
				  $.get("challengetime?totaltime=5", function(data){
					  bootbox.confirm({
						    message: "Your time has been completed.<br> Total Time is : "+data.time+" Minutes",
						    buttons: {
						        confirm: {
						            label: 'Ok',
						            className: 'btn-success'
						        },
						        cancel: {
						            label: 'Cancel',
						            className: 'btn-danger'
						        }
						    },
						    callback: function (result) {
						    	if(result == true){
							        location.reload();
						    	}else{
						    		
						    	}
						    }
						});
		    		});
					 $('.countdown').html('over');
			  }
			}, 1000);
	 }else{
		 
	 }
	 
	var sno=$(this).attr('data-sno');
	var subjectId=$(this).attr('data-sid');
$.get("check-answer?sno="+sno+"&subjectId="+subjectId, function(data){
	
 if(data == 0){  
	 $('.checkAnswer'+sno+""+subjectId).css({"color": "red","font-weight":"700"})
 }else{
	 $('.checkAnswer'+sno+""+subjectId).css({"color": "green","font-weight":"700"});
	 $('.checkAnswer'+sno+""+subjectId).show();
 }
 
 $.get("challengecount?status="+data+"&totaltime=5", function(data){
	 $("#correct").html('&nbsp;:&nbsp;'+data.correct);
	 $("#wrong").html('&nbsp;:&nbsp;'+data.wrong);
	 $("#total").html('&nbsp;:&nbsp;'+(parseInt(data.correct) - parseInt(data.wrong)));
 });
 
 
 
});
});

});
 
</script>

<script type="text/javascript">
$(document).ready(function() {
	 $('.getAnswer').click(function() {
	    	var subId=$(this).attr('data-sid');
	        $.get("get-answer?subId="+subId, function(data){
	    		 
	    		if(data.answer_a == 1){ 
	    			 $('.checkAnswer0'+subId).css({"color": "green","font-weight":"700"});
	    		}else{
	    			 $('.checkAnswer0'+subId).css({"color": "red","font-weight":"700"});
	    		}
	    		
	    		if(data.answer_b == 1){ 
	    			 $('.checkAnswer1'+subId).css({"color": "green","font-weight":"700"});
	    		}else{
	    			 $('.checkAnswer1'+subId).css({"color": "red","font-weight":"700"});
	    		}
	    		
	    		if(data.answer_c == 1){ 
	    			 $('.checkAnswer2'+subId).css({"color": "green","font-weight":"700"});
	    		}else{
	    			 $('.checkAnswer2'+subId).css({"color": "red","font-weight":"700"});
	    		}
	    		
	    		if(data.answer_d == 1){ 
	    			 $('.checkAnswer3'+subId).css({"color": "green","font-weight":"700"});
	    		}else{
	    			 $('.checkAnswer3'+subId).css({"color": "red","font-weight":"700"});
	    		}
		  		});
	 });
	 
	 
	 var count=1;
	  $(".addCardEveryAfter5Div").each(function(i, elem){ 
		
		 if(i == (count * 5)){ 
			count=count+1; 
			 $(elem).append($('<div class="card my-1" style="width: 100%;"><img src="resources/images/adds.gif" alt="" class="mx-auto  img-fluid" style="height: 250px;width:1100px;"></div><hr>'));
			}
		}); 
	  
	  
});
</script>

<script type="text/javascript">

/* $(document).ready(function(){
	 bootbox.setDefaults({
		closeButton: true,
			     title: false,
			     className: 'my-popup'
	      
	}); */
	/*  var dialog = bootbox.alert('hello').addClass('my-popup'); */
	 
/* 	dialog.init(function(){
		var message = $(".my-popup").find(".bootbox-body");
		$(".my-popup").find(".modal-footer").prepend(message);
		$(".my-popup").find(".modal-footer div").css({"display":"inline-block", "padding-right":"10px", "color":"#f7f7f7"});
		$(".my-popup").find(".modal-body").remove();	 
	}); */

	 
			 });
</script>
</body>
</html>