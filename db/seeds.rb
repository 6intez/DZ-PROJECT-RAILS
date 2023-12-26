# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#создание мастеров


#создание дат и времени для мастеров

master1= Master.create(name: 'Мария')
availability3 = Availability.create(master: master1, date:Date.today+3,availible: 1)
availability4 = Availability.create(master: master1, date:Date.today+2,availible: 1)
master2= Master.create(name: 'Глеб')
availability5 =  Availability.create(master: master2, date:Date.today+2,availible: 1)
availability11 =  Availability.create(master: master2, date:Date.today+10,availible: 1)
availabilit22 =  Availability.create(master: master2, date:Date.today+13,availible: 1)
availability223 =  Availability.create(master: master2, date:Date.today+14,availible: 1)

Price.create(name: "Стрижка",price:"35")
Price.create(name: "Fade",price:"40")
Price.create(name: "Buzz Cut",price:"30")
Price.create(name: "Классическая",price:"35")
Price.create(name: "Кроп",price:"35")
Price.create(name: "Стрижка усов",price:"35")
Price.create(name: "Стрижка бороды",price:"35")
Price.create(name: "Окрашивание",price:"50")

