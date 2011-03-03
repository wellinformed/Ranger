require 'ipaddr'

class Calculation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :cidr_notation_range
  
  validates_presence_of :cidr_notation_range
  validates_format_of :cidr_notation_range, :with => /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}\/\d{1,2}$/i
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
  def start_of_range
    IPAddr.new(self.cidr_notation_range).to_range.first
  end

  def end_of_range
    IPAddr.new(self.cidr_notation_range).to_range.last
  end
end