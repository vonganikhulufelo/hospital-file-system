class CreateNurses < ActiveRecord::Migration[5.1]
  def change
    create_table :nurses do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :title
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.text :address
      t.string :phone
      t.string :wardno
      t.string :roomno
      t.string :role
      t.string :specialisation
      t.string :hname
      t.string :password_digest
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
