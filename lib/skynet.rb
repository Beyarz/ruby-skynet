# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'httparty'
require_relative 'skynet/download.rb'
require_relative 'skynet/upload.rb'

# The main class for the SDK
class Skynet
  URI_SKYNET_PREFIX = 'sia://'

  include Download
  include Upload

  def strip_prefix(str)
    if str.index(URI_SKYNET_PREFIX).zero?
      str.delete_prefix(URI_SKYNET_PREFIX)
    else
      str
    end
  end
end
