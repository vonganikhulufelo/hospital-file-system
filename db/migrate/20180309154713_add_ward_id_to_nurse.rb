class AddWardIdToNurse < ActiveRecord::Migration[5.1]
  def change
    add_reference :nurses, :ward, foreign_key: true
  end
end
