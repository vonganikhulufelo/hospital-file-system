class AddWardIdToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_reference :doctors, :ward, foreign_key: true
  end
end
