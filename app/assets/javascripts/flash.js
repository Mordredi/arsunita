$(document).on('ready page:load', function(){
  $('#close').on('click', function(e){
    e.preventDefault();
    $('.flash').remove();
  });
});