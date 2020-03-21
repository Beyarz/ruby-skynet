# frozen_string_literal: true

# https://sia.tech/docs/#skynet-skyfile-siapath-post

# Module for handling outbound requests
module Upload
  def default_upload_options
    {
      portal_url: 'https://siasky.net',
      portal_upload_path: 'skynet/skyfile',
      portal_file_fieldname: 'file',
      portal_directory_file_fieldname: 'files[]',
      custom_filename: ''
    }
  end

  def upload_file(local_file_path, options = nil)
    options = default_upload_options if options.nil?

    host = options[:portal_url]
    path = options[:portal_upload_path]
    file = options[:custom_filename] || local_file_path
    url  = "#{host}/#{path}?filename=#{file}"

    file_binary = IO.read(local_file_path, mode: 'rb')
    post_header = {
      files: {
        options[:portal_file_fieldname] => file_binary
      }
    }

    upload_request = HTTParty.post(url, post_header).to_json
    parsed_request = JSON.parse(upload_request)

    Skynet::URI_SKYNET_PREFIX + parsed_request['skylink']
  end

  def upload_file_request_with_chunks(local_file_path, options = nil)
    options = default_upload_options if options.nil?

    host = options[:portal_url]
    path = options[:portal_upload_path]
    file = options[:custom_filename] || local_file_path
    url = "#{host}/#{path}?filename=#{file}"

    post_header = {
      headers: {
        'Content-Type' => 'application/octet-stream',
        'data' => local_file_path
      }
    }

    req = HTTParty.post(url, post_header)
    req
  end

  def upload_directory(path, options = nil)
    options = default_upload_options if options.nil?
    puts 'Given path is not a directory' if Dir.exist?(path)

    filename = options[:custom_filename] || path

    host = options[:portal_url]
    path = options[:portal_upload_path]
    url  = "#{host}/#{path}?filename=#{filename}"

    r = HTTParty.post(url, files)
    parsed_r = JSON.parse(r.to_json)
    sia_url = "#{Skynet::URI_SKYNET_PREFIX}#{parsed_r['skylink']}"
    sia_url
  end
end
