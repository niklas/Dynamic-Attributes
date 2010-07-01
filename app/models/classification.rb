class Classification < ActiveRecord::Base
  validates_presence_of :name

  has_many :attribute_definitions


  def apply_to(klass) # klass < Product
    definitions = attribute_definitions

    klass.class_eval do

      definitions.each do |defi|

        define_method defi.name do
          read_extra_attribute(defi.name)
        end

        define_method "#{defi.name}=" do |new_value|
          write_extra_attribute(defi.name, new_value)
        end

      end
    end
  end

  def define_attribute!(name, data_type)
    attribute_definitions.create! :name => name.to_s, :data_type => data_type.to_s
  end
end
