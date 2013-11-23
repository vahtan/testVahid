class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :dname
      t.string :price
      t.timestamps
    end
  end
end
