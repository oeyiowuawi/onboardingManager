require "rails_helper"

describe "Admin Creates an Employee" do
  describe "and creates tasks for employee" do
    it "returns a status code of 201" do
      admin_employee = create(:employee, status: true)
      create(:admin, employee: admin_employee, 
                     epartment: admin_employee.department)
      token = AuthToken.encode(employee_id: admin_employee.id)
      employee = create(:employee, department: admin_employee.department)

      post(
        "/api/v1/admin/tasks",
        params: { description: "Pick up Laptop from IT"
                  employee_id: employee.id
        }.to_json,
        headers: { "Content-Type" => "application/json",
                   "AUTHORIZATION" => token
        }
      )

      expect(response.status).to eq(201)
    end
  end
end
