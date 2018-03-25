class AddWardIdToPharmacist < ActiveRecord::Migration[5.1]
  def change
    add_reference :pharmacists, :ward, foreign_key: true
  end
end
