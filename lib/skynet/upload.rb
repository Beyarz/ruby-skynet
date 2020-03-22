# frozen_string_literal: true

require_relative 'helper.rb'

# Module for handling outbound requests
module Upload
  extend Helper::Upload

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

  def upload_file(file_path, options = {})
    options = Helper::Upload.default_options
    options = Helper::Upload.default_options.merge(options) unless options.empty?
    return "File #{file_path} does not exist!" unless File.exist?(file_path)

    host = options[:portal_url]
    path = options[:portal_upload_path]
    filename = options[:custom_filename] || file_path

    url = "#{host}#{path}?filename=#{filename}"
    binary_content = IO.read(file_path, mode: 'rb')

    header_data = http_post_header({
      headers: {
        'Content-Disposition' => 'attachment; ' + filename
      },
      body: binary_content,
      options[:portal_file_fieldname] => filename
    })

    upload_request = HTTParty.post(url, header_data)
    parsed_request = upload_request.to_hash
    "Upload successful, skylink: " + parsed_request['skylink']
  end

  # def upload_directory(directory_path, options = {})
  #   options = Helper::Upload.default_options
  #   options = Helper::Upload.default_options.merge(options) unless options.empty?
  #   return "Given path is not a directory!" unless Dir.exist?(directory_path)

  #   directory_entries = Dir.glob("#{directory_path}/*")

  #   binary_content = IO.read(filename, mode: 'rb')

  #  header_data = http_post_header({
  #    headers: {
  #      'Content-Disposition' => 'attachment; ' + filename
  #    },
  #    body: binary_content,
  #    options[:portal_directory_fieldname] => filename
  #  })

  #   host = options[:portal_url]
  #   path = options[:portal_upload_path]
  #   dir_name = options[:custom_filename] || directory_path
  #   url = "#{host}#{path}?filename=#{dir_name}"

  #   upload_request = HTTParty.post(url, header_data)
  #   parsed_request = upload_request.to_hash
  #   "Upload successful, skylink: " + parsed_request['skylink']
  # end
end
