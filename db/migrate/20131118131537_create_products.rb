class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|


      t.timestamps

      t.string :pname
      t.string :price
    end
  end
end
