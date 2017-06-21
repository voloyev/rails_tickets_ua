class MessagesController < ApplicationController
  before_action :conversation

  private

  def conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
