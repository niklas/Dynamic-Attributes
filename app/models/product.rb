class Product < ActiveRecord::Base
  has_many :product_attributes


  def self.classification
    Classification.find_by_name(self.name)
  end

  def classification
    self.class.classification
  end

  after_save :save_extra_attributes
  def save_extra_attributes
    product_attributes.each(&:save)
  end

  def read_extra_attribute(attribute_name)
    extra_attribute_value_for_attribute(attribute_name).value
  end

  def write_extra_attribute(attribute_name, value)
    extra_attribute_value_for_attribute(attribute_name).value = value
  end

  # Fetches or creates the record that holds this exta attribute's value
  def extra_attribute_value_for_attribute(attribute_name)
    pa = product_attributes.detect{|pa| pa.attribute_definition.name.to_sym == attribute_name}
    if pa.nil?  
      defi = find_attribute_definition(attribute_name)
      pa = product_attributes.build(:attribute_definition => defi)
      pa.product = self
      pa.value = self.class.classifications.attribute_definitions.find_by_name(attribute_name).default
      efv.save
    end
    efv
  end

  def find_attribute_definition(attribute_name)
    classification.attribute_definitions.find_by_name(attribute_name)
  end

end
