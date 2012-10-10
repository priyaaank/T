class Invite
  include Mongoid::Document

  field :email, :type => String

  validates_format_of :email, 
    :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, 
    :message => "email address is not valid"

end
