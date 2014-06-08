$(document).ready(function() {

  $('.question-comment').on('ajax:success', function(e, data) {
    $(this).html(data);
    $('#question_body').val('')
  });

  $('.comment_form').on('submit', function(e) {
    $(this).hide();
  });

});
