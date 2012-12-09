class Place

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  has_ancestry :orphan_strategy => :restrict

  field :name, :type => String
  field :alternate_names, :type => Array
  
  embeds_many :photos
  embeds_one  :location
  embeds_one  :stat_group
  embeds_one  :contact_info, :as => :contactable

  has_many :tips
  has_many :reviews
  has_many :categories

  has_one :user, :as => :owner

end
