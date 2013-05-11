class PagesController < ApplicationController
  def home
    @title = 'Home'
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
end
