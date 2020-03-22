# frozen_string_literal: true

# https://sia.tech/docs/#skynet-skylink-skylink-get

require_relative 'helper.rb'

# Module for handling inbound requests
module Download
  HTTP_REDIRECT_PERMANENT = [301, 302].freeze
  extend Helper::Download

  def download_file(destination_path_name, skylink, options = nil, stream = true)
    options = Helper::Download.default_options if options.nil?

    portal  = options[:portal_url]
    skylink = Skynet.strip_prefix(skylink)
    url     = "#{portal}#{skylink}"

    file = File.open(destination_path_name, 'bw')
    HTTParty.get(url, follow_redirects: true, stream_body: stream) do |chunk|
      file.write chunk unless HTTP_REDIRECT_PERMANENT.include? chunk.code
      # file.write chunk.read unless HTTP_REDIRECT_PERMANENT.include?(chunk.code)
    end

    file.close
  end
end
