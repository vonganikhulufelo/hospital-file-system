class CreatePharmacies < ActiveRecord::Migration[5.1]
  def change
    create_table :pharmacies do |t|
      t.string :pharmacyname
      t.string :pahrmacyno
      t.string :wardno
      t.string :hname
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
