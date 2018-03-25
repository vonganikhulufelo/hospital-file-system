class AddNameToPharmacyrecord < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacyrecords, :lname, :string
    add_column :pharmacyrecords, :fname, :string
    add_column :pharmacyrecords, :pid, :integer
    add_column :pharmacyrecords, :prid, :integer
    add_column :pharmacyrecords, :prescription, :text
  end
end
