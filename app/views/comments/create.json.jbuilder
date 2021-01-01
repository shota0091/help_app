json.text  @comment.text
json.user_name  @comment.user.name
json.created_at  @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')
json.user_id  @comment.user.id
json.id @comment.id
json.post_id @comment.post.id