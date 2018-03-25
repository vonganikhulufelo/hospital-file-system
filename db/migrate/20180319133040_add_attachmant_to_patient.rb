class AddAttachmantToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :attachment, :string
  end
end
