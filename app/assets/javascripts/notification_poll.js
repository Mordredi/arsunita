$(document).ready(function() {
  (function poll() {
    setTimeout(function() {
        $.ajax({
            url: "/notifications",
            type: "GET",
            dataType: "script",
            complete: poll,
            timeout: 5000
        })
    }, 5000);
  })();
});