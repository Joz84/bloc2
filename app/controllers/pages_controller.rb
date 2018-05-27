class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def participants
    @users = User.all
  end
end
