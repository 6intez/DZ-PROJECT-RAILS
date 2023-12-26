class MastersController < ApplicationController
  def available_times
    @name = Master.all.map{|a| a.name}
    render json: @name
  end
end
