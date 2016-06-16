class CreateGuidances < ActiveRecord::Migration
  def change
    create_table :guidances do |t|
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
