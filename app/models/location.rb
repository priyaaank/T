class Location

  include Mongoid::Document

  field :longitude, :type => Float
  field :latitude, :type => Float

  embedded_in :place

end
