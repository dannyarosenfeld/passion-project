
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
        var userinfo = document.getElementsByClassName('userinfo');
        var createdat = document.getElementsByClassName('created');


        newArr = []
        createdArr = []

        for (var i = 0; i <address.length; i ++){
          addresstext = address[i].innerHTML
          console.log(addresstext)

          newArr.push(userinfo[i].innerHTML)
          createdArr.push(createdat[i].innerHTML)
          // userinfotext = userinfo[i].innerHTML


           console.log("Before the geocode callback")
          geocoder.geocode({'address': addresstext}, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
              resultsMap.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                map: resultsMap,
                position: results[0].geometry.location
              });

               var infowindow = new google.maps.InfoWindow({
                  content: "<strong style='color: #B3D1FF'>" + newArr.shift() + "</strong>" + "<p style='color: black'>" + createdArr.shift() + "</p>"
               });

              marker.addListener('click', function() {
                infowindow.open(resultsMap, marker);
              });



            }
            else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
        }
      }


// debugger;


