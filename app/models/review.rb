class Review

  include Mongoid::Document

  field :text, :type => String
  field :rating_value, :type => Integer
  field :review_date, :type => DateTime

  belongs_to :reviewer, :class_name => "User"
  belongs_to :point_of_interest

end
