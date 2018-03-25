class AddAuthtokenToPharmacyrecord < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacyrecords, :pharmacyrecord_token, :string
  end
end
