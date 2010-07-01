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

  def define_attribute!(attribute_name, data_type)
    Object.remove_const_if_exists(name)
    attribute_definitions.create! :name => attribute_name.to_s, :data_type => data_type.to_s
  end

  protected

  before_validation :constant_must_not_be_defined, :on => :create
  def constant_must_not_be_defined
    if name.present?
      if Object.const_defined?(name.to_sym)
        errors.add :name, "already defined #{name}"
      end
    end
  end

  after_destroy :remove_constant
  def remove_constant
    Object.remove_const_if_exists(name)
  end
end
