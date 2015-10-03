class StaticPagesController < ApplicationController

  def home
    @posts = Post.all
  end

  def privacy
  end

  def terms_of_use
  end

  def contact
  end

  def about
  end

  def landing
  end

end
