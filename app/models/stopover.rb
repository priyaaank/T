class Stopover

  include Mongoid::Document

  field :name, :type => String
  field :point_of_interest_type, :type => String
  field :point_of_interest, :type => Moped::BSON::ObjectId
  field :description, :type => String
  field :node_order, :type => Integer

  embedded_in :itinerary

  after_initialize :set_point_of_interest_metadata

  def point_of_interest_details
    point_of_interest_type.constantize.send(:find, point_of_interest)
  end

  private

  def set_point_of_interest_metadata
    self.point_of_interest_type = self.point_of_interest.class.name
    self.point_of_interest = self.point_of_interest.id
  end

end
