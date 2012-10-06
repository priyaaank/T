class Stopover

  include Mongoid::Document

  field :name, :type => String
  field :point_of_interest_type, :type => String
  field :point_of_interest_id, :type => Moped::BSON::ObjectId
  field :description, :type => String

  embedded_in :itinerary

  def point_of_interest_details
    point_of_interest_type.constantize.send(:find, point_of_interest_id)
  end

  def self.at(point_of_interest, name = nil, description = nil)
    Stopover.new(:name => name,
                 :description => description,
                 :point_of_interest_type => point_of_interest.class.name,
                 :point_of_interest_id => point_of_interest.id)
  end



end
