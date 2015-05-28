var searchValue;

function hideIfNothing() {
  if (searchValue === "") {
    $('#search-results').hide();
  }
}

$(document).on('ready page:load', function(){
  $('#search-form').on('keyup submit', function(e){
    e.preventDefault();
    $('#search-results').show()
    searchValue = $('#search').val();
    $.ajax({
      url: '/search?search=' + searchValue,
      type: 'GET',
      dataType: 'script'
    });
  });

  if ($('#search-results').length) {
    $('main').on('click', function(){
      $('#search-results').hide();
    });
  }

});