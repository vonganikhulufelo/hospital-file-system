class AddAuthtokenToReceptionist < ActiveRecord::Migration[5.1]
  def change
    add_column :receptionists, :receptionist_token, :string
  end
end
