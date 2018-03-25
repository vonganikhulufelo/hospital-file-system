class AddAuthtokenToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :pharmacy_token, :string
  end
end
