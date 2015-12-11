function initialize() {
  var markers;
  function assignMarkers(data){
    markers = data;
  };

  $.ajax({
    type: 'GET',
    url: '/nearby_booths',
    success: function(data) {
      assignMarkers(data);
      for (var i = 0; i < markers.length; i++) {
          var data = markers[i];
          var myLatlng = new google.maps.LatLng(data.latitude, data.longitude);
          var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: data.title
          });

          //Attach click event to the marker.
          (function (marker, data) {
              google.maps.event.addListener(marker, "click", function (e) {
                  //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                  infoWindow.setContent("<a href='/booths/" + data.id + "'>" + data.name + "</a>" +
                                        "<br />" +
                                        data.address1 + 
                                        "<br />" +
                                        data.city + ", " + data.state + " " + data.zipcode);
                  infoWindow.open(map, marker);
              });
          })(marker, data);
      }
    }
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
    initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      map.setCenter(initialLocation);
    });
  }

  var mapCanvas = document.getElementById('map');
  var mapOptions = {
    center: new google.maps.LatLng(44.9442, -93.0936),
    scrollwheel: false,
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);

  var infoWindow = new google.maps.InfoWindow();
}

if (window.location.pathname === '/') {
  google.maps.event.addDomListener(window, 'load', initialize);
}