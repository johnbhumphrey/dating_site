class PrivateMessagesController < ApplicationController
  before_filter :must_have_profile

  def new
    
  end

  def show
  	@current_message= PrivateMessage.find(params[:id])
  	unless (current_user.id==@current_message.receiver_id) || (current_user.id== @current_message.sender_id)
  		redirect_to root_path, flash: { error: "You don't have permission to access this page."}
  	end
    if @current_message.conversation   #this bit of ensures the conversation head gets passed in
      @current_message= @current_message.conversation         
    end 
  	@sender= User.find(@current_message.sender_id).profile 
    @receiver= User.find(@current_message.receiver_id).profile
    @sender==current_user.profile ? @other_user= @receiver : @other_user= @sender
  end

  def index
    @messages= PrivateMessage.where("sender_id= ? OR receiver_id= ?", current_user.profile.id,
        current_user.profile.id)
  end

  def create
    convo= PrivateMessage.current_conversation(current_user.id, params[:private_message][:receiver_id])
    if convo.nil?
      message= current_user.sent_messages.build(params[:private_message])
      if message.save
        redirect_to message, flash: { success: "Sent message successfully" }
      else
        redirect_to Profile.find(params[:private_message][:receiver_id]), flash: 
            { error: "Could not create the message, please try again" }
      end
    else
      message= convo.replies.create!(params[:private_message])
      redirect_to message
    end

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
