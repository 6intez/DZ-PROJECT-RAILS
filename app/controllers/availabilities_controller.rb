class AvailabilitiesController < ApplicationController
  def index
    @master = Master.find_by(name: params[:name])
    @availabilities = @master.availabilities.where(availible: 1).pluck(:date)
    render json: @availabilities
  end
  #update
   def destroy
    email = params[:email]
    date = params[:date]
    list_ap = ListingAp.find_by(email: email, date: date)
    if list_ap.nil?

      render json: { redirect: "http://127.0.0.1:3000/my_account/view" }


    else
      mast_name = list_ap.master_name
      @master_id= Master.find_by(name: mast_name)
      @appointment = Availability.find_by(date: date, master_id: @master_id.id)
      @appointment.update(availible: 1)
      @appointment.save
      if @appointment.availible == 1
        list_ap.destroy
        @result = "Success"
      else
        @result = "Fail"
      end
      render json: {response: @result}

    end


  end


end
