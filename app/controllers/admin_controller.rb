class AdminController < ApplicationController
  def input
    @master = User.all


    @zap = ListingAp.all
  end

  def view
  end
end
