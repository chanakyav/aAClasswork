class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      inst_var = '@'+name.to_s

      define_method(name) do # Getters
        instance_variable_get(inst_var)
      end

      sttr_name = (name.to_s + '=').to_sym
      define_method(sttr_name) do |value| # Setters
        instance_variable_set(inst_var, value)
      end
    end
  end
end
