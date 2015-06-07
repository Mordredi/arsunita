$(document).on('ready page:load', function(){
  $('.btn-follow').on('click', function(e){
    e.preventDefault();
    $(this).hide();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      data: 'script',
      dataType: 'POST'
    });
  });
});