class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string     :hospitalname, null: false
      t.string     :week,         null: false
      t.string     :phone,        null: false
      t.references :baby,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
