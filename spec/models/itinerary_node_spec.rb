require 'spec_helper'

describe ItineraryNode do
  
  context "attributes" do
    it { should respond_to :component_type }
    it { should respond_to :component_id   }
    it { should respond_to :name           }
    it { should respond_to :description    }
    it { should respond_to :node_order     }
    it { should respond_to :component      }
  end

  context "association with place" do

    before do
      #@eiffel_tower = Fabricate(:place)
      #@itinerary_node = Fabricate(:itinerary_node, :component => @eiffel_tower)
    end

    it "should return a place as a component when requested" do

    end

    it "should return 'place' as the component type" do

    end

    it "should return name assigned to the node" do

    end

    it "should return the description assigned to the node" do

    end

    it "should return place id as the component id when requested" do

    end

  end


end
