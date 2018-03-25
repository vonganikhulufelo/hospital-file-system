class AddHopitaltokenToAdministrator < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :hospital_token, :string
  end
end
