class CreateWards < ActiveRecord::Migration[5.1]
  def change
    create_table :wards do |t|
      t.string :wname
      t.string :wardno
      t.string :hname
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
