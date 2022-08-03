<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
</head>
<body>
	<div class="card">
<h4>Find Lat & Lng By Address ::</h4>
		<div class="card-header">
			<div class="row">
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" placeholder="Search By Location....">
				</div>
				<div class="col-sm-2">
					<input type="button" class="form-control" id="findButtom"
						value="Find">
				</div>
			</div>

		</div>
		<div class="card-body" id="mapParent">
			<div id="mapDiv"></div>
		</div>

		<div class="card-footer">
			<div class="row">
				<div class="col-sm-6">
					Latitude : <input type="text" id="latitude" class="form-control">
				</div>
				<div class="col-sm-6">
					Longitude : <input type="text" id="longitude" class="form-control">
				</div>
			</div>
		</div>
	</div>
	<style>
#mapDiv {
	height: 350px;
	width: 100%;
}
</style>
	<script>
	$(function(){
         loadMap(17.3775306, 78.5601231);
		$("#findButtom").click(function(){
			var el = document.getElementById("address").value;
			$('#mapParent').html('<div id="mapDiv"></div>');
			 $.get(location.protocol + '//nominatim.openstreetmap.org/search?format=json&q='+el, function(data){
			      if(typeof data[0] === "undefined"){
			    	  bootbox.alert("Please enter valid address!");
			      }else{
			    	  var lat = data[0].lat;
					  var lon = data[0].lon;
			    	  loadMap(lat,lon);
			      }
			    });
		});
	});
	function loadMap(lat,lon){
		 $("#latitude").val(lat);
			$("#longitude").val(lon);
			var map = new L.map('mapDiv').setView([lat, lon], 13);
			var marker = {};
			map.on('click', function(ev){ 
				  var coordinates = map.mouseEventToLatLng(ev.originalEvent);
				  $("#latitude").val(coordinates.lat);
					$("#longitude").val(coordinates.lng);
				 if (marker != undefined) {
					map.removeLayer(marker);
		        };
			   marker = L.marker([coordinates.lat, coordinates.lng]); 
		        marker.addTo(map); 
				});
			L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
			}).addTo(map);
			var marker = L.marker([lat,lon]); 
	         marker.addTo(map);

	         map.invalidateSize();
		}
	 
	
	</script>
</body>
</html>