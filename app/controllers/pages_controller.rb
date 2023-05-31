class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home legal about search style]
  before_action :set_racoons

  def home
    @users
  end

  def style; end
  def legal; end
  def about; end

  private
  # Be reminded we need to change user to racoons.
  def set_racoons
    @users = User.all
  end
end
