# Txt2img

Generate image from text

## Installation

Install Imagemagick 

    sudo apt-get install imagemagick

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

![hello.gif](http://dl.iteye.com/upload/attachment/0063/4250/34a1f8b8-2532-3c42-a0ed-fe49db580bca.gif)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
