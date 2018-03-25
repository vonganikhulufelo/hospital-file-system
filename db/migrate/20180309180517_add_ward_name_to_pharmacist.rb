class AddWardNameToPharmacist < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacists, :wname, :string
  end
end
