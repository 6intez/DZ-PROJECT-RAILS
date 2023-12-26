class Appointment1Controller < ApplicationController
  def index
    # Делаем что-то с полученными значениями, например, создаем новую запись в базе данных
  end



  def view

    name = params[:name]
    phoneNumber = params[:phoneNumber]
    date1 = params[:date]
    master_name = params[:master_name]
    @result = "error"
    if (name!= "") && (phoneNumber != "") && (date1 != "") && (master_name != "")
      master = Master.find_by(name: master_name)
      id = master.id
      availabilities = Availability.find_by(date: date1, master_id: id)
      availabilities.availible = 0

      if availabilities.changed?
        if availabilities.save
          @result = "Success"
         post=ListingAp.new(date: date1, email: phoneNumber, master_name: master_name)
         post.save
        else
          @result = "Fault"
        end
      else
        @result = "nothing changed"
      end
    else
      @result = "error"
    end



    render json: {response: @result}








  end
end
