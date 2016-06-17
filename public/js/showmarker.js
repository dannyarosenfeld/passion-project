

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();
        geocodeAddress(geocoder, map);
      }

      function geocodeAddress(geocoder, resultsMap) {
        //var address = document.getElementById('address').value;
        var address = document.getElementById('paragraph').innerHTML;
        var username = document.getElementById('username').innerHTML;
        var created =  document.getElementById('created').innerHTML;
        text = "<strong style='color: #B3D1FF'>" + username + "</strong></br><p style='color: black'>" + created + "</p>";

         var infowindow = new google.maps.InfoWindow({
              content: text
           });

        geocoder.geocode({'address': address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            resultsMap.setCenter(results[0].geometry.location);

            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });

            marker.addListener('click', function() {
              infowindow.open(resultsMap, marker);
            });




          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }


