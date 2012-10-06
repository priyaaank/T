module Itineraries
  class StopoverResponseEntity < Grape::Entity
    expose :name, :as => :stopover_name
    expose :description
    expose :point_of_interest_details, :as => :point_of_interest, :using => Places::PlaceResponseEntity
  end
end
