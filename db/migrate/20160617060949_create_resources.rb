class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :business_name
      t.text :resource
      t.string :web
      t.string :name
      t.string :email
      t.string :phone
      t.string :street
      t.string :city_state_zip
      t.integer :user_id
      t.timestamps
    end
  end
end
