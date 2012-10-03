module Reviews
  class ReviewResponseEntity < Grape::Entity
    expose :text
    expose :review_date, :as => :review_datetime
    expose :rating_value, :as => :rating
  end
end
