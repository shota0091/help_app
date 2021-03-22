module RoomsHelper
  def most_new_message_preview(room)
    # 最新メッセージのデータを取得する
    message = room.messages.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    message = message[0]
    tag.p "#{message.messages}",class:"contents__LastMessag"
  end

  def most_new_message_preview_time(room)
    message = room.messages.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    message = message[0]
    tag.p "#{message.created_at.strftime('%Y/%m/%d %I:%M')}",class:"contents__LastMessag"
  end

  # 相手ユーザー名を取得して表示するメソッド
  def opponent_user(room)
    # 中間テーブルから相手ユーザーのデータを取得
    entry = room.entries.where.not(user_id: current_user)
    # 相手ユーザーの名前を取得
    name = entry[0].user.name
    # 名前を表示
    tag.p "#{name}", class: "contents__UsersData__UserName"
  end

  def opponent_user_image(room)
    # 中間テーブルから相手ユーザーのデータを取得
    entry = room.entries.where.not(user_id: current_user)
    # 相手ユーザーの名前を取得
    image = entry[0].user.image
    # 名前を表示
     image_tag image.url, class:'user-image'
  end
end
