$(document).ready(function() {

  $('.question-comment').on('ajax:success', function(e, data) {
    $(this).html(data);
    $('#question_body').val('')
  });

  $('.edit_questions').on('submit', function(e, data) {
    $(this).hide();
  });

  $('.add_comment').on('ajax:success', function(e, data) {
    $(this).html(data);
    $('#answer_body').val('')
  });

  $('#answer_comment_form').on('submit', function(e, data) {
    $(this).hide();
  });


});

