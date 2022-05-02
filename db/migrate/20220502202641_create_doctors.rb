class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :details
      t.string :photo
      t.string :city
      t.string :specialization
      t.decimal :cost
      t.timestamps
    end
  end
end

Doctor.new(name: "Ranjeet", details: "details", photo: "photo", city: "city", specialization: "speciality", cost: 200)
