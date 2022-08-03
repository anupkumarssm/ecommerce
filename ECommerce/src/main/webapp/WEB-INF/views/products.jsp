<!DOCTYPE HTML>
<html lang="end" xmlns:th="http://www.thymeleaf.org">
<head th:replace="header/header :: header"/>
<body>

<!--cart-->
<div th:replace="header/header :: navbar"/>

<!--header//-->
<div class="product-model">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active">All Products</li>
        </ol>
        <div th:if="${emailsend}">
            <div class="alert alert-success" role="alert">
                Your email was send successfully! please check in your inbox.
            </div>
        </div>
        
        <h2>OUR PRODUCTS</h2>
        <div th:if="${emptyList}" class="alert alert-primary" role="alert">
            We don't have that product yet, come by later!
        </div>
        <div class="col-md-9 product-model-sec">
        <div data-th-each="product : ${productList}">
            <div class="product-grid love-grid" data-th-href="${product.title}">
                <a th:href="@{/buy?id=}+${product.id}">
                    <div class="more-product"><span> </span></div>
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <img style="height: 230px; width: 250px"
                             th:src="#{adminPath}+@{/product_images/}+${product.id}+'.jpg'" class="img-responsive"
                             alt=""/>
                    </div>
                </a>
                <div class="product-info simpleCart_shelfItem">
                    <div class="product-info-cust">
                        <h4 th:text="${product.title}"></h4>
                        <span>$ <span class="item_price" th:text="${product.listPrice}"></span></span><br/>
                       <a th:href="@{/buy?id=}+${product.id}"> <input type="button" class="item_add items" value="BUY NOW"></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!---->
<div class="footer-content">
    <div class="container">
        <div class="ftr-grids">
            <div class="col-md-3 ftr-grid">
                <h4>About Us</h4>
                <ul>
                    <li><a href="#">Who We Are</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="#">Our Sites</a></li>
                    <li><a href="#">In The News</a></li>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Carrers</a></li>
                </ul>
            </div>
            <div class="col-md-3 ftr-grid">
                <h4>Customer service</h4>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Shipping</a></li>
                    <li><a href="#">Cancellation</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Bulk Orders</a></li>
                    <li><a href="#">Buying Guides</a></li>
                </ul>
            </div>
            <div class="col-md-3 ftr-grid">
                <h4>Your account</h4>
                <ul>
                    <li><a href="account.html">Your Account</a></li>
                    <li><a href="#">Personal Information</a></li>
                    <li><a href="#">Addresses</a></li>
                    <li><a href="#">Discount</a></li>
                    <li><a href="#">Track your order</a></li>
                </ul>
            </div>
            <div class="col-md-3 ftr-grid">
                <h4>Categories</h4>
                <ul>
                    <li><a href="#">> Furinture</a></li>
                    <li><a href="#">> Bean Bags</a></li>
                    <li><a href="#">> Decor</a></li>
                    <li><a href="#">> Kichen & Dinning</a></li>
                    <li><a href="#">> Bed & Bath</a></li>
                    <li><a href="#">...More</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!---->

<div class="footer">
    <div class="container">
        <div class="store">
            <ul>
                <li class="active">OUR STORE LOCATOR::</li>
                <li><a href="#">Noida</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Belgium</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">China</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Germany</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Japan</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Armenia</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">South Africa</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Malaysia</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Indonesia</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Mumbai</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Portugal</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Spain</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Northern Ireland</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Mohali</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Gurgaon</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Panchkula</a></li>
                <li><a href="#">|</a></li>
                <li><a href="#">Ambala</a></li>
            </ul>
        </div>
        <div class="copywrite">
            <p>Copyright � 2015 Furnyish Store All rights reserved | Design by <a
                    href="http://w3layouts.com">W3layouts</a></p>
        </div>
    </div>
</div>
</div>
<!---->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript"> 
  $(document).ready(function(){   
$(document).on("keyup", "#searchProd", function() {
	    var searched = $(this).val().toLowerCase();
	    $('.product-grid').each(function(i, obj) {
		    var name = $(this).attr("href").toLowerCase();
		    if(name.indexOf(searched) != -1){
		    	 $(this).show();
		    }else{
		    	 $(this).hide();
		    }
		    
		    
		});
	    
	   
	});
  });
	
</script>
</body>
</html>