import tt from '@tomtom-international/web-sdk-maps';

const mapElement = document.getElementById('map');

const initTomtom = () => {

  if (mapElement) {

      tt.setProductInfo('mes-petites-pepites', '1');

// var speedyPizzaCoordinates = [-121.91595, 37.36729];


var map = tt.map({
          key: 'AvYEPE1xySYyqLAinkbE5krRf13DHPW7',
          container: 'map',
          // center: ,
   theme: {
       style: 'main',
       layer: 'basic',
       source: 'raster'
   },
             zoom: 15,
      });


const markers = JSON.parse(mapElement.dataset.markers);
markers.forEach((marker) => {
  new tt.Marker().setLngLat([ marker.lng, marker.lat ]).addTo(map);
//
});
const bounds = new tt.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });

};
}

export { initTomtom };
