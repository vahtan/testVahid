class User < ActiveRecord::Base



  attr_accessor :repassword

  attr_accessible :username, :password ,:email ,:repassword

  validates :username, :uniqueness => true
  validates :password, :length => { :in => 6..20 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save :validate
  before_save :before_create

  after_save :after_create



  def validate
    errors.add('password', 'Password and confirmation do not match') unless repassword == password
  end

  def before_create
    self.password = User.hash_password(self.password)

  end

  def after_create
    @password = nil
  end

  private

  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
