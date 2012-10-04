Fabricator(:stopover) do
  point_of_interest   { Fabricate(:place) }
  name        "Eiffel Tower"
  description "Mid day stop for view and lunch"
  node_order  1
end
