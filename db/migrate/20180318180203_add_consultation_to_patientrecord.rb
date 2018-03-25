class AddConsultationToPatientrecord < ActiveRecord::Migration[5.1]
  def change
    add_column :patientrecords, :consultation, :datetime
  end
end
