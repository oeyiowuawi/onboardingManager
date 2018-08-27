class AddNotiFiedToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :notified, :boolean, default: false
  end
end
