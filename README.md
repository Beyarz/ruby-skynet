# Skynet gem

Library for integrating Skynet into Ruby applications

## Docs

The documentation can be viewed from [here](https://beyarz.github.io/ruby-skynet/)

## Example

```ruby
require 'ruby-skynet'

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

`rake rdoc``

### Regenerate document

`rake rerdoc`
