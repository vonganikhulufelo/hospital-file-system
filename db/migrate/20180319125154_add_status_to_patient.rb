class AddStatusToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :status, :string
  end
end
