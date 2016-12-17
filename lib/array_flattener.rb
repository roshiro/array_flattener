# Class that handles array flattening.
class ArrayFlattener
  # Flattens array containing nested arrays.
  #
  # Examples of usage:
  #   ArrayFlattener.flatten(nil)                => []
  #   ArrayFlattener.flatten([[1,2,[3]],4])      => [1,2,3,4]
  #   ArrayFlattener.flatten([[1,2,[3, [4]]]])   => [1,2,3,4]
  #   ArrayFlattener.flatten([[[1],2,[3, [4]]]]) => [1,2,3,4]
  #   ArrayFlattener.flatten([1,2,[3]], [98, 99])=> [1,2,3,98,99]
  #
  # @param nested_array [Array] the array to be flattened
  # @return [Array] the flattened array
  def self.flatten(nested_array)
    result = []
    (nested_array || []).each do |item|
      if item.kind_of?(Array)
        result.concat(flatten(item))
      else
        result << item
      end
    end
    result
  end
end
