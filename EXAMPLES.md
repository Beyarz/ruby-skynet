# Examples

## Upload

```ruby
require 'skynet'

# Upload to another portal & change filename
skylink = Skynet.upload_file('./development.png', {
  portal_url: 'https://somewhere.else.tech/',
  custom_filename: 'production.png'
})

# skylink = Skynet.upload_directory('test/')
```

## Download

```ruby
require 'skynet'

# Download from specific portal
Skynet.download_file("/var/www/html/src.jpg", skylink, {
  portal_url: 'https://somewhere.else.tech/'
})

# Naturally, the content is fragmented and streamed to you from the source.
# Setting "stream" to "false" disables that so the fragments is loaded
# into the memory first then downloads the fully assembled content.
Skynet.download_file("/var/www/html/src.jpg", skylink, stream = false)
```
