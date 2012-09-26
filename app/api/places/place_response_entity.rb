module Places
  class PlaceResponseEntity < Grape::Entity
    expose :name
    expose :_id, :as => :id
    expose :photos, :using => Places::PhotoResponseEntity
  end
end
