module Places
  class LocationResponseEntity < Grape::Entity
    expose :latitude
    expose :longitude
  end
end
