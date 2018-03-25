class AddWardNameToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :wname, :string
  end
end
