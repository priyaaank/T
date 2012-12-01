Fabricator(:place) do
  name "Eiffel Tower"
  alternate_names ['La Tour Eiffel','a dame de fer', 'the iron lady']
  categories { Array.wrap(Fabricate.build(:monuments)) }
  location {Fabricate.build(:location) }
  stat_group { Fabricate.build(:likable) }
  photos { Array.wrap(Fabricate.build(:photo)) }
  after_create { |place| place.contact_info = Fabricate.build(:eiffel_tower_address, :contactable => place); place.save!}
end

Fabricator(:hilton_hotel, :from => :place) do
  name "Hilton Hotel"
  alternate_names ['Hotel la Hilton']
  categories { Array.wrap(Fabricate.build(:hotels)) }
  location { Fabricate.build(:location, :cordinates => [51.505612, -0.149633]) }
  stat_group { Fabricate.build(:likable) }
  photos { Array.wrap(Fabricate.build(:photo)) }
  after_create { |place| place.contact_info = Fabricate.build(:hilton_hotel_address, :contactable => place); place.save!}
end
