class SearchesController < ApplicationController
  before_filter :must_have_profile

  def new
  	@search= Search.new
  end

  def create
  	@search= current_user.profile.searches.create!(params[:search])
  	redirect_to @search
  end

  def show
  	@search= Search.find(params[:id])
  end

  def update
    @search= Search.find(params[:id])
    if @search.update_attributes(params[:search])
      redirect_to @search, flash: { notice: "Here are your search results" }
    else
      redirect_to root_url, flash: { error: "Could not complete search, here's a cookie" }
    end  

  end

  private

  	def must_have_profile
  		redirect_to root_path, flash: { error: "You must have a profile to do that" } unless current_user.profile
  	end
end
