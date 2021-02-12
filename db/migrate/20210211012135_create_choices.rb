class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.references :question, foreign_key: true
      t.integer :ans_cnt, default: 0

      t.timestamps
    end
  end
end
