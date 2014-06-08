$(document).ready(function() {
  $('.answers_vote').on('ajax:success', function(e, data) {
    console.log(data)
    $(this).closest('.answers_vote').find('.vote_count').html(data);
  });

  $('.answers_vote').on('ajax:success', function(e, data) {
    console.log(data)
    $(this).closest('.answers_vote').find('.vote_count').html(data);
  });

});
