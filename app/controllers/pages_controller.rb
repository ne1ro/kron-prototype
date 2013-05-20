class PagesController < ApplicationController
  layout 'simple'
  def home
    @title = 'Home'
    render :layout => 'layouts/application'
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

  def sign_up
    @title = 'Sign up'
  end
end
