class CreatePharmacyrecords < ActiveRecord::Migration[5.1]
  def change
    create_table :pharmacyrecords do |t|
      t.boolean :collected
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
