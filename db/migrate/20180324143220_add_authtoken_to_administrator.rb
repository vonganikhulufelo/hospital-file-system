class AddAuthtokenToAdministrator < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :administrator_token, :string
  end
end
