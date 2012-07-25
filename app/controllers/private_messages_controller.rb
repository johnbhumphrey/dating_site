class PrivateMessagesController < ApplicationController
  before_filter :must_have_profile
  def show
  	@current_message= PrivateMessage.find(params[:id])
  	unless (current_user.id==@current_message.receiver_id) || (current_user.id== @current_message.sender_id)
  		redirect_to root_path, flash: { error: "You don't have permission to access this page."}
  	end 
  	@received_messages= PrivateMessage.where("receiver_id= ? AND sender_id= ?", 
  		@current_message.receiver_id, @current_message.sender_id)
  	@sent_messages= PrivateMessage.where("sender_id= ? AND receiver_id= ?", 
  		@current_message.receiver_id, @current_message.sender_id)
  	@conversation= (@received_messages + @sent_messages)#.order('created_at DESC')
  	@sender= User.find(@current_message.sender_id).profile 
  end

  def index
  	@sent_messages= PrivateMessage.where('sender_id=?', current_user.id).all
  	@received_messages= PrivateMessage.where('receiver_id=?', current_user.id).all
  end

  def create
    if PrivateMessage.is_new_conversation?(current_user.id, params[:private_message][:receiver_id])
      
    end
    @user= User.find(params[:private_message][:receiver_id])
  	message= current_user.sent_messages.create!(receiver_id: params[:private_message][:receiver_id], 
  		title: params[:private_message][:title], 
  		body: params[:private_message][:body])
  	redirect_to message, flash: { success: "Message successfully sent.
        #{params}"}
  end

  def destroy
  end
  
  private

    def must_have_profile
      if current_user.profile.nil?
        redirect_to new_profile_path, flash: { notice: "Please create a profile to view other profiles."}
      end
    end
end
