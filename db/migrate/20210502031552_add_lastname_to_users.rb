class AddLastnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lastname, :string
    #add_index :users, :lastname, unique: true
  end