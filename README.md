# Skynet gem

Library for integrating Skynet into Ruby applications

## Example

```ruby
require 'skynet'

# Upload
upload = Skynet.upload_file('src.jpg')
puts upload
#=> Upload successful, skylink: ABC123

# Download
download = Skynet.download_file("demo/src.jpg", skylink)
puts download
#=> Download successful!
```

For more see [examples.md](EXAMPLES.md)

## Build

`gem build skynet.gemspec`\
`gem install Skynet-0.0.1.gem`

## Todo

- Contribute with Ruby example to [skynet-portal](https://github.com/NebulousLabs/skynet-webportal/blob/master/src/components/CodeExamples/Code.js)
