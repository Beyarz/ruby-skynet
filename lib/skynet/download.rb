# frozen_string_literal: true

require_relative 'helper'

# Module for handling inbound requests
module Download
  # Array with http redirect & http permanent code
  # Used to determine if the GET request should start downloading or follow redirect
  HTTP_REDIRECT_PERMANENT = [301, 302].freeze
  extend Helper::Download

  # Download file from the skynet portal
  # file_name & skylink is required, the rest is optional since they come with default values
  def download_file(file_name, skylink, override_options = {}, stream: true)
    options = Helper::Download.default_options
    options = Helper::Download.default_options.merge(override_options) unless override_options.empty?

    portal  = options[:portal_url]
    skylink = Helper::Download.strip_prefix(skylink)
    url = "#{portal}#{skylink}?attachment=#{options[:download]}"

    File.open(file_name, 'w') do |file|
      HTTParty.get(url, follow_redirects: true, stream_body: stream) do |chunk|
        file << chunk unless HTTP_REDIRECT_PERMANENT.include? chunk.code
      end
    end

    'Download successful!'
  end
end
