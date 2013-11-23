class Package < ActiveRecord::Base

      attr_accessor :repassword
      attr_accessible :username, :password, :email, :repassword, :siteName

      validates :username, :uniqueness => true
      validates_presence_of :username
      validates :siteName, :uniqueness => true
      validates_presence_of :siteName
      validates :password, :length => { :in => 6..20 }
      validates_presence_of :password
      validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    #  before_save :validate
      before_save :before_create

      after_save :after_create



      def before_create
          self.password = Package.hash_password(self.password)
      end

      def after_create
          @password = nil
      end

      private
      def self.hash_password(password)
          Digest::SHA1.hexdigest(password)
      end

end
