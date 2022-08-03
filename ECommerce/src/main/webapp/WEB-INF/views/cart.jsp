<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<style>@import url(https://fonts.googleapis.com/css?family=Fredoka+One);

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { overflow-y: scroll; }
body { 
  background: #caccf7 url('https://i.imgur.com/Syv2IVk.png'); /* https://subtlepatterns.com/old-map/ */
  
}

::selection { background: #bdc0e8; }
::-moz-selection { background: #bdc0e8; }
::-webkit-selection { background: #bdc0e8; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; }
em, i { font-style: italic; }

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 {
  font-family: 'Fredoka One', Helvetica, Tahoma, sans-serif;
  color: #fff;
  text-shadow: 1px 2px 0 #7184d8;
  font-size: 3.5em;
  line-height: 1.1em;
  padding: 6px 0;
  font-weight: normal;
  text-align: center;
}


/* page structure */
#w {
  display: block;
  width: 600px;
  margin: 0 auto;
}

#title {
  display: block;
  width: 100%;
  background: #95a6d6;
  padding: 10px 0;
  -webkit-border-top-right-radius: 6px;
  -webkit-border-top-left-radius: 6px;
  -moz-border-radius-topright: 6px;
  -moz-border-radius-topleft: 6px;
  border-top-right-radius: 6px;
  border-top-left-radius: 6px;
}

#page {
  display: block;
  background: #fff;
  padding: 15px 0;
  -webkit-box-shadow: 0 2px 4px rgba(0,0,0,0.4);
  -moz-box-shadow: 0 2px 4px rgba(0,0,0,0.4);
}

/** cart table **/
#cart {
  display: block;
  border-collapse: collapse;
  margin: 0;
  width: 100%;
  font-size: 1.2em;
  color: #444;
}
#cart thead th {
  padding: 8px 0;
  font-weight: bold;
}

#cart thead th.first {
  width: 175px;
}
#cart thead th.second {
  width: 45px;
}
#cart thead th.third {
  width: 230px;
}
#cart thead th.fourth {
  width: 130px;
}
#cart thead th.fifth {
  width: 20px;
}

#cart tbody td {
  text-align: center;
  margin-top: 4px;
}

tr.productitm {
  height: 65px;
  line-height: 65px;
  border-bottom: 1px solid #d7dbe0;
}


#cart tbody td img.thumb {
  vertical-align: bottom;
  border: 1px solid #ddd;
  margin-bottom: 4px;
}

.qtyinput {
  width: 33px;
  height: 22px;
  border: 1px solid #a3b8d3;
  background: #dae4eb;
  color: #616161;
  text-align: center;
}

tr.totalprice, tr.extracosts {
  height: 35px;
  line-height: 35px;
}
tr.extracosts {
  background: #e4edf4;
}

.remove {
  /* http://findicons.com/icon/261449/trash_can?id=397422 */
  cursor: pointer;
  position: relative;
  right: 12px;
  top: 5px
color:red;
}


.light {
  color: #888b8d;
  text-shadow: 1px 1px 0 rgba(255,255,255,0.45);
  font-size: 1.1em;
  font-weight: normal;
}
.thick {
  color: #272727;
  font-size: 1.7em;
  font-weight: bold;
}


/** submit btn **/
tr.checkoutrow {
  background: #cfdae8;
  border-top: 1px solid #abc0db;
  border-bottom: 1px solid #abc0db;
}
td.checkout {
  padding: 12px 0;
  padding-top: 20px;
  width: 100%;
  text-align: right;
}


/* https://codepen.io/guvootes/pen/eyDAb */
#submitbtn {
  width: 150px;
  height: 35px;
  outline: none;
  border: none;
  border-radius: 5px;
  margin: 0 0 10px 0;
  font-size: 1.3em;
  letter-spacing: 0.05em;
  font-family: Arial, Tahoma, sans-serif;
  color: #fff;
  text-shadow: 1px 1px 0 rgba(0,0,0,0.2);
  cursor: pointer;
  overflow: hidden;
  border-bottom: 1px solid #0071ff;
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #66aaff), color-stop(100%, #4d9cff));
  background-image: -webkit-linear-gradient(#66aaff, #4d9cff);
  background-image: -moz-linear-gradient(#66aaff, #4d9cff);
  background-image: -o-linear-gradient(#66aaff, #4d9cff);
  background-image: linear-gradient(#66aaff, #4d9cff);
}
#submitbtn:hover {
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #4d9cff), color-stop(100%, #338eff));
  background-image: -webkit-linear-gradient(#4d9cff, #338eff);
  background-image: -moz-linear-gradient(#4d9cff, #338eff);
  background-image: -o-linear-gradient(#4d9cff, #338eff);
  background-image: linear-gradient(#4d9cff, #338eff);
}
#submitbtn:active {
  border-bottom: 0;
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #338eff), color-stop(100%, #4d9cff));
  background-image: -webkit-linear-gradient(#338eff, #4d9cff);
  background-image: -moz-linear-gradient(#338eff, #4d9cff);
  background-image: -o-linear-gradient(#338eff, #4d9cff);
  background-image: linear-gradient(#338eff, #4d9cff);
  -webkit-box-shadow: inset 0 1px 3px 1px rgba(0,0,0,0.25);
  -moz-box-shadow: inset 0 1px 3px 1px rgba(0,0,0,0.25);
  box-shadow: inset 0 1px 3px 1px rgba(0,0,0,0.25);
}
.remove{
	color:red;
}

</style>
 <div id="w">
    <header id="title">
      <h1>Cart</h1> 
    </header>
    <div id="page">
      <table id="cart">
        <thead>
          <tr align="center">
            <th class="first">Photo</th>
            <th class="second">Qty</th>
            <th class="third">Product</th>
            <th class="fourth">Line Total</th>
            <th class="fifth">&nbsp;</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach var="item" items="${cartList}" varStatus="count">
          <tr class="productitm" data-id="${item.id }">
            <!-- http://www.inkydeals.com/deal/ginormous-bundle/ -->
            <td id="pimage_${item.id}" data-image="${item.image}"><img src="https://i.imgur.com/8goC6r6.png" class="thumb"></td>
            <td><input id="pqty_${item.id}" type="text" value="1" min="0" max="99" class="qtyinput" data-id="${item.id}" onkeypress="return /[0-9]/i.test(event.key)"></td>
            <td id="pname_${item.id}" data-pname="${item.pname}">${item.pname}</td>
            <td><span id="price_${item.id}" data-prevPrice="${item.pprice }" data-price="${item.pprice}">${item.pprice}</span></td>
            <td><span class="remove"><img src="https://i.imgur.com/h1ldGRr.png" alt="X"></span></td>
          </tr>
            </c:forEach>
          
          <!-- tax + subtotal -->
          <tr class="extracosts">
            <td class="light">Shipping &amp; Tax</td>
            <td colspan="2" class="light"></td>
            <td>$0.00</td>
            <td>&nbsp;</td>
          </tr>
          <tr class="totalprice">
            <td class="light">Total:</td>
            <td colspan="2">&nbsp;</td>
            <td colspan="2"><span class="thick" id="totalPrice">$0</span></td>
          </tr>
          
          <!-- checkout btn -->
          <tr class="checkoutrow">
            <td colspan="5" class="checkout"><button class="checkoutbtndisable" id="submitbtn" data-toggle="modal" data-target="#myCheckoutModal">Checkout Now!</button></td>
          </tr>
        </tbody>
      </table> 
      
    </div>
  </div>
  
   <div class="modal" id="myCheckoutModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header bg-primary">
          <h4 class="modal-title">Shipping Address</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <label><b>Address :</b></label> <span>H No 333</span><br>
          <label><b>Phone :</b></label> <span>+91 498943 43</span>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success btn-sm checkoutbtndisable" id="finalCheckoutbtn">Checkout</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  <script type="text/javascript"> 
  $(document).ready(function(){   
	document.getElementById("itemCounts").innerHTML = '${cartItemCount}'
		localStorage.setItem("cartItemCount", "${cartItemCount}");
	
	$(document).on("keyup", ".qtyinput", function() {
	    var id = $(this).attr('data-id');
	    var qty = $(this).val();
	    if(qty>1){
	    	// alert(id+"+==="+qty)
		    var price = $("#price_"+id).attr('data-prevPrice');
		   // alert(price)
		    var price_new = qty * price;
		    $("#price_"+id).attr('data-price',price_new);
		    $("#price_"+id).html(price_new);
		    
		    var total_price = 0
		    $('#cart > tbody  > tr').each(function(index, tr) { 
		    	   var id = $(this).attr('data-id');
		    	     var pp = parseInt($("#price_"+id).attr('data-price')) || 0;
		    	     console.log("==="+pp)
		    	     total_price += pp; 
		    	});
		  //  alert(total_price)
		    $("#totalPrice").html(total_price);
	    }else{
	    	$(this).val(1);
	    	var price = $("#price_"+id).attr('data-prevPrice');
			   // alert(price)
			    var price_new = 1 * price;
			    $("#price_"+id).attr('data-price',price_new);
			    $("#price_"+id).html(price_new);
			    
			    
	    }
	   
	});
	
	$(document).on("click", "#finalCheckoutbtn", function() {
		$('.checkoutbtndisable').prop('disabled', true);
		    var items = []
		    $('#cart > tbody  > tr').each(function(index, tr) { 
		    	   var id = $(this).attr('data-id');
		    	   var pimage = $("#pimage_"+id).attr('data-image');
		    	   var pname = $("#pname_"+id).attr('data-pname');
		    	   var pqty = $("#pqty_"+id).val();
		    	   var price = $("#price_"+id).attr('data-price');
		    	   var pp = parseInt($("#price_"+id).attr('data-price')) || 0;
		    	   if(pp>0){
		    		   var data = {"pid":id,"pimg":pimage,"pname":pname,"pqty":pqty,"pprice":price};
			    	   items.push(data);
		    	   }
		    	  
		    	}); 
		    console.log(items);
		    var json = {"pname" : 'pname', "lName" : ''};
		    $.ajax({
	            type: 'post',
	            url: '/checkoutitems',
	            data: JSON.stringify(items),
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function (data) {
	                if(data == '1'){
	                	alert("Order completed");
	                	localStorage.setItem("cartItemCount", "0")
	                	window.location.href = "/"
	                }else{
	                	alert("Error")
	                }
	                
	            }
	        });
		    
		    
	   
	});
	
	
	
	 var total_price = 0
	    $('#cart > tbody  > tr').each(function(index, tr) { 
	    	   var id = $(this).attr('data-id');
	    	     var pp = parseInt($("#price_"+id).attr('data-price')) || 0;
	    	     console.log("==="+pp)
	    	     total_price += pp; 
	    	});
	    $("#totalPrice").html(total_price);
	    
	    
  });
  </script>
</body>
</html>