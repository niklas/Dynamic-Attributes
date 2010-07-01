class AttributeDefinition < ActiveRecord::Base
  validates_presence_of :name
  # FIXME hier fehlen noch \a \z .. case grad verpeilt
  validates_format_of :name, :with => /[a-z]+/

  validates_inclusion_of :data_type, :in => %w(String Integer) # usw
end
