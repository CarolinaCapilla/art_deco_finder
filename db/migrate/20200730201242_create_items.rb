class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
