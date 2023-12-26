class MyAccountController < ApplicationController
  def view
    if current_user
    @email = current_user.email
    @history_zap = ListingAp.where(email: @email)
    end

  end


end
