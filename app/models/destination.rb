class Destination

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  
  embeds_many :categories
  embeds_many :photos
  embeds_many :alternate_names
  embeds_one  :location
  embeds_one  :stats
  embeds_one  :contact_info, :as => :contactable

  has_many :tips
  has_many :reviews

  has_one :user, :as => :owner

end
