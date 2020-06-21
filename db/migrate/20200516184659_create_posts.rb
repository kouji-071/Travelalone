class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :image_id
      t.text :place_name
      t.string :difficult
      t.integer :user_id

      t.timestamps
    end
  end
end
