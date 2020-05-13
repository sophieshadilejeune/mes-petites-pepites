import $ from 'jquery';
import 'select2';


const initSelect2 = () => {
  $('#user-input').select2({
    placeholder: "Discover by User",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#city-search').select2({
    placeholder: "Discover by City",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#cities-input').select2({
    placeholder: "Choose another city",
    allowClear: true
  }); // (~ document.querySelectorAll)
  $('#city-choose').select2({
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


const searchUser = () => {
  $(document).ready(function() {
    $('#user-input').on('select2:select', function(e) {
      var itemUsername = e.params.data.element.dataset.nickname;
      var itemUserCity = e.params.data.element.dataset.city;

      window.open('users/'+itemUsername+'/cities/'+itemUserCity, "_self");
    });
});
};

const searchByCity = () => {
  $(document).ready(function() {
    $('#city-search').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      window.open('/cities/'+itemCity, "_self");
    });
});
};

const chooseAnotherCity = () => {
  $(document).ready(function() {
    $('#city-choose').on('select2:select', function(e) {
      var itemCity = e.params.data.element.dataset.name;
      window.open('/cities/'+itemCity, "_self");
    });
});
};

const searchCity = () => {
  $(document).ready(function() {
    $('#cities-input').on('select2:select', function(e) {
      var item = e.params.data.element.dataset.name;
      window.open('/dashboard/cities/'+item, "_self");
    });
    $('#cities-input').on('select2:open', () => {
        $(".select2-results:not(:has(a))").append('<a href="/cities/select" style="padding: 6px;height: 20px;display: inline-table;">Add a new city</a>');
});
  });
};

export { initSelect2, searchUser, searchCity, searchByCity, addCityToUser, chooseAnotherCity };
