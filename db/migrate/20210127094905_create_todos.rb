class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
