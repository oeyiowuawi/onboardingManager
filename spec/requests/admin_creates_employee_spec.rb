require "rails_helper"

describe "Admin Creates an Employee" do
  describe "and creates the employee" do
    it "returns a status code of 201" do
      employee = create(:employee, status: true)
      create(:admin, employee: employee, department: employee.department)
      token = AuthToken.encode(employee_id: employee.id)

      post(
        "/api/v1/admin/employees",
        params: { email: "new_employee@andela.com",
                  password: "I am new here",
                  name: "New Employee"
                  department_id: employee.department.id
        }.to_json,
        headers: { "Content-Type" => "application/json",
                   "AUTHORIZATION" => token
        }
      )
    end
  end
end
