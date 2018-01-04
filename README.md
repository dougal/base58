# Base58

Ruby gem for encoding/decoding integers to/from Base58. Supports Flickr, Bitcoin, and Ripple alphabets.


## Usage

Converting an integer into a Base58 string:

```ruby
Base58.encode(12345) # => "4ER"
```

Converting a Base58 string to the represented integer:

```ruby
Base58.decode("A2Ph") # => 6639914
```


## Installation

The package can be installed by adding scatter_swap to your list of dependencies in mix.exs:

```bash
gem install base58
```

Or add it to your Gemfile

```ruby
gem 'base58'
```

The run `bundle install`.


## What is Base58?

From [Wikipedia](https://en.wikipedia.org/wiki/Base58):

> Base58 is a group of binary-to-text encoding schemes used to represent large integers as alphanumeric text. It is similar to Base64 but has been modified to avoid both non-alphanumeric characters and letters which might look ambiguous when printed. It is therefore designed for human users who manually enter the data, copying from some visual source, but also allows easy copy and paste because a double-click will usually select the whole string.

Base58 alphabets are made up of the characters a-z, A-Z, and 0-9, with visually ambiguous characters (0, O, I, l) removed.


## Supported Alphabets

This library supports three of the most common Base58 alphabets, which have identical, but differently sorted characters.

The alphabet to be used can be selected by passing a symbol for the desired alphabet as a second argument to `Base58.encode` and `Base58.decode`.

```ruby
Base58.encode(12345, :bitcoin)
```


### Flickr

Identifier: `:flickr`

This is the default alphabet. Used to generate [Flickr short URLs](https://www.flickr.com/groups/api/discuss/72157616713786392/). The order of it's characters is numeric, lowercase-alpha, uppercase-alpha.

    123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ


### Bitcoin

Identifier: `:bitcoin`

The alphabet used by the [Bitcoin](https://en.wikipedia.org/wiki/Bitcoin) protocol. The order of it's characters is numeric, uppercase-alpha, lowercase-alpha.

    123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz


### Ripple

Identifier: `:ripple`

The alphabet used by the [Ripple protocol](https://en.wikipedia.org/wiki/Ripple_(payment_protocol)). The order of the characters were chosen such that the [low values match the primitives of the protocol](http://bitcoin.stackexchange.com/questions/14124/why-is-ripples-base58-alphabet-so-weird).

    rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz


## Contributing

Source repository is on [Github](https://github.com/dougal/base58), please file issues and pull requests there.


## Documentation

Documentation can be found online at [RubyDoc.info](http://www.rubydoc.info/github/dougal/base58).

Alternatively, you can generate docs from the project root with:

```bash
rake rdoc
```


## Credits

  * [Joel Nordell](https://github.com/joelnordell) for Bitcoin and Ripple alphabet support.


## Copyright and Licence

Copyright (c) 2009-2018, Douglas F Shearer.

Base58 is licensed under the MIT Licence.

