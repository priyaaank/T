module Places
  class PhotoResponseEntity < Grape::Entity
    expose :_id, :as => :id
    expose :url
    expose :caption
    expose :type
  end
end
