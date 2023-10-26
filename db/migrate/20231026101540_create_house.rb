class CreateHouse < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.string :house_name
      t.string :house_image
      t.string :location
      t.string :description
      t.timestamps
    end
  end
end
