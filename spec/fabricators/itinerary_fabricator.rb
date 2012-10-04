Fabricator(:itinerary) do
  name "Trip to Paris"
  description "Winter trip with family to somewhere nice"
  stopovers { Array.wrap(Fabricate.build(:stopover)) }
end
