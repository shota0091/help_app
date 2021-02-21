class ChatsController < ApplicationController
  def create
    @chat = Chat.create(chat_params)
    if @chat.save
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def review_params
    params.require(:chat).permit(:message, :image).merge(messenger: current_user.id, messenging: params[:user_id])
  end
end
