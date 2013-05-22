class PagesController < ApplicationController
  layout 'simple'
  def welcome
    @title = 'Welcome!'
    if user_signed_in?
      redirect_to user_path(current_user)
    end
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
