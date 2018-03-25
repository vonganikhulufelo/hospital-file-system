class AddAuthtokenToPharmacist < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacists, :pharmacist_token, :string
  end
end
