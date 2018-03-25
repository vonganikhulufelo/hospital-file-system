class AddBpToPatientrecord < ActiveRecord::Migration[5.1]
  def change
    add_column :patientrecords, :bp, :string
  end
end
