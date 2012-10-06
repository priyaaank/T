class CreateBaseCategories < Mongoid::Migration
  def self.up
    ["Monument", "Hotel", "Nightlife", "Park", "Coffee Shop", "Restaurant"].each do |category|
      Category.create!(:name => category)
    end
  end

  def self.down
    Category.destory_all
  end
end
