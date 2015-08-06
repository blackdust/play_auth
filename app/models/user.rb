class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email,              type: String, default: ""
  field :name,               type: String
  #field :password,           type: String
  field:password_digest, type:String
  #attr_accessor :password_confirmation

  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  #validates_confirmation_of :password

  has_secure_password
end
