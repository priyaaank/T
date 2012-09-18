class Photo

  include Mongoid::Document

  field :url, :type => String
  field :caption, :type => String
  field :type, :type => String
  
  embedded_in :destination

end
