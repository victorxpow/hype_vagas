require 'rails_helper'

RSpec.describe "Positions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/positions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/positions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/positions/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /down" do
    it "returns http success" do
      get "/positions/down"
      expect(response).to have_http_status(:success)
    end
  end

end
