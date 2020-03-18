# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'httparty'

# The main class for the SDK
class Skynet
  def uri_skynet_prefix
    'sia://'
  end

  def strip_prefix(str)
    if str.index(uri_skynet_prefix).zero?
      str.delete_prefix(uri_skynet_prefix)
    else
      str
    end
  end

  def default_upload_options
    {
      portal_url: 'https://siasky.net',
      portal_upload_path: 'skynet/skyfile',
      portal_file_fieldname: 'file',
      portal_directory_file_fieldname: 'files[]',
      custom_filename: ''
    }
  end

  def default_download_options
    {
      portal_url: 'https://siasky.net'
    }
  end

  def upload_file_request(path, options = nil)
    options = default_upload_options if options.nil?

    file = File.open(path, 'rb')
    file.close
    host = options[:portal_url]
    path = options[:portal_upload_path]
    url = "#{host}/#{path}"

    req = HTTParty.post(url, options[:portal_file_fieldname])
    req
  end

  def upload_file(path, options = nil)
    upload_request = upload_file_request(path, options).to_json
    parsed_request = JSON.parse(upload_request)
    uri_skynet_prefix + parsed_request['skylink']
  end

  def upload_file_request_with_chunks(path, options = nil)
    options = default_upload_options if options.nil?

    file = options[:custom_filename] || path
    req = HTTParty.post(
      "#{options[:portal_url]}/#{options[:portal_upload_path]}?filename=#{file}"
    )
    req
  end

  def walk_directory(path)
    files = {}

    for
  end

  def upload_directory_request(path, options = nil)
    if Dir.exist?(path)
      puts "Given path is not a directory"
    end

    if options.nil?
      options = default_upload_options
    end

    ftuples = []
    files =
  end

  def upload_directory(path, options = nil)
    r = upload_directory_request(path, options)
    parsed_r = JSON.parse(r.to_json)
    sia_url = "#{uri_skynet_prefix}#{parsed_r['skylink']}"
  end

  def download_file(path, skylink, options = nil); end

  def download_file_request(skylink, options = nil, stream = false); end
end
