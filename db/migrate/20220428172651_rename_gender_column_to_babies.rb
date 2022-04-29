class RenameGenderColumnToBabies < ActiveRecord::Migration[6.0]
  def change
    rename_column :babies, :gender, :gender_id
  end
end
