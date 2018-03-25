class AddWardIdToReceptionist < ActiveRecord::Migration[5.1]
  def change
    add_reference :receptionists, :ward, foreign_key: true
  end
end
