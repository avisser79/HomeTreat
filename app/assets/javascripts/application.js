//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require bootstrap-datepicker

//= require_tree .

// const search = document.getElementById('search-active')

// search.addEventListener('click', function(event) {
//   const searchForm = document.getElementById('search-form');
//   searchForm.classList.toggle('hidden-xs')
// })


$('.searchbar-input-date').datepicker({
    multidate: true,
    todayHighlight: true,
    datesDisabled: ['11/06/2017', '11/21/2017'],
    toggleActive: true
});
