class HiddensController < ApplicationController
  before_filter :must_have_profile

  def new
  end

  def create
  	@profile= Profile.find(params[:profile_id])
  	@hidden= current_user.profile.hidden_profiles.build(receiver_id: params[:profile_id])
  	respond_to do |f|
  		if @hidden.save
  			f.js {}
  			f.html { redirect_to root_url, notice: "naahhahahha" }
  		else
    		f.html { redirect_to @profile, flash: { error: "Could not hide user" } }
  		end
  	end	
  end

  def destroy
    @profile= Profile.find(params[:profile_id])
    @hidden= current_user.profile.hidden_profiles.find_by_receiver_id(params[:profile_id])
    respond_to do |f|
      if @hidden.destroy
        f.js {}
        f.html { redirect_to root_url }
      else
        f.html { redirect_to root_url }
      end
    end  
  end

  def index
  end

  private

    def must_have_profile
      unless current_user.profile
        redirect_to root_path 
        flash[:error]= "No permission to do that bra" 
      end
    end

    
end
