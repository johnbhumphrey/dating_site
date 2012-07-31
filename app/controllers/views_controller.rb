class ViewsController < ApplicationController
  before_filter :must_have_profile
  before_filter :correct_user, only: [:index]

  require 'will_paginate/array'

  def new
  end

  def create

  end

  def index
  	@viewed_profiles= current_user.profile.views.uniq_by { |f| f[:viewed_id] }
  	@viewed_by= current_user.profile.reverse_views.uniq_by { |f| f[:viewer_id] }
  	@viewed_profiles= @viewed_profiles.paginate(page: params[:page], per_page: 5)
  end

  private

      def must_have_profile
        if current_user.profile.nil?
          redirect_to new_profile_path, flash: { notice: "Please create a profile to view other profiles."}
        end
      end

      def correct_user
      	@profile= Profile.find(params[:profile_id])
      	unless current_user.profile == @profile
      		redirect_to root_path, flash: { error: "Stop trying to do that bra" }
      	end
      end

end
