class Classification < ActiveRecord::Base
  validates_presence_of :name


  def apply_to(klass)
    # TODO create attr_accessors
  end
end
