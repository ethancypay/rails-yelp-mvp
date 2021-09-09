class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content

      t.timestamps

      t.belongs_to :restaurant
    end
  end
end
