class CreatePatientrecords < ActiveRecord::Migration[5.1]
  def change
    create_table :patientrecords do |t|
      t.integer :age
      t.string :heartrate
      t.decimal :weight
      t.text :illness
      t.text :prescription
      t.boolean :drugcollected
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
