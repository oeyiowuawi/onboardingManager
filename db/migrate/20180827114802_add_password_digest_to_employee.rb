class AddPasswordDigestToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :password_digest, :string, null: false
  end
end
