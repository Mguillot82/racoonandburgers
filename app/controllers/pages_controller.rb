class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home legal about search style]
  before_action :set_racoons, :set_users

  def home; end
  def style; end
  def legal; end
  def about; end

  private

  # Be reminded we need to change user to racoons.
  def set_racoons
    @racoons = Racoon.all
  end

  def set_users
    @users = User.all
  end
end
