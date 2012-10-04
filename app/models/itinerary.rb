class Itinerary

  include Mongoid::Document

  field :name, :type => String
  field :description, :type => String

  embeds_many :stopovers

end
