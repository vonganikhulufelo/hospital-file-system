class AddAuthtokenToWard < ActiveRecord::Migration[5.1]
  def change
    add_column :wards, :ward_token, :string
  end
end
