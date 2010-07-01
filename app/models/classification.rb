class Classification < ActiveRecord::Base
  validates_presence_of :name

  has_many :attribute_definitions


  def apply_to(klass)
    definitions = attribute_definitions

    klass.class_eval do
      definitions.each do |defi|

        attr_accessor defi.name.to_sym

      end
    end
  end

  def define_attribute!(name, data_type)
    attribute_definitions.create! :name => name.to_s, :data_type => data_type.to_s
  end
end
