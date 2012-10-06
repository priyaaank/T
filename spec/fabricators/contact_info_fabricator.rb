Fabricator(:eiffel_tower_address, :from => :contact_info) do
  address_line_1 "Eiffel Tower"
  address_line_2 "Avenue Gustave Eiffel"
  city "Paris"
  country "France"
  zipcode "75007"
  contactable(:fabricator => :place)
end

Fabricator(:hilton_hotel_address, :from => :contact_info) do
  address_line_1 "London Hilton on Park Lane Hotel"
  address_line_2 "22 Park Lane"
  city "London"
  country "United Kingdom"
  zipcode "W1K1BE"
  contactable(:fabricator => :place)
end
