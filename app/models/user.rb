class User < ActiveRecord::Base

  has_many :messages
	
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true
  validates :mobile_no, presence: true, length: { minimum: 10, maximum: 10 }

  has_secure_password


end