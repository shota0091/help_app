$(function(){
  $(document).on('keyup',".ProductSide__form",function(e){
    var count = $(this).val().length;
    $(".ExplanationForm__LengthCount").text(count+"/1000");
  });
})