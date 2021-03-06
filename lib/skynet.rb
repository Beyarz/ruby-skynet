# frozen_string_literal: true

require 'httparty'
require_relative 'skynet/download.rb'
require_relative 'skynet/upload.rb'

# The entrypoint for the SDK
class Skynet

  # Prefix for the protocol
  URI_SKYNET_PREFIX = 'sia://'

  extend Download
  extend Upload

  # Removes the Skynet::URI_SKYNET_PREFIX constant from string
  def self.strip_prefix(str)
    return nil if str.nil?

    if str.index(URI_SKYNET_PREFIX).nil?
      str
    else
      str.delete_prefix(URI_SKYNET_PREFIX)
    end
  end
end
