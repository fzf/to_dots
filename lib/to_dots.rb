require "to_dots/version"
require_relative './hash'
require_relative './array'

module ToDots
  def self.to_dots(object, result = [], prefix = '')
    if object.respond_to?(:to_hash)
      object.each do |key, value|
        to_dots(value, result, "#{prefix}#{'.' unless prefix.empty?}#{key}")
      end
    elsif object.is_a?(Array)
      object.each do |value|
        to_dots(value, result, prefix.to_s)
      end
    else
      result << "#{prefix}.#{object}"
    end
    result
  end
end
