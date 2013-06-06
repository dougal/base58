# Base58
# Copyright (c) 2009 Douglas F Shearer.
# http://douglasfshearer.com
# Distributed under the MIT license as included with this plugin.

class Base58

  ALPHABET = "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
  BTC_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
  BASE = ALPHABET.length

  # Converts a base58 string to a base10 integer.
  def self.base58_to_int(base58_val, alphabet = ALPHABET)
    int_val = 0
    base58_val.reverse.split(//).each_with_index do |char,index|
      raise ArgumentError, 'Value passed not a valid Base58 String.' if (char_index = alphabet.index(char)).nil?
      int_val += (char_index)*(BASE**(index))
    end
    int_val
  end
  
  # Converts a bitcoin base58 string to a base10 integer.
  def self.btc_base_58_to_int(base58_val, alphabet = BTC_ALPHABET)
    self.base58_to_int(base58_val, alphabet)
  end

  # Converts a base10 integer to a base58 string.
  def self.int_to_base58(int_val, alphabet = ALPHABET)
    raise ArgumentError, 'Value passed is not an Integer.' unless int_val.is_a?(Integer)
    base58_val = ''
    while(int_val >= BASE)
      mod = int_val % BASE
      base58_val = alphabet[mod,1] + base58_val
      int_val = (int_val - mod)/BASE
    end
    alphabet[int_val,1] + base58_val
  end
  
  # Converts a base10 integer to a bitcoin base58 string.
  def self.btc_int_to_base58(int_val, alphabet = BTC_ALPHABET)
    self.int_to_base58(int_val, alphabet)
  end
  
  class << self
    alias_method :encode, :int_to_base58
    alias_method :decode, :base58_to_int
    alias_method :encode_btc, :btc_int_to_base58
    alias_method :decode_btc, :btc_base_58_to_int
  end
  
end
