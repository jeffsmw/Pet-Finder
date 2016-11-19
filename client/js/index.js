$(function() {
  $('li').on('click', function() {
    var id = $(this).attr('id');
    var backId = $(this).parents('section').attr('id');
    $(this).parents('section').hide();
    $('section#'+id).show();
    $('.back-button').attr('id',backId);
    console.log(id);
  });

  $('.back-button').on('click', function() {
    var id = $(this).attr('id');
    $(this).parents('section').hide();
    $('section#'+id).show();
    $(this).attr('id', 'home');

  });

});
