class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home legal about search style]
  def home
  end

  def style; end
  def legal; end
  def about; end
end
