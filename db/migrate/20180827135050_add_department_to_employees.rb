class AddDepartmentToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :department_id, :integer, index: true, null: false
  end
end
