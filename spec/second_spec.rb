require "rspec"
include RSpec::Expectations
RSpec.describe Appointment1Controller, type: :controller do
  describe "get #view" do
    it "updates availability and creates a listing" do
      master = Master.create(name: "Sample Master")
      availability = Availability.create(date: "2023-01-01", master_id: master.id, available: 1)

      post :view, params: { name: "John Doe", phoneNumber: "ch@gmai.com", date: "2023-01-01", master_name: "Sample Master" }

      expect(response).to have_http_status(:success)
      availability.reload
      expect(availability.available).to eq(0)

      expect(response.body).to include("http://127.0.0.1:3000/")
      expect(ListingAp.where(date: "2023-01-01", email: "ch@gmai.com")).to exist
    end

    it "handles unchanged availability" do
      master = Master.create(name: "Sample Master")
      availability = Availability.create(date: "2023-01-01", master_id: master.id, available: 0)

      post :view, params: { name: "John Doe", phoneNumber: "ch@gmai.com", date: "2023-01-01", master_name: "Sample Master" }

      expect(response).to have_http_status(:success)
      availability.reload
      expect(availability.available).to eq(0)

      expect(response.body).to include("http://127.0.0.1:3000/")
      expect(ListingAp.where(date: "2023-01-01", email: "123-456-7890")).not_to exist
    end

    it "handles failed availability update" do
      allow_any_instance_of(Availability).to receive(:save).and_return(false)
      master = Master.create(name: "Sample Master")
      availability = Availability.create(date: "2023-01-01", master_id: master.id, available: 1)

      post :view, params: { name: "John Doe", phoneNumber: "ch@gmai.com", date: "2023-01-01", master_name: "Sample Master" }

      expect(response).to have_http_status(:success)
      availability.reload
      expect(availability.available).to eq(1)

      expect(response.body).to include("http://127.0.0.1:3000/")
      expect(ListingAp.where(date: "2023-01-01", email: "123-456-7890")).not_to exist
    end
  end
end
