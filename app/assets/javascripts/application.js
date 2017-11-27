//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar


//= require_tree .

const search = document.getElementById('search-active')

// $('#calendar').fullCalendar({  });

search.addEventListener('click', function(event) {
  const searchForm = document.getElementById('search-form');
  searchForm.classList.toggle('hidden-xs')
})
