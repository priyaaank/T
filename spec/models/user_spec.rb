require 'spec_helper'

describe User do

  context "attributes" do
    
    it { should respond_to :email }
    it { should respond_to :encrypted_password }
    it { should respond_to :reset_password_sent_at }
    it { should respond_to :reset_password_token }
    it { should respond_to :remember_created_at }
    it { should respond_to :confirmation_sent_at }
    it { should respond_to :confirmed_at }
    it { should respond_to :confirmation_token }

  end

end
