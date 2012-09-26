Fabricator(:eiffel_tower_address, :from => :contact_info) do
  address_line_1 "Eiffel Tower"
  address_line_2 "Avenue Gustave Eiffel"
  city "Paris"
  country "France"
  zipcode "75007"
  contactable(:fabricator => :place)
end
