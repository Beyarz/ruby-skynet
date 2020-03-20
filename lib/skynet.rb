# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'httparty'
require_relative 'skynet/download.rb'
require_relative 'skynet/upload.rb'

# The main class for the SDK
class Skynet
  include Download
  include Upload

  URI_SKYNET_PREFIX = 'sia://'
  alias URI_SKYNET_PREFIX uri_skynet_prefix

  # def uri_skynet_prefix
    # 'sia://'
  # end

  def strip_prefix(str)
    if str.index(uri_skynet_prefix).zero?
      str.delete_prefix(uri_skynet_prefix)
    else
      str
    end
  end
end
