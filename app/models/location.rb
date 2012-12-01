class Location

  include Mongoid::Document

  field :cordinates, :type => Array

  embedded_in :place

  def latitude
    cordinates[0]
  end

  def longitude
    cordinates[1]
  end

end
