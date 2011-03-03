require 'ipaddr'

class Calculation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include IPLogic
  
  attr_accessor :cidr_notation_range
  
  validates_presence_of :cidr_notation_range
  validates_presence_of :cidr
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def cidr
    @cidr ||= (CIDR(cidr_notation_range) rescue nil)
  end
  
  def persisted?
    false
  end
end
