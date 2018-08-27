class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.references :department, foreign_key: true, index: true
      t.references :employee, foreign_key: true, index: true

      t.timestamps
    end
  end
end
