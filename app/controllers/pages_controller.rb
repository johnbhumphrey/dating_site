class PagesController < ApplicationController
  skip_before_filter :authenticate
  def home
  	if signed_in? && current_user.profile
  		@feed_items= current_user.news_feed
	  	@viewed_count= current_user.profile.viewed_by.count
      @favorited_by_count= current_user.profile.favorited_by.count
      @search = Search.where("profile_id= ? AND save_search= ?", current_user.profile, true)
      @search.any? ? @search= @search.last : @search= Search.new
      @new_members= Profile.generate_random_profiles(Profile.limit(30)-
        Profile.hidden_and_hidden_by(current_user.profile), @search)
    else
      @search= Search.new
      @new_members= Profile.generate_random_profiles(Profile.limit(30), Search.new)  
  	end

  end

  def about
  end

  def contact
  end

  def help
  end
end
