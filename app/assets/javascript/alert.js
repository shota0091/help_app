$(document).on('turbolinks:load',function(){
  $('.fa-bell').click(function(){
    $.ajax({
      url: "/notifications/index",
      dataType : 'html',
      success : function(data){
        $('.notifications').html(data);
    },
    });
  });

})