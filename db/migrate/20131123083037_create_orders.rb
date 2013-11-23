class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customerId
      t.integer :productId
      t.integer :domainId
      t.string :sitename

      t.timestamps
    end
  end
end
