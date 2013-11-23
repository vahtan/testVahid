class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :repassword
      t.string :siteName
      t.timestamps
    end
  end
end
