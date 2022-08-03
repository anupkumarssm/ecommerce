<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<body>
<div class="container pt-5">
  <div class="row align-items-center justify-content-between">

    <div class="col-lg-2 col-md-3 col-sm-4 col-7">
      <div class="input-group input-group-sm">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">Products</span>
        </div>
        
      </div>
    </div> 
    <div class="col-md-3 order-md-0 mt-2 mt-md-0">
      <select class="form-control form-control-sm">
        <option value="">Sort By</option>
        <option value="">Popylar</option>
        <option value="">Name</option>
      </select>  
    </div>
    
  </div>
</div>

<div class="container">
  <hr />
</div>

<div class="container">
  <div class="row">
<c:forEach var="category" items="${categories}" varStatus="count">
    <div class="col-md-4 mb-3">
      <div class="card h-100">
        <div class="d-flex justify-content-between position-absolute w-100">
          <div class="label-new">
            <span class="text-white bg-success small d-flex align-items-center px-2 py-1">
              <i class="fa fa-star" aria-hidden="true"></i>
              <span class="ml-1">New</span>
            </span>
          </div>
          <div class="label-sale">
            <span class="text-white bg-primary small d-flex align-items-center px-2 py-1">
              <i class="fa fa-tag" aria-hidden="true"></i>
              <span class="ml-1">Sale</span>
            </span>
          </div>
        </div>
        <a href="#">
          <img src="https://picsum.photos/700/550" class="card-img-top" alt="Product">
        </a>
        <div class="card-body px-2 pb-2 pt-1">
          <div class="d-flex justify-content-between">
            <div>
              <p class="h4 text-primary">$${category.price}</p>
            </div>
            <div>
              <a href="#" class="text-secondary lead" data-toggle="tooltip" data-placement="left" title="Compare">
                <i class="fa fa-line-chart" aria-hidden="true"></i>
              </a>
            </div>
          </div>
          <p class="text-warning d-flex align-items-center mb-2">
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
          </p>
          <p class="mb-0">
            <strong>
              <a href="#" class="text-secondary">${category.name}</a>
            </strong>
          </p>
          <p class="mb-1">
            <small>
              <a href="#" class="text-secondary">${category.description}</a>
            </small>
          </p>
          <div class="d-flex mb-3 justify-content-between">
            <div>
             <p class="mb-0 small"><b>MSRP: </b> $${category.price}</p> 
            </div>
            <div class="text-right">
              <p class="mb-0 small"><b>Free Shipping</b></p> 
            </div>
          </div>
          <div class="d-flex justify-content-between">
            <div class="col px-0">
              <button class="btn btn-outline-primary btn-block cartbtn" data-pid="${category.id}">
                Add To Cart 
                <i class="fa fa-shopping-basket" aria-hidden="true"></i>
              </button>
            </div>
            <div class="ml-2">
              <a href="#" class="btn btn-outline-success" data-toggle="tooltip" data-placement="left" title="Add to Wishlist">
                <i class="fa fa-heart" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div data-pname="${category.name}" data-pprice="${category.price }" data-img_id="${category.image}" data-qty="1" id="products_details_${category.id}"></div>
    </c:forEach>
 
  </div>
</div>
  <script type="text/javascript"> 
  $(document).ready(function(){   
	document.getElementById("itemCounts").innerHTML = '${cartItemCount}'
		localStorage.setItem("cartItemCount", "${cartItemCount}");
	   $(document).on("click",".cartbtn",function() {
		   var pid= $(this).attr('data-pid');
		   var pdetails = $("#products_details_"+pid);
		  // alert("OPOPPPPPP---"+pid)
	      var product_name = pdetails.attr('data-pname');
          var product_price = pdetails.attr('data-pprice');
          var product_qty = pdetails.attr('data-qty');
          var product_img_id = pdetails.attr('data-img_id');
            
          $.get("/addtocart?pid="+pid+"&pname="+product_name+"&pprice="+product_price+"&pqty="+product_qty+"&pimg="+product_img_id, function(data, status){
        	   // alert("Data: " + data + "\nStatus: " + status);
        	   if(data == '-1'){
        		   alert("Already added to cart");
        	   }else{
        		   document.getElementById("itemCounts").innerHTML = data;
        		   alert("Added to cart");
        	   }
        	    
        	  });
           
          
	   }); 
  	  }); 
  </script>
</body>
</html>