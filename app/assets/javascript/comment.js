$(function(){
  function buildHTML(comment){
    let html = `<div class="CommentSide__comments" id=comments_${comment.id}>
                    <a class="LinkUser" href=${comment.user_id}>${comment.user_name}</a>
                      <span class="user">
                        : ${comment.text}
                      </span>
                      <div class="delet">
                        <a class="DeleteBtn" rel="nofollow" data-method="delete" href=/posts/${comment.post_id}/comments/${comment.id} ><i class="fas fa-trash-alt"></i></a>
                      </div>
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
      $('.content').prepend(html)
      $('.Comment-form').val('');
      $('.Comment-Send').prop('disabled', false);
    })
    .fail(function(){
      alert("メッセージ送信失敗しました");
      $('.Comment-Send').prop('disabled', false);
    })
  });
});
