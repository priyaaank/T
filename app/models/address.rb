class Address

  include Mongoid::Document

  field :address_line_1, :type => String
  field :address_line_2, :type => String
  field :address_line_3, :type => String
  field :city, :type => String
  field :state, :type => String
  field :zipcode, :type => String
  field :country, :type => String

end
