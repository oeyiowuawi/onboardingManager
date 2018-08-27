class AddIndexToEmployeeEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :employees, :email
  end
end
