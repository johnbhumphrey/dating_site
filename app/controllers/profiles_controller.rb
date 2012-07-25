class ProfilesController < ApplicationController
  before_filter :must_have_profile, only: [ :update, :show, :edit, :index ]
  
  def new
    @profile= Profile.new
  end

  def create
    user= current_user
    @profile= user.build_profile(params[:profile])
    @profile.nick_name= current_user.nick_name
    if @profile.save
      redirect_to @profile, flash: { success: "Successfully created profile." }
    else
      render 'new'
    end
  end

  def update
    @profile= Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to @profile, flash: { success: "Successfully updated profile "}
    else
      render 'edit' 
    end
  end

  def show
    @profile= Profile.find(params[:id])
  end

  def edit
    @profile= Profile.find(params[:id])
  end

  def index
    @profiles= Profile.where(hidden: false).all
    @side_profiles= Profile.generate_random_profiles(@profiles)
  end

  private

    def must_have_profile
      if current_user.profile.nil?
        redirect_to new_profile_path, flash: { notice: "Please create a profile to view other profiles."}
      end
    end
end
