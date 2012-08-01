class SearchesController < ApplicationController
  before_filter :must_have_profile

  def new
  	@search= Search.new
  end

  def create
  	@search= Search.create!(params[:search])
  	redirect_to @search
  end

  def show
  	@search= Search.find(params[:id])
  end

  private

  	def must_have_profile
  		redirect_to root_path, flash: { error: "You must have a profile to do that" } unless current_user.profile
  	end
end
