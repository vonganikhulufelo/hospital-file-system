class AddAuthtokenToHospital < ActiveRecord::Migration[5.1]
  def change
    add_column :hospitals, :hospital_token, :string
  end
end
