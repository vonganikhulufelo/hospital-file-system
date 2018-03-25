class AddPharmacyIdToPharmacist < ActiveRecord::Migration[5.1]
  def change
    add_reference :pharmacists, :pharmacy, foreign_key: true
  end
end
