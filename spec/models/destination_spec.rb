require 'spec_helper'

describe Destination do
  
  context "attributes" do
    it { should respond_to :categories          }
    it { should respond_to :photos              }
    it { should respond_to :tips                }
    it { should respond_to :reviews             }
    it { should respond_to :location            }
    it { should respond_to :alternate_names     }
    it { should respond_to :contact_info        }
    it { should respond_to :user               }
    it { should respond_to :stats               }
    it { should respond_to :updated_at          }
    it { should respond_to :created_at          }
    it { should respond_to :name                }
  end

  context "owner" do

  end


end
