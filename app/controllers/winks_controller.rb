class WinksController < ApplicationController
  def new
  end

  def create
  	@profile= Profile.find(params[:profile_id])
    @wink= current_user.profile.sent_winks.build(receiver_id: params[:profile_id])
  	respond_to do |f|
      if @wink.save	
        f.js { }
    		f.html { redirect_to root_url, flash: { success: "Wink sent!" } }
    	else
    		f.html { redirect_to @profile, flash: { error: "Could not sent wink" } }
    	end
    end
  end

  def index
    @received_winks= current_user.profile.received_winks
    @sent_winks= current_user.profile.sent_winks
  end
end
