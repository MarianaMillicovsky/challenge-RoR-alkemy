class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.belongs_to :movie
      t.string :image_url
      t.string :name
      t.integer :age
      t.decimal :weight
      t.string :history

      t.timestamps
    end
  end
end
