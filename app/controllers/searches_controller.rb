class SearchesController < ApplicationController
  before_filter :must_have_profile
  require 'will_paginate/array'

  def new
  	@search= current_user.profile.searches.last || Search.new
  end

  def create
  	@search= current_user.profile.searches.build(params[:search])
  	if @search.save
      redirect_to @search, flash: { success: "Search successful!" }
    else
      render 'new'
    end  
  end

  def show
  	@search= Search.find(params[:id])
    @profiles= (@search.profiles.visible - Profile.hidden_and_hidden_by(current_user.profile))
    @profiles_count= @profiles.count
    @profiles= @profiles.paginate(page: params[:page], per_page: 20)
  end

  def update
    @search= Search.find(params[:id])
    if @search.update_attributes(params[:search])
      redirect_to @search, flash: { success: "Here are your search results" }
    else
      redirect_to root_url, flash: { error: "Could not complete search, here's a cookie" }
    end  

  end

  private

  	def must_have_profile
  		redirect_to root_path, flash: { error: "You must have a profile to do that" } unless current_user.profile
  	end
end
