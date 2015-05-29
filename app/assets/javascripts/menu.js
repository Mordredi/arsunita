$(document).on('ready page:load', function(){
  $('#menu').on('click', function(e){
    e.preventDefault();
    $('.sidebar').toggleClass('open');
  });
});