class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: {to_table: 'users'}, index: true
      t.references :doctor, null: false, foreign_key: {to_table: 'doctors'}, index: true
      t.string :city
      t.string :date
      t.timestamps
    end
  end
end
