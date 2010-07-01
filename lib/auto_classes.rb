def Object.const_missing(name)
  if classification = Classification.where(:name => name.to_s).first
    klass = Class.new(Product)
    classification.apply_to(klass)
    klass
  else
    super
  end
end
