class AddAuthtokenToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :patient_token, :string
  end
end
