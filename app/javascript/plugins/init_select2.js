import $ from 'jquery';
import 'select2';


const initSelect2 = () => {
  $('#user-input').select2({
    placeholder: "Discover some Pépites",
    allowClear: true
  }); // (~ document.querySelectorAll)
};

const searchUser = () => {
  $(document).ready(function() {
    $('#user-input').on('select2:select', function(e) {
      var item = e.params.data.element.dataset.id;
      window.open('users/'+item, "_self");
    });
});
};


export { initSelect2, searchUser };
