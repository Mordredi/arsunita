var notificationPoll = function() {
  $.ajax({
    url: '/users/noticications',
    type: 'GET',
    dataType: 'script'
  });
};

window.setTimeout(notificationPoll(), 2000);