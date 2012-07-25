class PagesController < ApplicationController
  skip_before_filter :authenticate
  def home
  end

  def about
  end

  def contact
  end

  def help
  end
end
