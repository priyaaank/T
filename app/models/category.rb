class Category

  include Mongoid::Document

  field :name, :type => String
  field :identifier, :type => String

  belongs_to :place

  before_save :downcase_underscorize_and_assign_identifier


  private

  def downcase_underscorize_and_assign_identifier
    self.identifier = (identifier||name).gsub(/\s+/,'').underscore
  end

end
