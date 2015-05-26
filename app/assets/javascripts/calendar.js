$(document).on('ready page:load', function(){
  $('.calendar').datepicker({
    dateFormat: "yy-mm-dd",
    onSelect: function(dateStr) {
      var dateFieldId = $(this).data('date');
      $('#' + dateFieldId).val(dateStr);
    }
  });
});