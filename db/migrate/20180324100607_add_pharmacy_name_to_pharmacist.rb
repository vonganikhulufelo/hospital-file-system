class AddPharmacyNameToPharmacist < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacists, :pharmacyname, :string
  end
end
