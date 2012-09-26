class StatGroup

  include Mongoid::Document

  field :likes, :type => Integer
  field :dislikes, :type => Integer

  embedded_in :place

end
