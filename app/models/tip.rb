class Tip

  include Mongoid::Document

  field :text, :type => String

  belongs_to :user
  belongs_to :point_of_interest

end
