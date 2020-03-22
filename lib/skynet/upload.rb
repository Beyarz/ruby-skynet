# frozen_string_literal: true

# https://sia.tech/docs/#skynet-skyfile-siapath-post

require_relative 'helper.rb'

# Module for handling outbound requests
module Upload
  extend Helper::Upload

  def upload_file(file_path, options = nil)
    options = Helper::Upload.default_options if options.nil?

    host = options[:portal_url]
    path = options[:portal_upload_path]
    filename = options[:custom_filename] || file_path

    url = "#{host}#{path}?filename=#{filename}"
    binary_content = IO.read(file_path, mode: 'rb')
    download_file = options[:download] == false ? 'inline' : 'attachment'

    data = {
      headers: {
        'Content-Disposition' => download_file,
        'Accept' => 'application/octet-stream',
        'Content-Type' => 'application/octet-stream'
      },
      body: binary_content
    }

    upload_request = HTTParty.post(url, data)
    parsed_request = upload_request.to_hash
    parsed_request['skylink']
  end

  def upload_directory(dir_path, options = nil)
    options = Helper::Upload.default_options if options.nil?
    puts 'Given path is not a directory' if Dir.exist?(dir_path)

    host = options[:portal_url]
    path = options[:portal_upload_path]
    filename = options[:custom_filename] || dir_path
    url = "#{host}#{path}?filename=#{filename}"

    data = {
      headers: {
        'Content-Disposition' => download_file,
        'Accept' => 'application/octet-stream',
        'Content-Type' => 'application/octet-stream'
      },
      body: binary_content
    }

    upload_request = HTTParty.post(url, data)
    parsed_request = upload_request.to_hash
    parsed_request['skylink']
  end
end
