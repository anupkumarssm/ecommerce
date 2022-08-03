<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>  
			<div class="card  shadow bg-primary my-1">
				<img style="height: 200px;" src="resources/images/welcome.gif"
					class="card-img-top rounded-0" alt="Angular pro sidebar">
				<div class="card-body div1 " style="background-color: #17C0FB;color: white; text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;">
					<!-- <img src="https://jsfiddle.net/img/logo.png">  -->
					<img src="resources/images/attentions.png"
						style="border-radius: 10%; height: 50px; width: 20%;"> <span>
						<b style="font-size: 20px;">${category}</b><c:if test="${not empty subCategory}"> / ${subCategory}</c:if>
					</span>

					<div class="divRight">
						<sec:authorize access="!isAuthenticated()">
							<div class="btn-group" role="group" aria-label="Basic example">
								<a href="registration"><button
										class="nav-item nav-link btn btn-sm btn-success text-white"
										style="border-style: groove; border-width: 7px; border-color: coral; color: white; text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;">
										Sign up</button></a>&nbsp; <a href="login"><button
										class="nav-item nav-link btn btn-sm btn-success text-white"
										style="border-style: groove; border-width: 7px; border-color: coral; color: white; text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;">
										Sign in</button></a>
							</div>
						</sec:authorize>

						<sec:authorize access="hasAnyRole('USER','ADMIN')">
							<a href="post-page"><button
									class="nav-item nav-link btn btn-sm btn-success text-white"
									style="border-style: groove; border-width: 7px; border-color: coral; color: white; text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;">
									Post Q & A</button></a>
						</sec:authorize>
					</div>
				</div>
			</div> 
</body>
</html>