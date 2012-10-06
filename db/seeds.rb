#clear all past data
Mongoid.purge!

#Create categories
["Monument", "Hotel", "Nightlife", "Park", "Coffee Shop", "Restaurant"].each do |category|
  Category.create!(:name => category)
end

#create Eiffel Tower as a place
monument_category = Category.where(:name => "Monument").first
eiffel_tower = Place.create!(:name => "Eiffel Tower", :alternate_names => ['La Tour Eiffel','a dame de fer', 'the iron lady'],
                             :categories => [monument_category], :location => Location.new(:latitude => 48.858165, :longitude => 2.295354),
                             :stat_group => StatGroup.new(:likes => 200, :dislikes => 100)
                            )
photo_of_eiffel_tower = Photo.new(:url => "http://example.com/photo/1",
                                  :caption => "Eiffel Tower in its glory",
                                  :type => "jpeg"
                                 )
eiffel_tower.photos << photo_of_eiffel_tower

contact_info_for_eiffel_tower = ContactInfo.new(:address_line_1 => "Eiffel Tower",
                                                :address_line_2 => "Avenue Gustave Eiffel",
                                                :city => "Paris",
                                                :country => "France",
                                                :zipcode => "75007",
                                                :contactable => eiffel_tower
                                               )
eiffel_tower.contact_info = contact_info_for_eiffel_tower
eiffel_tower.save!


#create Hilton Hotel Prime as a hotel
monument_category = Category.where(:name => "Hotel").first
hilton_prime = Place.create!(:name => "Hilton Prime", :alternate_names => ["Hilton Priemiere"],
                             :categories => [monument_category], :location => Location.new(:latitude => 51.505612, :longitude => -0.149633),
                             :stat_group => StatGroup.new(:likes => 10, :dislikes => 200)
                            )
photo_of_hilton_prime = Photo.new(:url => "http://example.com/photo/200",
                                  :caption => "Lobby of Hilton Prime",
                                  :type => "png"
                                 )
hilton_prime.photos << photo_of_hilton_prime

contact_info_for_hilton_prime = ContactInfo.new(:address_line_1 => "London Hilton on Park Lane Hotel",
                                                :address_line_2 => "22 Park Lane",
                                                :city => "London",
                                                :country => "United Kingdom",
                                                :zipcode => "W1K1BE",
                                                :contactable => hilton_prime
                                               )
hilton_prime.contact_info = contact_info_for_hilton_prime
hilton_prime.save!
