module Itineraries
  class APIV1 < Grape::API

    resource :itinerary do

      desc "Returns an itinerary for a given id"
      get "/:id" do
        itinerary = Itinerary.find(params[:id])
        present itinerary, :with => Itineraries::ItineraryResponseEntity
      end

    end

  end
end
