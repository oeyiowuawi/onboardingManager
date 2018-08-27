class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.boolean :status, null: false, default: false
      t.date :start_date

      t.timestamps
    end
  end
end
