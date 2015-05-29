$(document).on('ready page:load', function(){
  $('#sidebar-menu').on('click', function(e){
    $(this).toggleClass('active');
    $('#sidebar').toggleClass('open');
  });
});