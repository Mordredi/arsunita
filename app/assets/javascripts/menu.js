$(document).on('ready page:load', function(){
  $('#menu').on('click', function(e){
    e.preventDefault();
    $('.header-links').toggle();
  });
});