class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :rating, :integer
    add_column :users, :phone_number, :string
    add_column :users, :age, :integer
    add_column :users, :bio, :text
  end
end
