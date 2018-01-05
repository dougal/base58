# Base58
# Copyright (c) 2009 Douglas F Shearer.
# http://douglasfshearer.com
# Distributed under the MIT license as included with this plugin.

class Base58

  # See https://en.wikipedia.org/wiki/Base58
  ALPHABETS = {
    flickr:  "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ", # This is the default
    bitcoin: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz", # Also used for IPFS
    ripple:  "rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz"
  }

  # NOTE: If adding new alphabets of non-standard length, this should become a method.
  BASE = ALPHABETS[:flickr].length

  # Converts a base58 string to a base10 integer.
  def self.base58_to_int(base58_val, alphabet = :flickr)
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    int_val = 0
    base58_val.reverse.split(//).each_with_index do |char,index|
      raise ArgumentError, 'Value passed not a valid Base58 String.' if (char_index = ALPHABETS[alphabet].index(char)).nil?
      int_val += (char_index)*(BASE**(index))
    end
    int_val
  end

  # Converts a base10 integer to a base58 string.
  def self.int_to_base58(int_val, alphabet = :flickr)
    raise ArgumentError, 'Value passed is not an Integer.' unless int_val.is_a?(Integer)
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    base58_val = ''
    while(int_val >= BASE)
      mod = int_val % BASE
      base58_val = ALPHABETS[alphabet][mod,1] + base58_val
      int_val = (int_val - mod)/BASE
    end
    ALPHABETS[alphabet][int_val,1] + base58_val
  end

  # Converts a ASCII-8BIT (binary) encoded string to a base58 string.
  def self.binary_to_base58(binary_val, alphabet = :flickr)
    raise ArgumentError, 'Value passed is not a String.' unless binary_val.is_a?(String)
    raise ArgumentError, 'Value passed is not binary.' unless binary_val.encoding == Encoding::BINARY
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    int_to_base58(binary_val.bytes.inject{|a,b|(a<<8)+b}, alphabet)
  end

  # Converts a base58 string to an ASCII-8BIT (binary) encoded string.
  def self.base58_to_binary(base58_val, alphabet = :flickr)
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    [base58_to_int(base58_val, alphabet).to_s(16)].pack('H*')
  end

  class << self
    alias_method :encode, :int_to_base58
    alias_method :decode, :base58_to_int
  end

end
