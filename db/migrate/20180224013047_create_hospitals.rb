class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :hname
      t.string :htellphone
      t.string :haddress1
      t.string :haddress2
      t.string :haddress3
      t.string :haddresscode
      t.string :haddress

      t.timestamps
    end
  end
end
