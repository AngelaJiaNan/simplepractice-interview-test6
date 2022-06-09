RSpec.describe Api::AppointmentsController do

  describe "#index" do
    it "returns json data" do
      get :index
      expect(response.status).to eq(200)
    end
  end


  describe "GET /api/appointments" do
    5.times do
      FactoryBot.create(:appointment)
    end

    it "returns all appointments" do
      get "/api/appointments"
      expect(response).to have_http_status(:okay)
      expect(JSON.parse(response.body).length).to eq(5)
    end
  end
end
