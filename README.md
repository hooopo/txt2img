# Txt2img

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'txt2img'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install txt2img

## Usage

```ruby
require 'txt2img'
txt = Txt2img::Txt.new("你好世界" * 100)
txt.write("hello.gif")
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
