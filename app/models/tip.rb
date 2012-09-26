class Tip

  include Mongoid::Document

  field :text, :type => String

  belongs_to :user
  belongs_to :place

end
