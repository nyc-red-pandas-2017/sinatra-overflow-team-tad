class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
        t.column :first_name, :string, null: false
        t.column :last_name, :string, null: false
        t.column :username, :string, null: false
        t.column :email, :string, null: false
        t.column :password_hash, :string, null: false
    end
  end
end
