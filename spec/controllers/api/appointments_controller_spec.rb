RSpec.describe Api::AppointmentsController do

  describe "#index" do
    it "returns json data" do
      get :index, format: :json
      p response.body
      p response.status
      expect(response.status).to eq(200)
    end
  end
end
