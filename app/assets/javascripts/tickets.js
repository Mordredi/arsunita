$(document).on('ready page:load', function(){
  $('.show-info').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    });
  });
});