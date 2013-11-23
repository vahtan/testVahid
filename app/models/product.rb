class Product < ActiveRecord::Base


    attr_accessible :pname,:price

    validates :pname, :uniqueness => true
    validates_presence_of :pname

    validates_presence_of :price

end
