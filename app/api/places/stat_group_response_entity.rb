module Places
  class StatGroupResponseEntity < Grape::Entity
    expose :likes
    expose :dislikes
  end
end
