module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, options = nil)
      @validations ||= []
      @validations << { name: name, type: type, options: options }
    end

    def validations
      @validations || []
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get(:"@#{validation[:name]}")
        send(validation[:type], validation[:name], value, *validation[:options])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(name, value)
      raise "#{name} cannot be empty!" if value.nil? || value.empty?
    end

    def type_format(name, value, format)
      raise "#{name} has invalid format!" unless value =~ format
    end

    def type_class(name, value, clas)
      raise "#{name} has the wrong type!" unless value.is_a?(clas)
    end
  end
end
