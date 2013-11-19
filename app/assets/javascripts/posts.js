$('.edit_post input[type=checkbox]').click(function() {
  alert('clicked');
});

$(function () {
  $('.edit_post input[type=checkbox]').click(function() {
    alert('clicked');
  });
});

$(function () {
  $('.edit_post input[type=submit]').remove();
  $('.edit_post input[type=checkbox]').click(function () {
    $(this).parent('form').submit();
  });
});
