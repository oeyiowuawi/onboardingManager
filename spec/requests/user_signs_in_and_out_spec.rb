require "rails_helper"

describe "Session management", type: :request do

  describe "logging in" do
    it "returns a token" do
      employee = create(:employee)

      post(
        "/api/v1/login",
        params: { email: employee.email, password: employee.password}.to_json,
        headers: { "Content-Type" => "application/json" }
      )

      body = JSON.parse(response.body)
      expect(body["auth_token"]).to be_a(String)
    end
  end
end
