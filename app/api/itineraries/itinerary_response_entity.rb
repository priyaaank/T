module Itineraries
  class ItineraryResponseEntity < Grape::Entity
    expose :name
    expose :description
    expose :stopovers, :using => Itineraries::StopoverResponseEntity
  end
end
