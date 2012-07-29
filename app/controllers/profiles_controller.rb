class ProfilesController < ApplicationController
  before_filter :must_have_profile, only: [ :update, :show, :edit, :index ]
  before_filter :must_be_own_profile, only: [ :update, :edit, :destroy ]
  
  def new
    @profile= Profile.new
  end

  def create
    @profile= current_user.build_profile(params[:profile])
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
    @profiles= Profile.paginate(page: params[:page], per_page: 30).where(hidden: false)
    @side_profiles= Profile.generate_random_profiles(@profiles.all)
  end

  def destroy
    @profile= Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path, flash: { success: "Successfully deleted profile." }
  end

  private

    def must_have_profile
      if current_user.profile.nil?
        redirect_to new_profile_path, flash: { notice: "Please create a profile to view other profiles."}
      end
    end

    def must_be_own_profile
      @profile= Profile.find(params[:id])
      unless current_user.profile == @profile
        redirect_to root_path
        flash[:error]= "Get the fuck out of here"
      end
    end
end
