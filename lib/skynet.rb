# frozen_string_literal: true

require 'httparty'
require_relative 'skynet/download.rb'
require_relative 'skynet/upload.rb'

# The entrypoint for the SDK
class Skynet
  URI_SKYNET_PREFIX = 'sia://'

  extend Download
  extend Upload

  def self.strip_prefix(str)
    if str.index(URI_SKYNET_PREFIX).nil?
      str.delete_prefix(URI_SKYNET_PREFIX)
    else
      str
    end
  end
end
