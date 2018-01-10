# Base58
# Copyright (c) 2009 - 2018 Douglas F Shearer.
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
  def self.binary_to_base58(binary_val, alphabet = :flickr, include_leading_zeroes = true)
    raise ArgumentError, 'Value passed is not a String.' unless binary_val.is_a?(String)
    raise ArgumentError, 'Value passed is not binary.' unless binary_val.encoding == Encoding::BINARY
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    return int_to_base58(0, alphabet) if binary_val.empty?

    if include_leading_zeroes
      nzeroes = binary_val.bytes.find_index{|b| b != 0} || binary_val.length-1
      prefix = ALPHABETS[alphabet][0] * nzeroes
    else
      prefix = ''
    end

    prefix + int_to_base58(binary_val.unpack('H*')[0].to_i(16), alphabet)
  end

  # Converts a base58 string to an ASCII-8BIT (binary) encoded string.
  # All leading zeroes in the base58 input are preserved and converted to
  # "\x00" in the output.
  def self.base58_to_binary(base58_val, alphabet = :flickr)
    raise ArgumentError, 'Invalid alphabet selection.' unless ALPHABETS.include?(alphabet)
    nzeroes = base58_val.chars.find_index{|c| c != ALPHABETS[alphabet][0]} || base58_val.length-1
    prefix = nzeroes < 0 ? '' : '00' * nzeroes
    [prefix + Private::int_to_hex(base58_to_int(base58_val, alphabet))].pack('H*')
  end

  module Private
    def self.int_to_hex int
      hex = int.to_s(16)
      # The hex string must always consist of an even number of characters,
      # otherwise the pack() parsing will be misaligned.
      (hex.length % 2 == 0) ? hex : ('0'+hex)
    end
  end

  class << self
    alias_method :encode, :int_to_base58
    alias_method :decode, :base58_to_int
  end

end
