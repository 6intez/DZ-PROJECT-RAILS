require 'rails_helper'

RSpec.describe "MyAccounts", type: :request do
  describe "GET /view" do
    it "returns http success" do
      get "/my_account/view"
      expect(response).to have_http_status(:success)
    end
  end

end
