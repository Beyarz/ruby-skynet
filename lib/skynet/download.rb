# frozen_string_literal: true

require_relative 'helper.rb'

# Module for handling inbound requests
module Download
  HTTP_REDIRECT_PERMANENT = [301, 302].freeze
  extend Helper::Download

  def download_file(file_name, skylink, options = {}, stream = true)
    options = Helper::Download.default_options
    options = Helper::Download.default_options.merge(options) unless options.empty?

    portal  = options[:portal_url]
    skylink = Skynet.strip_prefix(skylink)
    url = "#{portal}#{skylink}?attachment=#{options[:download]}"

    File.open(file_name, 'w') do |file|
      HTTParty.get(url, follow_redirects: true, stream_body: stream) do |chunk|
        file << chunk unless HTTP_REDIRECT_PERMANENT.include? chunk.code
      end
    end

    'Download successful!'
  end
end
