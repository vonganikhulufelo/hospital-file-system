class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :fname
      t.string :lname
      t.datetime :birthdate
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.text :address
      t.string :title
      t.datetime :consutation
      t.string :phone
      t.string :bloodtype
      t.string :nextname
      t.string :nextphone
      t.string :nextaddress1
      t.string :nextaddress2
      t.string :nextaddress3
      t.string :nextaddress4
      t.text :nextaddress
      t.string :ralationship
      t.references :hospital, foreign_key: true
      t.references :ward, foreign_key: true
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
