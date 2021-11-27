# frozen_string_literal: true

require 'httparty'
require_relative 'skynet/download'
require_relative 'skynet/upload'

# The entrypoint for the SDK
class Skynet
  extend Download
  extend Upload
end
