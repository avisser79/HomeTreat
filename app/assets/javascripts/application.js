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
    todayHighlight: true,
    beforeShowDay: function (date){
                  if (date.getMonth() == (new Date()).getMonth())
                    switch (date.getDate()){
                      case 4:
                        return {
                          tooltip: 'Example tooltip',
                          classes: 'active'
                        };
                      case 8:
                        return false;
                      case 12:
                        return "green";
                  }
                },
    toggleActive: true,
    defaultViewDate: { year: 1977, month: 04, day: 25 }
});
