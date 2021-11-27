# frozen_string_literal: true

require_relative 'helper'

# Module for handling outbound requests
module Upload
  extend Helper::Upload

  # Default headers provided for uploading files,
  # any argument provided is merged with the default values
  def http_post_header(data = {})
    default_data = {
      headers: {
        'Accept' => 'application/octet-stream',
        'Content-Type' => 'application/octet-stream',
        'Transfer-Encoding' => 'gzip, chunked'
      }
    }

    default_data.merge(data) unless data.empty?
  end

  # Uploads file to the skynet, file_path is required but options are optional since default values are provided
  def upload_file(file_path, override_options = {})
    options = Helper::Upload.default_options
    options = Helper::Upload.default_options.merge(override_options) unless override_options.empty?
    return "File #{file_path} does not exist!" unless File.exist?(file_path)

    host = options[:portal_url]
    path = options[:portal_upload_path]
    filename = options[:custom_filename] || file_path
    filename = Helper::Upload.strip_dotslash_path(filename)

    url = "#{host}#{path}?filename=#{filename}"
    binary_content = IO.readlines(file_path, mode: 'rb').join

    header_data = http_post_header({
                                     headers: {
                                       'Content-Disposition' => "attachment; filename='#{filename}'"
                                     },
                                     body: binary_content,
                                     options[:portal_file_fieldname] => filename
                                   })

    upload_request = HTTParty.post(url, header_data)
    parsed_request = upload_request.to_hash
    "Upload successful, skylink: #{parsed_request['skylink']}"
  end
end
