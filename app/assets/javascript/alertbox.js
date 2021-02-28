$(document).on('turbolinks:load',function(){
  $('.fa-bell').mouseover(function(){
    $('.arrow_box').fadeIn();
  });
  $('body').click(function(){
    $('.arrow_box').fadeOut();
  });
})