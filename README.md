# Skynet gem

[![Gem Version](https://badge.fury.io/rb/ruby-skynet.svg)](https://badge.fury.io/rb/ruby-skynet)

Library for integrating Skynet into Ruby applications

## Installation

#### Gem

`gem install ruby-skynet`

#### Bundle

`bundle add ruby-skynet`

#### Gemfile

`gem 'ruby-skynet', '~> 1.3'`

## Docs

The documentation can be viewed from [here](https://beyarz.github.io/ruby-skynet/)

## Example

```ruby
require 'skynet'

# Upload
upload = Skynet.upload_file('src.jpg')
puts upload
#=> Upload successful, skylink: ABC123

# Download
download = Skynet.download_file("test/src.jpg", skylink)
puts download
#=> Download successful!
```

For more see [examples.md](EXAMPLES.md)

## Run unit test

`rake spec`

## Generate document

`rake rdoc`

### Regenerate document

`rake rerdoc`
