class CreateStudent < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.date :date_of_birth, null: false

      t.timestamps
    end
  end
end
