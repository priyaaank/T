class PhoneNumber

  include Mongoid::Document

  field :country_code, :type => String
  field :area_code, :type => String
  field :number, :type => String

  def formatted_phone_number
    formatted_country_code = country_code.present? ? ["+", country_code].join : ""
    [formatted_country_code, area_code, number].compact.join(" ").strip
  end

end
