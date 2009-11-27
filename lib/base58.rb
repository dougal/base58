# Base58
# Copyright (c) 2009 Douglas F Shearer.
# http://douglasfshearer.com
# Distributed under the MIT license as included with this plugin.

class Base58

  ALPHABET = "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
  BASE = ALPHABET.length

  # Converts a base58 string to a base10 integer.
  def self.base58_to_int(base58_val)
    int_val = 0
    base58_val.reverse.split(//).each_with_index do |char,index|
      int_val += (ALPHABET.index(char))*(BASE**(index))
    end
    int_val
  end

  # Converts a base10 integer to a base58 string.
  def self.int_to_base58(int_val)
    raise ArgumentError, 'Value passed is not an Integer.' unless int_val.is_a?(Integer)
    base58_val = ''
    while(int_val >= BASE)
      mod = int_val % BASE
      base58_val = ALPHABET[mod,1] + base58_val
      int_val = (int_val - mod)/BASE
    end
    ALPHABET[int_val,1] + base58_val
  end
  
end
