class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :author
      t.text :author_bio
      t.string :email
      t.string :web
      t.text :story
      t.integer :user_id
      t.timestamps
    end
  end
end
