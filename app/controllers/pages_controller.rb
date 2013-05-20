class PagesController < ApplicationController
  layout 'simple'
  def home
    @title = 'Home'
    render :layout => 'layouts/application'
  end

  def welcome
    @title = 'Welcome!'
    @user = ''
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
