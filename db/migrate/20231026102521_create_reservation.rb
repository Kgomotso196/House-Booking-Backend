class CreateReservation < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :checking_date
      t.string :checkout_date
      t.string :city
      t.string :house_price
      t.references :user, foreign_key: { to_table: :users }
      t.references :house, foreign_key: { to_table: :houses}
      t.timestamps
    end
  end
end
