$(document).on('ready page:load', function(){
  $('.user-info').on('click', function(e){
    e.preventDefault();
    var link = '#' + $(this).attr('data-link');
    $('body').append('<div class="lightbox"> </div>');
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