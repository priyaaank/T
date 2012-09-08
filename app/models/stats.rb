class Stats

  include Mongoid::Document

  field :likes, :type => Integer
  field :dislikes, :type => Integer

end
