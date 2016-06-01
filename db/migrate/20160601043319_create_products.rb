class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.text :image_path

      t.timestamps null: false
    end
  end
end
