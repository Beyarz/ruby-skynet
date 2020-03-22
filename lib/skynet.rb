# frozen_string_literal: true

require 'httparty'
require 'json'

require_relative 'skynet/download.rb'
require_relative 'skynet/upload.rb'

# The entrypoint for the SDK
class Skynet
  URI_SKYNET_PREFIX = 'sia://'

  extend Download
  extend Upload

  def strip_prefix(str)
    if str.index(URI_SKYNET_PREFIX).zero?
      str.delete_prefix(URI_SKYNET_PREFIX)
    else
      str
    end
  end
end
