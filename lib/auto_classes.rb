module ConstMissingFindsClassifications
  def const_missing(name, nesting = nil)
    if name.to_sym === :Classification
      return super # avoid infinite loop
    end
    if classification = Classification.where(:name => name.to_s).first
      # cannot do Class.new(Product), no klass.name set (?!)
      eval %Q~class ::#{name} < Product;end~
      klass = const_get(name)
      classification.apply_to(klass)
    else
      super
    end
  end
end

class Object
  extend ConstMissingFindsClassifications
end
