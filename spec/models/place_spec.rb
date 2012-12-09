require 'spec_helper'

describe Place do
  
  context "attributes" do
    it { should respond_to :categories          }
    it { should respond_to :photos              }
    it { should respond_to :tips                }
    it { should respond_to :reviews             }
    it { should respond_to :location            }
    it { should respond_to :alternate_names     }
    it { should respond_to :contact_info        }
    it { should respond_to :user                }
    it { should respond_to :stat_group          }
    it { should respond_to :updated_at          }
    it { should respond_to :created_at          }
    it { should respond_to :name                }
  end

  context "owner" do

  end

  context "hierarchy" do

    let(:france) { Fabricate(:france) }

    it "should not allow place with sub-places to be deleted" do
      eiffel_tower = Fabricate(:place, :parent => france)
      
      lambda {france.destroy}.should raise_error(Mongoid::Ancestry::Error)
    end

    it "should allow place to be deleted if no children exists" do
      france.destroy.should be_true
    end

  end


end
