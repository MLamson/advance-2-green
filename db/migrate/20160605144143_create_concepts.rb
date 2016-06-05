class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.text :description
      t.string :status
      t.string :link
      t.string :category
      t.string :name
      t.string :email
      t.text :need
      
      t.timestamps
    end
  end
end
