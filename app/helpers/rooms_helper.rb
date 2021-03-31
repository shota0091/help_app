module RoomsHelper
  def most_new_message_preview(room)
    message = room.messages.order(updated_at: :desc).limit(1)
    message = message[0]
    tag.p "#{message.messages}",class:"contents__LastMessag"
  end

  def most_new_message_preview_time(room)
    message = room.messages.order(updated_at: :desc).limit(1)
    message = message[0]
    tag.p "#{message.created_at.strftime('%Y/%m/%d %I:%M')}",class:"contents__LastMessag"
  end

  def opponent_user(room)
    entry = room.entries.where.not(user_id: current_user)
    name = entry[0].user.name
    tag.p "#{name}", class: "contents__UsersData__UserName"
  end

  def opponent_user_image(room)
    entry = room.entries.where.not(user_id: current_user)
    image = entry[0].user.image
    image_tag image.url, class:'user-image'
  end
end
