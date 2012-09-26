Fabricator(:place) do
  name "Eiffel Tower"
  alternate_names ['La Tour Eiffel','a dame de fer', 'the iron lady']
  categories { Array.wrap(Fabricate.build(:monuments)) }
  location {Fabricate.build(:location) }
  stat_group { Fabricate.build(:likable) }
  photos { Array.wrap(Fabricate.build(:photo)) }
  after_create { |place| place.contact_info = Fabricate.build(:eiffel_tower_address, :contactable => place); place.save!}
end
