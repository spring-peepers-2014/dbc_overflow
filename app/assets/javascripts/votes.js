$(document).ready(function() {
  $('.questions_vote').on('ajax:success', function(e, data) {
    console.log(data)
    $(this).closest('.questions_vote').find('.vote_count').html(data);
  });

});
