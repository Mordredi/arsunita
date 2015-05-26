$(document).on('ready page:load', function(){
  $('#search-form').on('keyup', function(){
    var searchValue = $('#search').val();
    $.ajax({
      url: '/search?search=' + searchValue,
      type: 'GET',
      dataType: 'script'
    });
  });
});