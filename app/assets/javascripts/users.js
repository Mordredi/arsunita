$(document).on('ready page:load', function(){
  $('.btn-user-social').on('click', function(e){
    e.preventDefault();
    $('body').append('<div class="lightbox"> </div>')
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    });
  });
});

$(document).on('ready page:load', function(){
  if($('#edit-profile').length === 1){
    var userId = $('#edit-profile').data('user');
    $('.description').on('click', function(){
      var description = $(this).text();
      $(this).replaceWith('<form id="description-form"><input type="hidden" name="user[id]" value="' + userId + '"> <textarea name="user[description]" id="user_description">' + description + '</textarea><button>Edit</button></form>')
      $('#description-form').on('submit', function(e){
        e.preventDefault();
        $.ajax({
          data: $(this).serialize(),
          url: userId,
          dataType: 'script',
          type: 'PATCH'
        });
      });
    });
  }
});