Fabricator(:itinerary_node) do
  component   { Fabricate(:place) }
  name        "Eiffel Tower"
  description "Mid day stop for view and lunch"
  node_order  1
end
