class Destination

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  
  embeds_many :categories
  embeds_many :photos
  embeds_many :tips
  embeds_many :reviews
  embeds_many :alternate_names
  embeds_one  :contact_info
  embeds_one  :location
  embeds_one  :stickiness_stats

  has_one     :owner

end
