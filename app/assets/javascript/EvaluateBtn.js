$(document).on('turbolinks:load',function(){
  $('.EvaluateBtn').click(function(){
    $('.EvaluateSide').fadeIn();
  });
  $('.fa-times').click(function(){
    $('.EvaluateSide').fadeOut();
  });
})