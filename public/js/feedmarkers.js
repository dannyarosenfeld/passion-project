
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
        var address = document.getElementsByClassName('paragraph');

        for (var i = 0; i <address.length; i ++){
        //for (var i in address){
          addresstext = address[i].innerHTML
          //debugger;
          geocoder.geocode({'address': addresstext}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location

            });
            //debugger;
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    }


// debugger;


