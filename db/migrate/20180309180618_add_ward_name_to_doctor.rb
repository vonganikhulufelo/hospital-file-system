class AddWardNameToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :wname, :string
  end
end
