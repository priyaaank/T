class User
  include Mongoid::Document
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :timeoutable

  field :email,                  :type => String, :default => ""
  field :encrypted_password,     :type => String, :default => ""
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time
  field :remember_created_at,    :type => Time
  field :confirmation_token,     :type => String
  field :confirmed_at,           :type => Time
  field :confirmation_sent_at,   :type => Time

  validates_presence_of :email
  validates_presence_of :encrypted_password
end
