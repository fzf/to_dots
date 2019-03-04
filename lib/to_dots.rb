require "to_dots/version"
require_relative './hash'
require_relative './array'

module ToDots
  def self.to_dots(object, result = [], prefix = '')
    case object
    when ::Hash
      object.each do |key, value|
        to_dots(value, result, "#{prefix}#{'.' unless prefix.empty?}#{key}")
      end
    when ::Array
      object.each_with_index do |value, index|
        to_dots(value, result, "#{prefix}")
      end
    else
      result << "#{prefix}.#{object}"
    end
    result
  end
end
