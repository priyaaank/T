Fabricator(:photo) do
  url { sequence(:url) { |i| "http://example.com/photo/#{i}" } } 
  caption "The vivid picture of the place"
  type "jpeg"
end
