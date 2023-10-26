class CreateReservation < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :houses, :house_name, null: false
      t.references :users, :name, null: false
      t.string :checking_date
      t.string :checkout_date
      t.string :city
      t.string :house_price
      t.timestamps
    end
  end
end
