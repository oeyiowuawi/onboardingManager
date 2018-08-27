class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.belongs_to :employee, foreign_key: true
      t.boolean :done, default: false
      t.date :due_date
      t.integer :created_by_id

      t.timestamps
    end
  end
end
