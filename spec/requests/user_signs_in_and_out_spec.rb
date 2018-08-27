require "rails_helper"

describe "Session management", type: :request do
  before(:all) do
    header = {
      "Content-Type" => "application/json"
    }
  end
  describe "logging in" do
    it "returns a token" do
      user = create(:user)

      post("/api/v1/login", { email: user.email, password: user.password}.to_json, header)

      body = JSON.parse(response.body)
      expect(body["auth_token"]).to be_a(String)
    end
  end
end
