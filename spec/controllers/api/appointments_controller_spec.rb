RSpec.describe Api::AppointmentsController do

  describe "#index" do
    it "returns json data" do
      get :index
      expect(response.status).to eq(204)
    end
  end
end
