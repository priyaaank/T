class Category

  include Mongoid::Document

  field :name, :type => String

  belongs_to :place

end
