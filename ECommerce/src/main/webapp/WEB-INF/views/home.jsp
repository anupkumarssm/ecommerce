<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
	<section  class="d-flex align-items-center"
		style="height: 350px;background:white;margin-top: 1px"> 

		<div class="container"> 
			
			<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/assets/img/banner1.jpg" alt="Los Angeles" style="width: 100%;height:450px;">
    </div>
    <div class="carousel-item">
      <img src="resources/assets/img/banner2.jpg" alt="Chicago" style="width: 100%;height:450px;">
    </div>
    <div class="carousel-item">
      <img src="resources/assets/img/banner3.jpg" alt="New York" style="width: 100%;height:450px;">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div> 
	</section>
	<!-- End Hero -->
	<section id="services" class="services section-bg">
		<div class="container">

			<div class="section-title">
				<h2>Products</h2>
				<p>There are several products like mobiles, laptops....etc..</p>
			</div>

			<div class="row">
			<c:forEach var="cat" items="${categories}" varStatus="count">
				<div class="col-xl-3 col-md-6 d-flex align-items-stretch"
					data-aos="zoom-in" data-aos-delay="100">
					<div class="icon-box">
						<div class="icon">
							<i class="bx bxl-dribbble"></i>
						</div>
						<h4>
							<a href="">${cat.name}</a>
						</h4>
						<p>Practice contains objective question with answer and
							explanations etc ...</p>
						<br>
						<button class="btn btn-info form-control" type="submit">
							<a href="practice" class="text-white">Shop now</a>
						</button>
					</div>

				</div>
				</c:forEach>
 
			</div>

		</div>
	</section>
	<main id="main">
		<section id="cta" class="cta">
			<div class="container" data-aos="zoom-in">

				<div class="row">
					<div class="col-lg-9 text-center text-lg-left">
						<h3>Call To Action</h3>
						<p>Coming soon.....</p>
					</div>
					<div class="col-lg-3 cta-btn-container text-center">
						<a class="cta-btn align-middle" href="#">Call To Action</a>
					</div>
				</div>

			</div>
		</section>
		<!-- End Cta Section -->



		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Contact</h2>
					<p></p>
				</div>

				<div class="row">

					<div class="col-lg-5 d-flex align-items-stretch">
						<div class="info">
							<!-- <iframe
								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621"
								frameborder="0" style="border: 0; width: 100%; height: 550px;"
								allowfullscreen></iframe> -->
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30449.952696643584!2d78.39293826586915!3d17.448027642656818!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb9158f201b205%3A0x11bbe7be7792411b!2sMadhapur%2C+Hyderabad%2C+Telangana!5e0!3m2!1sen!2sin!4v1435218536078"
								frameborder="0" style="border: 0; width: 100%; height: 550px;"
								allowfullscreen></iframe>
						</div>

					</div>

					<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
						<form   role="form"
							class="php-email-form">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">Your Name</label> <input type="text"
										name="name" class="form-control" id="name"
										data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
									<div class="validate"></div>
								</div>
								<div class="form-group col-md-6">
									<label for="name">Your Email</label> <input type="email"
										class="form-control" name="email" id="email" data-rule="email"
										data-msg="Please enter a valid email" />
									<div class="validate"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="name">Subject</label> <input type="text"
									class="form-control" name="subject" id="subject"
									data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validate"></div>
							</div>
							<div class="form-group">
								<label for="name">Message</label>
								<textarea class="form-control" name="message" rows="10"
									data-rule="required" data-msg="Please write something for us"></textarea>
								<div class="validate"></div>
							</div>
							<div class="mb-3">
								<div class="loading">Loading</div>
								<div class="error-message" style="background-color: green"
									id="messageRes"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div> 
						</form>
					</div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->


	<a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
	<div id="preloader"></div>
	<link href="resources/assets/vendor/remixicon/remixicon.css"
		rel="stylesheet">
	<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
	<link href="resources/assets/css/style.css" rel="stylesheet">

	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script
		src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/venobox/venobox.min.js"></script>
	<script src="resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.fa-home').css('color', '#BAC0BB');
			
		$("#submitbtn").click(function() {
				setInterval(function() {
					var element = $('#messageRes').text();
					if (element != '') {
						$("#submitbtn").hide();
					}
				}, 1000);

			});
		});
	</script>
</body>

</html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<div class=" "> 
		<div class="row">
			
			<div class="col-md-9">
				<div class="card border-primary my-4">
					<b><div class="card-header" id="subName" style="background-color: rgb(230, 237, 244)">   <div class="row align-items-center">
             <div class="col-md-12">
                  <b>${subCIDMap.cname} / </b>${subCIDMap.name} 
             </div>
             
      </div> </div></b>
					<div class=""><div id="showQuestionPage"></div></div>
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
</html> --%>