class ContactInfo

  include Mongoid::Document

  field :address_line_1, :type => String
  field :address_line_2, :type => String
  field :address_line_3, :type => String
  field :landmark, :type => String
  field :city, :type => String
  field :country, :type => String
  field :zipcode, :type => String
  field :state, :type => String

  embeds_many :phone_numbers

end
