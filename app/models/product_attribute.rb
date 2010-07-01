class ProductAttribute < ActiveRecord::Base
  belongs_to :product
  belongs_to :attribute_definition

  validates_presence_of :value


  def self.for_definition(defi)
    where(:attribute_definition_id => defi.id).first
  end
end
