$(function(){
  function buildHTML(comment){
    let html = `<div class="CommentSide__comments">
                  <a class="LinkUser" href=${comment.user_id}>${comment.user_name}</a>
                    <span class="user">
                      : ${comment.text}
                    </span>
                  <div class="CommentSide__times">
                    ${comment.created_at}
                   </div>
                </div>`
    return html;
  };


  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.CommentSide__comments').prepend(html)
      $('.Comment-form').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert("メッセージ送信失敗しました");
      $('.form__submit').prop('disabled', false);
    })
  });
});