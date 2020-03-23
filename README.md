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
download = Skynet.download_file("test/src.jpg", skylink)
puts download
#=> Download successful!
```

For more see [examples.md](EXAMPLES.md)
