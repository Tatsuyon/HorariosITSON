class User < ApplicationRecord
    attr_accessor :login
    
    #getter
    
    #def login
    #   @login
    #end
    
    #setter
    
    #def login=(str)
    #   @login = str
    #end
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    def self.find_for_database_authentication warden_condition
        conditions = warden_condition.dup
        login = conditions.delete(:login)
        where(conditions).where(
            ["lower(username) = :value", 
                {value: login.strip.downcase}]).first 
    end
end
