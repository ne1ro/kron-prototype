class PagesController < ApplicationController
  layout 'simple'
  def home
    if user_signed_in?
      @title = 'Home'
      render :layout => 'layouts/application'
    else
      redirect_to '/welcome'
    end
  end

  def welcome
    @title = 'Welcome!'
  end

  def tour
    @title = 'Tour'
  end

  def about
    @title = 'About'
  end

  def terms
    @title = 'Terms'
  end

end
