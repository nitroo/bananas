# Bananas

Bananas is a library for displaying monkey patches defined on a given tree of objects. It uses simple criterion to introspect an object for externally-defined methods. It is intended to be used for debugging

## Installation

Bananas is available as a gem from RubyGems.

```sh
$ gem install bananas
```

## Usage

Bananas can be used as a module

```ruby
require "bananas"
Bananas.monkey_patches
```

or via the command line.

```sh
$ bananas --help
usage: bananas.rb [options]
    -m, --module [MOD]               The module to search for monkey patches. Required.
    -r, --require X,Y,Z              The list of dependencies to search with.
    -h, --help                       Print this message.
```