class PhotosController < ApplicationController
  before_filter :verify_owner, except: [:show, :index]

  def new
    @photo= Photo.new
  end

  def create
  	@photo= @profile.photos.build(params[:photo])
  	if (@profile == current_user.profile) && @photo.save
  		redirect_to @profile, flash: {success: "Photo successfully saved!"}
  	else
  		render 'new'
  	end
  end

  def destroy
  	@photo= Photo.find(params[:id])
    respond_to do |f|
      f.js
      @photo.destroy
    end

  end

  def edit
  	
  end

  def update
  	@photo= Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to @profile, flash: { success: "Successfully updated photo" }
    else
      render 'edit'
    end
  end

  def index
  	@profile = Profile.find(params[:profile_id])

  end

  def show
  	@photo= Photo.find(params[:id])
  end

  private

  	def verify_owner
  		@profile= Profile.find(params[:profile_id])
  		unless @profile == current_user.profile
  			redirect_to root_path, flash: { error: "Can't touch that" }
  		end
  	end
end
