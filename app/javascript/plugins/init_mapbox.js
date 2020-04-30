import mapboxgl from 'mapbox-gl';
// Second import is for the search bar
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const mapElement = document.getElementById('map');



const addMarkers = (map, markers) => {
markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infowindow);

  new mapboxgl.Marker({color: '#F6A18E'})
  .setLngLat([ marker.lng, marker.lat ])
  .setPopup(popup)
  .addTo(map);
});
};


  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {
  if (mapElement) {
mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;


  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });


const markers = JSON.parse(mapElement.dataset.markers);

const categoryButtonAll = document.querySelector("#category-button-all")

const categoryButton = document.querySelectorAll("#category-button");

const markersPerCategory = [];


categoryButton.forEach((button) => {
  button.addEventListener("click", (event) => {
const markersPerCategory = [];
  const categoryName = event.currentTarget.innerText;

  markers.forEach((marker) => {
    if (marker.category === categoryName) {
      markersPerCategory.push(marker);
    };
  });
fitMapToMarkers(map, markersPerCategory);

});
});
fitMapToMarkers(map, markers);
addMarkers(map, markers);
//add lines below if want to add the search field on the map
// map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
//   mapboxgl: mapboxgl }));
};
};
export { initMapbox };
