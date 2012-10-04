class ItineraryNode

  include Mongoid::Document

  field :name, :type => String
  field :component_type, :type => String
  field :component_id, :type => Moped::BSON::ObjectId
  field :description, :type => String
  field :node_order, :type => Integer

  def component

  end

end
