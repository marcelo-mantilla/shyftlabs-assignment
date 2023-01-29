class CreateResult < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :student, type: :integer, foreign_key: true, null: false
      t.belongs_to :course, type: :integer, foreign_key: true, null: false
      t.string :grade, null: false

      t.timestamps
    end
  end
end
