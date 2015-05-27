$(document).on('ready page:load', function(){
  $('.btn-category').on('click', function(e){
    e.preventDefault();
    var categoryId = $(this).data('category');
    var url = $(this).attr('href');
    $.ajax({
      url: url + '?search=' + categoryId,
      type: 'GET',
      dataType: 'script'
    });
  });
});