class AddFieldsToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :address, :string
    add_column :doctors, :phone, :integer
    add_column :doctors, :email, :string
    add_column :doctors, :image, :string
  end
end
