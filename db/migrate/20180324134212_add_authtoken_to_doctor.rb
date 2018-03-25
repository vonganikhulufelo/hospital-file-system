class AddAuthtokenToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :doctor_token, :string
  end
end
