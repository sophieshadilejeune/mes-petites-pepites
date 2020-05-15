import $ from 'jquery';
import 'select2';


const initSelect2 = () => {
  $('#user-search-home').select2({
    placeholder: "Discover by User",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#city-search-home').select2({
    placeholder: "Discover by City",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#city-choose-user-show').select2({
    placeholder: "Choose another city",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#city-choose-show').select2({
    placeholder: "Choose another city",
    allowClear: true
  });
  $('#city-choose-dashboard').select2({
    placeholder: "Choose another city",
    allowClear: true
  });
};

const addCityToUser = () => {
    $('#city-select-select2')
    .select2( {
      placeholder: "Choose a city you want to add",
    allowClear: true
    })
    .on('select2:open', () => {
      $(".select2-results:not(:has(a))").append('<a href="/cities/new" style="padding: 6px;height: 20px;display: inline-table;" id="AddCity">Add a new City</a>');
    });
  };


const visitorPageUser = () => {
  $(document).ready(function() {
    $('#user-search-home').on('select2:select', function(e) {
      var itemUsername = e.params.data.element.dataset.nickname;
      var itemUserCity = e.params.data.element.dataset.city;

      window.open('users/'+itemUsername+'/cities/'+itemUserCity, "_self");
    });
});
};

const visitorPageCity = () => {
  $(document).ready(function() {
    $('#city-search-home').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      window.open('/cities/'+itemCity, "_self");
    });
});
};

const moveToAnotherCity = () => {
  $(document).ready(function() {
    $('#city-choose-show').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      window.open('/cities/'+itemCity, "_self");
    });
});
};

const moveToAnotherCityUser = () => {
  $(document).ready(function() {
    $('#city-choose-user-show').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      var itemUser = e.params.data.element.dataset.owner;
      window.open('/users/'+itemUser+'/cities/'+itemCity, "_self");
    });
    $('#cities-input').on('select2:open', () => {
        $(".select2-results:not(:has(a))").append('<a href="/cities/select" style="padding: 6px;height: 20px;display: inline-table;">Add a new city</a>');
});
  });
};

const chooseCityDashboard = () => {
  $(document).ready(function() {
    $('#city-choose-dashboard').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      window.open('/dashboard/cities/'+itemCity, "_self");
    });
    $('#cities-input').on('select2:open', () => {
        $(".select2-results:not(:has(a))").append('<a href="/cities/select" style="padding: 6px;height: 20px;display: inline-table;">Add a new city</a>');
});
  });
};

export { initSelect2, addCityToUser, chooseCityDashboard, visitorPageUser,visitorPageCity, moveToAnotherCity, moveToAnotherCityUser };
