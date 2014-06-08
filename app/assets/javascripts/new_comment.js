$(document).ready(function() {

  $('#question-comment').on('ajax:success', function(e, data) {
    $(this).html(data);
    $('#question_body').empty();
  });

  $('.comment_form').on('submit', function(e) {
    $(this).hide();
  });

});
