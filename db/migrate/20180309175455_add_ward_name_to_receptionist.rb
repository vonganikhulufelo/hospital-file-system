class AddWardNameToReceptionist < ActiveRecord::Migration[5.1]
  def change
    add_column :receptionists, :wname, :string
  end
end
