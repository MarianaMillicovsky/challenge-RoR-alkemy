class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.belongs_to :genre
      t.string :image_url
      t.string :title
      t.date :date_of_creation
      t.integer :rating

      t.timestamps
    end
  end
end
