class CreateResponseSets < ActiveRecord::Migration[6.0]
  def change
    create_table :response_sets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
