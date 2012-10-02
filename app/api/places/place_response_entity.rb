module Places
  class PlaceResponseEntity < Grape::Entity
    expose :name
    expose :_id, :as => :id
    expose :photos, :using => Places::PhotoResponseEntity
    expose :location, :using => Places::LocationResponseEntity
    expose :stat_group, :as => :stats, :using => Places::StatGroupResponseEntity
    expose :contact_info, :using => Places::ContactInfoResponseEntity
    expose :categories, :using => Places::CategoryResponseEntity
  end
end
