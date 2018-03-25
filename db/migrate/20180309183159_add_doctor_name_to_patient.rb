class AddDoctorNameToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :dname, :string
  end
end
