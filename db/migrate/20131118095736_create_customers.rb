class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :repassword
      t.timestamps
    end
  end
end
