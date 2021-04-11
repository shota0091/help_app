$(document).on('turbolinks:load',function(){
  $('.fa-bell').click(function(){
    $('.notifications').before('<div class="alert" />');
    $(".alert").load('/notifications/index')
    $(".alert").css({'position': 'absolute','width': '100%'});
  });
  $(document).on("click",function(){
    $('.fa-times').click(function(){
      $('.alert').hide();
    });
  })
});