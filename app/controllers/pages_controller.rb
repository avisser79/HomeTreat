class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :confirm]
  def home
  end

  def confirm
  end
end
