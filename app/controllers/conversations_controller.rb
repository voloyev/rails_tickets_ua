class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :mailbox
  before_action :conversation, except: [:index]
  before_action :box, only: [:index]

  def index
    if @box.eql? 'inbox'
      @conversations = @mailbox.inbox
    elsif @box.eql? 'sent'
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end
    @conversations = @conversations.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    recipient = User.find(params[:user_id])
    receipt   = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path receipt.conversation
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_user)
    flash[:success] = 'The conversation was moved to trash.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_user)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end
  
  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def box
    if params[:box].blank? || !%w[inbox sent trash].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end
end
