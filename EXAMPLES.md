# Examples

## Upload

```ruby
require 'skynet'

skylink = Skynet.upload_file('development.png', {
  portal_url: 'https://somewhere.else.tech/',
  custom_filename: 'production.png'
})

# skylink = Skynet.upload_directory('test/')
```

## Download

```ruby
require 'skynet'

Skynet.download_file("demo/src.jpg", skylink)

# By default, the content is fragmented and streamed to you from the source. This disables that
# and loads the fragments into the memory first then downloads the fully assembled content.
Skynet.download_file("demo/src.jpg", skylink, stream = false)

Skynet.download_file("demo/src.jpg", skylink, {
  portal_url: 'https://somewhere.else.tech/'
})
```
