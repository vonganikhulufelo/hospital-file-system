class AddDNameToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :dname, :string
  end
end
