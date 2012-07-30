class FavoritesController < ApplicationController
  before_filter :must_have_profile
  before_filter :must_be_right_user, only: [ :destroy ]
  def new
  end

  def create
  	@profile= Profile.find(params[:profile_id])
  	@favorite= current_user.profile.favorites.build(favoritee_id: @profile.id)
  	respond_to do |f|
  		if @favorite.save
  			f.js {}
  			f.html { redirect_to root_url, flash: { success: "TURN ON YOUR JS NUB"} }
  		else
  			f.html { redirect_to @profile, flash: { error: "Couldn't favorite user, dunno why" } }
  		end
  	end	
  end

  def index
    @favorites= current_user.profile.favorites
    @favorited_by= current_user.profile.favorited_by
  end

  def destroy
  	@profile= Profile.find(params[:profile_id])
  	#@favorite= current_user.profile.favorites.find_by_favoritee_id(params[:profile_id])
  	respond_to do |f|
  		if @favorite.destroy
  			f.js {}
  			f.html {redirect_to root_url, flash: { success: "destroyed relationship, enable JS"}}
  		else
  			f.html { redirect_to @profile, flash: { error: "Could not destroy favorite..." }}
  		end	
  	end	
  end

  private

    def must_have_profile
      redirect_to root_path unless current_user.profile, flash: { error: "No permission to do that bra" }
    end

    def must_be_right_user
      @favorite= Favorite.find(params[:id])
      redirect_to root_path unless current_user.profile.favorites.include?(@favorite)
    end
end
