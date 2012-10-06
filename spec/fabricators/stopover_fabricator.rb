Fabricator(:stopover, :aliases => [:eiffel_tower_stopover]) do
  initialize_with { place = Fabricate(:place); place.save!; Stopover.at(place) }
  name        "Eiffel Tower"
  description "Mid day stop for view and lunch"
end

Fabricator(:hilton_hotel_stopover, :from => :stopover) do
  initialize_with { place = Fabricate(:hilton_hotel); place.save!; Stopover.at(place) }
  name "Hilton Hotel"
  description "Super comfy and pocket shredding expensive hotel"
end
