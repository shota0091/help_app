$(document).on('turbolinks:load',function(){
  $('.EvaluateBtn').click(function(){
    $('.EvaluateSide').fadeIn();
  });
  $('.close').click(function(){
    $('.EvaluateSide').fadeOut();
  });
})