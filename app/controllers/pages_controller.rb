class PagesController < ApplicationController
  skip_before_filter :authenticate
  def home
  	if signed_in? && current_user.profile
  		@feed_items= current_user.news_feed
	  	@viewed_count= current_user.profile.viewed_by.count
  	end
  	@new_members= Profile.generate_random_profiles(Profile.limit(15))
  end

  def about
  end

  def contact
  end

  def help
  end
end
