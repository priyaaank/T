require 'spec_helper'

describe Invite do

  context "email" do

    it { should respond_to :email }
    it { should validate_format_of(:email).with("john@example.com") }
    it { should validate_format_of(:email).with("john@example.co.in") }
    it { should validate_format_of(:email).not_with("johnexample.com").with_message("email address is not valid") }
    it { should validate_format_of(:email).not_with("johnexample@com").with_message("email address is not valid") }
    it { should validate_format_of(:email).not_with("").with_message("email address is not valid") }
    it { should validate_format_of(:email).not_with(nil) }

  end

end
