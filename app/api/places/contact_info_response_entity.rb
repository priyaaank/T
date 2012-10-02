module Places
  class ContactInfoResponseEntity < Grape::Entity
    expose :address_line_1
    expose :address_line_2
    expose :address_line_3
    expose :city
    expose :country
    expose :zipcode
    expose :state
  end
end
