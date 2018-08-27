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

    it "returns a status of 200" do
      employee = create(:employee)

      post(
        "/api/v1/login",
        params: { email: employee.email, password: employee.password}.to_json,
        headers: { "Content-Type" => "application/json" }
      )

      body = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end

  describe "logging out" do
    it "returns a log out message" do
      employee = create(:employee, status: true)
      token = AuthToken.encode(employee_id: employee.id,
                               exp: (Time.now + 3600).to_i)

      get(
        "/api/v1/logout",
        params: {}.to_json,
        headers: { "Content-Type" => "application/json",
                    "AUTHORIZATION" => token }
      )

      body = JSON.parse(response.body)
      expect(body["message"]).to eq("Successfully Logged out")
    end
  end
end
