module Itineraries
  class StopoverResponseEntity < Grape::Entity
    expose :name, :as => :stopover_name
    expose :description
    expose :point_of_interest_details, :with => ::Places::PlaceResponseEntity, :as => :point_of_interest
  end
end
