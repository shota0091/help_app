$(document).on('turbolinks:load',function(){
  $('.fa-image').click(function(){
    $('.ModalWindow').fadeIn();
  });
  $('.fa-times').click(function(){
    $('.ModalWindow').fadeOut();
  });
})