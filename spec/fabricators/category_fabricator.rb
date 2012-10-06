Fabricator(:category, :from => :category) do
  name "Category"
  identifier "category"
end

Fabricator(:monuments, :from => :category) do
  name "monuments"
end

Fabricator(:hotels, :from => :category) do
  name "hotels"
end
