class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications
    render layout: false
  end
end
