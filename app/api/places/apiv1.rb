module Places
  class APIV1 < Grape::API
    version 'v1', :using => :header

    resource :place do
      
      desc "Returns a place for an id"
      get '/:id' do
        place = Place.find(params[:id])
        present place, :with => Places::PlaceResponseEntity
      end
    end
  end
end
