class AddWardNameToNurse < ActiveRecord::Migration[5.1]
  def change
    add_column :nurses, :wname, :string
  end
end
