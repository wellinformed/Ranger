class Calculation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include IPLogic
  
  attr_accessor :cidr_notation_range
  
  validates_presence_of :cidr_notation_range
  
  def initialize(attributes = {})
	@cidr_notation_range = attributes["cidr_notation_range"]
  end

  def cidr
	@cidr ||= CIDR[@cidr_notation_range]
  end
  
  def persisted?
	false
  end
end
