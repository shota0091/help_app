$(document).on('turbolinks:load',function(){

  
  $('.fa-bell').click(function(){
    $('.wrapper').prepend('<h1>こんにちは！</h1>');
  });
})