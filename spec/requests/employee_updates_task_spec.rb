require "rails_helper"

describe "Employee updates task" do
  context "and marks it as done" do
    it "returns a status of 200" do
      employee = create(:employee, status: true)
      token = AuthToken.encode(employee_id: employee.id)
      task = create(:task, employee: employee, done: false)

      put(
        "/api/v1/tasks/#{task.id}",
        params: { done: true }.to_json,
        headers: { "Content-Type" => "application/json",
                   "AUTHORIZATION" => token
        }
      )

      expect(response.status).to eq(200)
    end
  end
end
