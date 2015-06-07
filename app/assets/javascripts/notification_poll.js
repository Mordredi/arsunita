$(document).ready(function() {
  (function poll() {
    setTimeout(function() {
        $.ajax({
            url: "/notifications",
            type: "GET",
            success: function(data) {
                console.log("polling");
            },
            dataType: "script",
            complete: poll,
            timeout: 5000
        }) //, 5000  <-- oops.
    }, 5000); // <-- should be here instead
  })();
});