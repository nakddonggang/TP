<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<article class="submenu section SECTION">
	<div class="slide DIV_SLIDE">
		<div class="intro1">
			<div class="slide_con">
				<div class="box_thm">
					<div class="box_thm01 DIV_BOX_THM01" id="map"></div>
				</div>
			</div>
		</div>
	</div>
</article>

 <script>
   function initMap() {
     var uluru = {lat: 35.158592, lng: 129.062082};
     var map = new google.maps.Map(document.getElementById('map'), {
       zoom: 16,
       center: uluru
     });
     var marker = new google.maps.Marker({
       position: uluru,
       map: map
     });
   }
 </script>
 
 <script async defer
 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjO_BTEolll3sBKHzN1xlz8dBhlSX0q9w&callback=initMap">
 </script>