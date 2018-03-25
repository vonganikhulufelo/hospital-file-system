class AddAuthtokenToNurse < ActiveRecord::Migration[5.1]
  def change
    add_column :nurses, :nurse_token, :string
  end
end
