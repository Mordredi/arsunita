$(document).on('ready page:load', function(){
  $('.btn-user-social').on('click', function(e){
    e.preventDefault();
    $('body').append('<div class="lightbox"> </div>');
    var link = '#' + $(this).attr('data-link');
    $(link).show();
    $('.lightbox').on('click', function(){
      $(this).remove();
      $(link).hide();
    });
    $('.user-link').on('click', function(){
      $('.lightbox').remove();
      $(link).hide();
    });
  });
});