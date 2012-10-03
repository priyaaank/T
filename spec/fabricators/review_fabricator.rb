Fabricator(:review) do
  text "Eiffel tower is one of the most breathtaking sites anywhere in the world"
  rating_value 5
  review_date { DateTime.now }
  reviewer { Fabricate(:user) }
  place
end
