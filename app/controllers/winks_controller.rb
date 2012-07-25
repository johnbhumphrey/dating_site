class WinksController < ApplicationController
  def new
  end

  def create
  	@wink= current_user.profile.sent_winks.build(receiver_id: params[:id])
  	if @wink.save	
  		redirect_to root_url, flash: { success: "Wink sent!" }
  	else
  		profile= Profile.find(params[:profile_id])
  		redirect_to profile, flash: { error: "Could not sent wink" }
  	end
  end

  def index
  end
end
